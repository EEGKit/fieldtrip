function [cfg, artifact] = ft_artifact_zvalue(cfg, data)

% FT_ARTIFACT_ZVALUE scans data segments of interest for artifacts, by means of
% thresholding the z-scored values of signals that have been preprocessed,
% using heuristics that increase the sensitivity to detect certain types of artifacts.
% Depending on the preprocessing options, this method will be sensitive to EOG, muscle 
% or SQUID jump artifacts. The z-scoring is applied in order to make the threshold
% independent of the phsyical units in the data.
%
% Use as
%   [cfg, artifact] = ft_artifact_zvalue(cfg)
% with the configuration options
%   cfg.trl        = structure that defines the data segments of interest, see FT_DEFINETRIAL
%   cfg.continuous = 'yes' or 'no' whether the file contains continuous data.
%                    If the data has not been recorded continuously, then the cfg.trl should
%                    stricly observe the boundaries of the discontinuous segments, and the 
%                    permitted values padding options (described below) are restricted to 0. 
%   cfg.dataset    = string with the filename
% or
%   cfg.headerfile = string with the filename
%   cfg.datafile   = string with the filename
% and optionally
%   cfg.headerformat
%   cfg.dataformat
%
% Alternatively you can use it as
%   [cfg, artifact] = ft_artifact_zvalue(cfg, data)
% where the input data is a structure as obtained from FT_PREPROCESSING. Any preprocessing options
% defined in the cfg will be applied to the data before the z-scoring and thresholding.
%
% In both cases the configuration should also contain
%   cfg.trl        = structure that defines the data segments of interest, see FT_DEFINETRIAL
%   cfg.continuous = 'yes' or 'no' whether the file contains continuous data
% and
%   cfg.artfctdef.zvalue.channel    = Nx1 cell-array with selection of channels, see FT_CHANNELSELECTION for details
%   cfg.artfctdef.zvalue.cutoff     = number, z-value threshold
%   cfg.artfctdef.zvalue.trlpadding = number in seconds
%   cfg.artfctdef.zvalue.fltpadding = number in seconds
%   cfg.artfctdef.zvalue.artpadding = number in seconds
%
% If you encounter difficulties with memory usage, you can use
%   cfg.memory = 'low' or 'high', whether to be memory or computationally efficient, respectively (default = 'high')
%
% The optional configuration settings (see below) are:
%   cfg.artfctdef.zvalue.artfctpeak       = 'yes' or 'no'
%   cfg.artfctdef.zvalue.artfctpeakrange  = [begin end]
%   cfg.artfctdef.zvalue.interactive      = 'yes' or 'no'
%   cfg.artfctdef.zvalue.zscore           = 'yes' (default) or 'no'
%   cfg.artfctdef.zvalue.keepintermediate = 'no' (default) or 'yes'
%
% If you specify cfg.artfctdef.zvalue.artfctpeak='yes', a peak detection on the suprathreshold
% z-scores will be performed, and the artifact will be defined relative to
% the peak, where the begin and end points will be defined by
% cfg.artfctdef.zvalue artfctpeakrange, rather than by the time points that
% exceed the threshold.
%
% You can specify cfg.artfctdef.zvalue.artfctpeakrange if you want to use the
% detected artifacts as input to the DSS method of FT_COMPONENTANALYSIS. The result
% is saved into cfg.artfctdef.zvalue.artifact. The range will automatically
% respect the trial boundaries, i.e. it will be shorter if peak is near the beginning
% or end of a trial. Samples between trials will be removed, thus this will not match
% the sampleinfo of the data structure.
%
% If you specify cfg.artfctdef.zvalue.zscore = 'no', the data will NOT be z-scored prior
% to thresholding. This goes a bit against the name of the function, but it may be useful
% if the threshold is to be defined in meaningful physical units, e.g. degrees of visual
% angle for eye position data.
%
% If you specify cfg.artfctdef.zvalue.keepintermediate = 'yes', the intermediate data
% that has been used for the artifacts' definition will be passed to the output. This
% allows for the (potentially lengthy) computations to be uncoupled from the interactive
% part.
%
% If you specify cfg.artfctdef.zvalue.interactive = 'yes', a graphical user interface
% will show in which you can manually accept/reject the detected artifacts, and/or
% change the threshold. To control the graphical interface via keyboard, use the
% following keys:
%
%     q                 : Stop
%
%     comma             : Step to the previous artifact trial
%     a                 : Specify artifact trial to display
%     period            : Step to the next artifact trial
%
%     x                 : Step 10 trials back
%     leftarrow         : Step to the previous trial
%     t                 : Specify trial to display
%     rightarrow        : Step to the next trial
%     c                 : Step 10 trials forward
%
%     k                 : Keep trial
%     space             : Mark complete trial as artifact
%     r                 : Mark part of trial as artifact
%
%     downarrow         : Shift the z-threshold down
%     z                 : Specify the z-threshold
%     uparrow           : Shift the z-threshold down
%
% Configuration settings related to the preprocessing of the data are
%   cfg.artfctdef.zvalue.lpfilter      = 'no' or 'yes'  lowpass filter
%   cfg.artfctdef.zvalue.hpfilter      = 'no' or 'yes'  highpass filter
%   cfg.artfctdef.zvalue.bpfilter      = 'no' or 'yes'  bandpass filter
%   cfg.artfctdef.zvalue.bsfilter      = 'no' or 'yes'  bandstop filter for line noise removal
%   cfg.artfctdef.zvalue.dftfilter     = 'no' or 'yes'  line noise removal using discrete fourier transform
%   cfg.artfctdef.zvalue.medianfilter  = 'no' or 'yes'  jump preserving median filter
%   cfg.artfctdef.zvalue.lpfreq        = lowpass  frequency in Hz
%   cfg.artfctdef.zvalue.hpfreq        = highpass frequency in Hz
%   cfg.artfctdef.zvalue.bpfreq        = bandpass frequency range, specified as [low high] in Hz
%   cfg.artfctdef.zvalue.bsfreq        = bandstop frequency range, specified as [low high] in Hz
%   cfg.artfctdef.zvalue.lpfiltord     = lowpass  filter order
%   cfg.artfctdef.zvalue.hpfiltord     = highpass filter order
%   cfg.artfctdef.zvalue.bpfiltord     = bandpass filter order
%   cfg.artfctdef.zvalue.bsfiltord     = bandstop filter order
%   cfg.artfctdef.zvalue.medianfiltord = length of median filter
%   cfg.artfctdef.zvalue.lpfilttype    = digital filter type, 'but' (default) or 'firws' or 'fir' or 'firls'
%   cfg.artfctdef.zvalue.hpfilttype    = digital filter type, 'but' (default) or 'firws' or 'fir' or 'firls'
%   cfg.artfctdef.zvalue.bpfilttype    = digital filter type, 'but' (default) or 'firws' or 'fir' or 'firls'
%   cfg.artfctdef.zvalue.bsfilttype    = digital filter type, 'but' (default) or 'firws' or 'fir' or 'firls'
%   cfg.artfctdef.zvalue.detrend       = 'no' or 'yes'
%   cfg.artfctdef.zvalue.demean        = 'no' or 'yes'
%   cfg.artfctdef.zvalue.baselinewindow = [begin end] in seconds, the default is the complete trial
%   cfg.artfctdef.zvalue.hilbert       = 'no' or 'yes'
%   cfg.artfctdef.zvalue.rectify       = 'no' or 'yes'
%
% The output argument "artifact" is a Nx2 matrix comparable to the "trl" matrix of
% FT_DEFINETRIAL. The first column of which specifying the beginsamples of an
% artifact period, the second column contains the endsamples of the artifactperiods.
%
% To facilitate data-handling and distributed computing, you can use
%   cfg.inputfile   =  ...
% to read the input data from a *.mat file on disk. This mat files should contain
% only a single variable named 'data', corresponding to the input structure.
%
% See also FT_REJECTARTIFACT, FT_ARTIFACT_CLIP, FT_ARTIFACT_ECG, FT_ARTIFACT_EOG,
% FT_ARTIFACT_JUMP, FT_ARTIFACT_MUSCLE, FT_ARTIFACT_THRESHOLD, FT_ARTIFACT_ZVALUE

% Copyright (C) 2003-2025, Jan-Mathijs Schoffelen & Robert Oostenveld
%
% This file is part of FieldTrip, see http://www.fieldtriptoolbox.org
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id$

% these are used by the ft_preamble/ft_postamble function and scripts
ft_revision = '$Id$';
ft_nargin   = nargin;
ft_nargout  = nargout;

% do the general setup of the function
ft_defaults
ft_preamble init
ft_preamble provenance
ft_preamble loadvar data

% the ft_abort variable is set to true or false in ft_preamble_init
if ft_abort
  return
end

% for backward compatibility
cfg = ft_checkconfig(cfg, 'renamed', {'artfctdef.blc',             'artfctdef.demean'});
cfg = ft_checkconfig(cfg, 'renamed', {'artfctdef.blcwindow'        'artfctdef.baselinewindow'});
cfg = ft_checkconfig(cfg, 'renamed', {'artfctdef.zvalue.sgn',      'artfctdef.zvalue.channel'});
cfg = ft_checkconfig(cfg, 'renamed', {'artfctdef.zvalue.feedback', 'artfctdef.zvalue.interactive'});
cfg = ft_checkconfig(cfg, 'forbidden',  {'padding'});

% set the default options
cfg.continuous      = ft_getopt(cfg, 'continuous',     []);
cfg.feedback        = ft_getopt(cfg, 'feedback',       'text');
cfg.memory          = ft_getopt(cfg, 'memory',         'high');
cfg.representation  = ft_getopt(cfg, 'representation', 'numeric'); % numeric or table

% set default rejection parameters
cfg.artfctdef                    = ft_getopt(cfg,                  'artfctdef',    []);
cfg.artfctdef.zvalue             = ft_getopt(cfg.artfctdef,        'zvalue',       []);
cfg.artfctdef.zvalue.method      = ft_getopt(cfg.artfctdef.zvalue, 'method',       'all');
cfg.artfctdef.zvalue.ntrial      = ft_getopt(cfg.artfctdef.zvalue, 'ntrial',       10);
cfg.artfctdef.zvalue.channel     = ft_getopt(cfg.artfctdef.zvalue, 'channel',      {});
cfg.artfctdef.zvalue.trlpadding  = ft_getopt(cfg.artfctdef.zvalue, 'trlpadding',   0);
cfg.artfctdef.zvalue.fltpadding  = ft_getopt(cfg.artfctdef.zvalue, 'fltpadding',   0);
cfg.artfctdef.zvalue.artpadding  = ft_getopt(cfg.artfctdef.zvalue, 'artpadding',   0);
cfg.artfctdef.zvalue.interactive = ft_getopt(cfg.artfctdef.zvalue, 'interactive',  'no');
cfg.artfctdef.zvalue.cumulative  = ft_getopt(cfg.artfctdef.zvalue, 'cumulative',   'yes');
cfg.artfctdef.zvalue.artfctpeak  = ft_getopt(cfg.artfctdef.zvalue, 'artfctpeak',   'no');
cfg.artfctdef.zvalue.artfctpeakrange  = ft_getopt(cfg.artfctdef.zvalue, 'artfctpeakrange',  [0 0]);
cfg.artfctdef.zvalue.zscore           = ft_getopt(cfg.artfctdef.zvalue, 'zscore',           'yes');
cfg.artfctdef.zvalue.keepintermediate = ft_getopt(cfg.artfctdef.zvalue, 'keepintermediate', 'no');

skipzscore = false;
if isfield(cfg.artfctdef.zvalue, 'datagui')
  ft_notice('cfg already contains some processed data, using this data for artifact detection, overruling other options from cfg\n');
  opt = cfg.artfctdef.zvalue.datagui;
  opt.artcfg.interactive = cfg.artfctdef.zvalue.interactive; % overrule this option
  opt.artcfg.keepintermediate = cfg.artfctdef.zvalue.keepintermediate; % overrule this option to avoid recursive inflation
  cfg.artfctdef.zvalue   = opt.artcfg;
  skipzscore = true;
elseif isfield(cfg.artfctdef.zvalue, 'artifact')
  ft_notice('zvalue artifact detection has already been done, retaining artifacts\n');
  artifact = cfg.artfctdef.zvalue.artifact;
  return
end

% clear old warnings from this stack
ft_warning('-clear')

if ~skipzscore
  thresholdsum = strcmp(cfg.artfctdef.zvalue.cumulative, 'yes');
  pertrial     = strcmp(cfg.artfctdef.zvalue.method, 'trial');
  demeantrial  = strcmp(cfg.artfctdef.zvalue.method, 'trialdemean');
  % flag whether to compute z-value per trial or not, rationale being that if there are
  % fluctuations in the variance across trials (e.g. due to position differences in MEG
  % measurements) which don't have to do with the artifact per se, the detection is
  % compromised (although the data quality is questionable when there is a lot of
  % movement to begin with).
  if pertrial
    if isfield(cfg.artfctdef.zvalue, 'ntrial') && cfg.artfctdef.zvalue.ntrial>0
      pertrial = cfg.artfctdef.zvalue.ntrial;
    else
      ft_error('you should specify cfg.artfctdef.zvalue.ntrial, and it should be > 0');
    end
  end

  % the data can be passed as input arguments or can be read from disk
  hasdata = exist('data', 'var');

  if ~hasdata
    cfg = ft_checkconfig(cfg, 'dataset2files', 'yes');
    cfg = ft_checkconfig(cfg, 'required', {'headerfile', 'datafile'});
    hdr = ft_read_header(cfg.headerfile, 'headerformat', cfg.headerformat);
  else
    data = ft_checkdata(data, 'datatype', 'raw', 'hassampleinfo', 'yes');
    cfg  = ft_checkconfig(cfg, 'forbidden', {'dataset', 'headerfile', 'datafile'});
    hdr  = ft_fetch_header(data);
  end

  % set default cfg.continuous
  if isempty(cfg.continuous)
    if hdr.nTrials==1
      cfg.continuous = 'yes';
    else
      cfg.continuous = 'no';
    end
  end

  % get the specification of the data segments that should be scanned for artifacts
  if ~isfield(cfg, 'trl') && hasdata
    trl = data.sampleinfo;
    for k = 1:numel(data.trial)
      trl(k,3) = time2offset(data.time{k}, data.fsample);
    end
  elseif isfield(cfg, 'trl') && ischar(cfg.trl)
    trl = loadvar(cfg.trl, 'trl');
  elseif isfield(cfg, 'trl') && isnumeric(cfg.trl)
    trl = cfg.trl;
  else
    ft_error('cannot determine which segments of data to scan for artifacts');
  end

  % check whether the value for trlpadding makes sense
  if hasdata && cfg.artfctdef.zvalue.trlpadding > 0
    % negative trlpadding is allowed with in-memory data, since that would remove some data from each trial
    ft_error('you cannot use positive trlpadding with in-memory data');
  end

  trlpadding = round(cfg.artfctdef.zvalue.trlpadding*hdr.Fs);
  fltpadding = round(cfg.artfctdef.zvalue.fltpadding*hdr.Fs);
  artpadding = round(cfg.artfctdef.zvalue.artpadding*hdr.Fs);

  trl(:,1)      = trl(:,1) - trlpadding;       % pad the trial with some samples, in order to detect
  trl(:,2)      = trl(:,2) + trlpadding;       % artifacts at the edges of the relevant trials.
  if size(trl,2)>= 3
    trl(:,3)    = trl(:,3) - trlpadding;       % the offset can of course be adjusted as well
  elseif hasdata
    % reconstruct offset
    for tr=1:size(trl,1)
      % account for 0 might not be in data.time
      t0        = interp1(data.time{tr}, 1:numel(data.time{tr}), 0, 'linear', 'extrap');
      trl(tr,3) = -t0+1 - trlpadding;
    end
  else
    % assuming that the trial starts at t=0s
    trl(:,3) = trl(:,1);
  end

  numtrl        = size(trl,1);
  cfg.artfctdef.zvalue.channel = ft_channelselection(cfg.artfctdef.zvalue.channel, hdr.label);
  chanindx      = match_str(hdr.label, cfg.artfctdef.zvalue.channel);
  nchan         = length(chanindx);
  
  if nchan<1
    ft_error('no channels selected');
  end

  % read the data and apply preprocessing options
  if ~pertrial
    sumval = zeros(nchan, 1);
    sumsqr = zeros(nchan, 1);
    numsmp = zeros(nchan, 1);
  else
    sumval = zeros(nchan, numtrl);
    sumsqr = zeros(nchan, numtrl);
    numsmp = zeros(nchan, numtrl);
  end

  if strcmp(cfg.memory, 'high') % store data in memory, saving computation time below
    dat = cell(1, numtrl);
  end

  ft_progress('init', cfg.feedback, ['searching for artifacts in ' num2str(nchan) ' channels']);
  for trlop=1:numtrl

    ft_progress(trlop/numtrl, 'processing trial %d from %d\n', trlop, numtrl);
    if hasdata
      thisdat = ft_fetch_data(data,        'header', hdr, 'begsample', trl(trlop,1)-fltpadding, 'endsample', trl(trlop,2)+fltpadding, 'chanindx', chanindx, 'checkboundary', strcmp(cfg.continuous, 'no'), 'skipcheckdata', 1);
    else
      thisdat = ft_read_data(cfg.datafile, 'header', hdr, 'begsample', trl(trlop,1)-fltpadding, 'endsample', trl(trlop,2)+fltpadding, 'chanindx', chanindx, 'checkboundary', strcmp(cfg.continuous, 'no'), 'dataformat', cfg.dataformat);
    end
    thisdat = preproc(thisdat, cfg.artfctdef.zvalue.channel, offset2time(0, hdr.Fs, size(thisdat,2)), cfg.artfctdef.zvalue, fltpadding, fltpadding);

    if ~pertrial
      % accumulate the sum and the sum-of-squares
      sumval = sumval + nansum(thisdat,2);
      sumsqr = sumsqr + nansum(thisdat.^2,2);
      numsmp = numsmp + sum(isfinite(thisdat),2);
    else
      % store per trial the sum and the sum-of-squares
      sumval(:,trlop) = nansum(thisdat,2);
      sumsqr(:,trlop) = nansum(thisdat.^2,2);
      numsmp(:,trlop) = sum(isfinite(thisdat),2);
    end

    if strcmp(cfg.memory, 'high') % store data in memory, saving computation time below
      dat{trlop} = thisdat;
    end

  end % for trlop
  ft_progress('close');

  if pertrial>1
    sumval = ft_preproc_smooth(sumval, pertrial)*pertrial;
    sumsqr = ft_preproc_smooth(sumsqr, pertrial)*pertrial;
    numsmp = ft_preproc_smooth(numsmp, pertrial)*pertrial;
  end

  % compute the average and the standard deviation
  if strcmp(cfg.artfctdef.zvalue.zscore, 'yes')
    datavg = sumval./numsmp;
    datstd = sqrt(sumsqr./numsmp - (sumval./numsmp).^2);
  else
    ft_warning('not performing z-scoring, note that the defined threshold has physical units');
    datavg = zeros(size(sumval));
    datstd = ones(size(sumval));
  end

  if strcmp(cfg.memory, 'low')
    ft_info('\n');
  end

  zmax  = cell(1, numtrl);
  zsum  = cell(1, numtrl);
  zindx = cell(1, numtrl);

  % create a vector that indexes the trials, or is all 1, in order to a per trial
  % z-scoring, or use a static std and mean
  if pertrial
    indvec = 1:numtrl;
  else
    indvec = ones(1,numtrl);
  end

  ft_progress('init', cfg.feedback, ['processing data in ' num2str(nchan) ' channels']);
  for trlop = 1:numtrl

    if strcmp(cfg.memory, 'low') % store nothing in memory (note that we need to fetch/read and preproc AGAIN... *yawn*)
      ft_progress(trlop/numtrl, 'processing trial %d from %d\n', trlop, numtrl);
      options_getdata = {'header', hdr, 'begsample', trl(trlop,1)-fltpadding, 'endsample', trl(trlop,2)+fltpadding, 'chanindx', chanindx, 'checkboundary', strcmp(cfg.continuous, 'no')};
      if hasdata
        thisdat = ft_fetch_data(data, options_getdata{:});
      else
        options_getdata = cat(2, options_getdata, {'dataformat', cfg.dataformat});
        thisdat = ft_read_data(cfg.datafile, options_getdata{:});
      end
      thisdat = preproc(thisdat, cfg.artfctdef.zvalue.channel, offset2time(0, hdr.Fs, size(thisdat,2)), cfg.artfctdef.zvalue, fltpadding, fltpadding);
    else
      thisdat = dat{trlop};
    end

    nsmp    = size(thisdat,2);

    zmax{trlop}  = -inf + zeros(1, nsmp);
    zsum{trlop}  =        zeros(1, nsmp);
    zindx{trlop} =        zeros(1, nsmp);

    ix           = indvec(trlop) * ones(1,nsmp);           % indexing vector dependent on the pertrial setting
    zdata        = (thisdat - datavg(:,ix))./datstd(:,ix); % convert the filtered data to z-values
    zsum{trlop}  = nansum(zdata,1);      % sum the z-values across channels
    [zmax{trlop},ind] = max(zdata,[],1); % find the maximum z-value and remember it
    zindx{trlop}      = chanindx(ind);   % also remember the channel number that has the largest z-value

  end % for trlop
  ft_progress('close');

  if demeantrial
    for trlop = 1:numtrl
      zmax{trlop} = zmax{trlop}-nanmean(zmax{trlop},2);
      zsum{trlop} = zsum{trlop}-nanmean(zsum{trlop},2);
    end
  end

  for trlop = 1:numtrl
    zsum{trlop} = zsum{trlop} ./ sqrt(nchan);
  end

  opt.artcfg       = cfg.artfctdef.zvalue;
  opt.artval       = {};
  opt.artpadding   = artpadding;
  opt.cfg          = cfg;
  opt.channel      = 'artifact';
  opt.hdr          = hdr;
  opt.numtrl       = size(trl,1);
  opt.quit         = 0;
  opt.threshold    = cfg.artfctdef.zvalue.cutoff;
  opt.thresholdsum = thresholdsum;
  opt.trialok      = true(1,opt.numtrl);  % OK by means of objective criterion
  opt.keep         = zeros(1,opt.numtrl); % OK overruled by user +1 to keep, -1 to reject, start all zeros for callback to work
  opt.trl          = trl;
  opt.trlop        = 1;
  opt.updatethreshold = true;
  opt.zmax         = zmax;
  opt.zsum         = zsum;
  if isfield(cfg.artfctdef.zvalue, 'montage')
    opt.montage = cfg.artfctdef.zvalue.montage;
  end

  if ~thresholdsum
    opt.zval = zmax;
  else
    opt.zval = zsum;
  end
  opt.zindx = zindx;
  if ~hasdata
    opt.data = {};
  else
    opt.data = data;
  end
end

% always create figure, keypress to enable keyboard uicontrol
h = figure('KeyPressFcn', @keyboard_cb);
set(h, 'visible', 'off');

if strcmp(cfg.artfctdef.zvalue.interactive, 'yes')
  set(h, 'visible', 'on');
  set(h, 'CloseRequestFcn', @cleanup_cb);
  % give graphical feedback and allow the user to modify the threshold
  set(h, 'position', [100 200 900 400]);
  h1 = axes('position', [0.05 0.15 0.4 0.8]);
  h2 = axes('position', [0.5  0.57  0.45 0.38]);
  h3 = axes('position', [0.5  0.15  0.45 0.32]);
  opt.h1           = h1;
  opt.h2           = h2;
  opt.h3           = h3;
  
  setappdata(h, 'opt', opt);
  artval_cb(h);
  redraw_cb(h);
  
  % make the user interface elements for the data view, the order of the elements
  % here is from left to right and should match the order in the documentation
  uicontrol('tag', 'width1', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'stop',    'userdata', 'q');
  
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '<',        'userdata', 'comma');
  uicontrol('tag', 'width1', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'artifact', 'userdata', 'a');
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '>',        'userdata', 'period');
  
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '<<',    'userdata', 'x');
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '<',     'userdata', 'leftarrow');
  uicontrol('tag', 'width1', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'trial', 'userdata', 't');
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '>',     'userdata', 'rightarrow');
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '>>',    'userdata', 'c');
  
  uicontrol('tag', 'width3', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'keep trial',  'userdata', 'k');
  uicontrol('tag', 'width3', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'reject full', 'userdata', 'space');
  uicontrol('tag', 'width3', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'reject part', 'userdata', 'r');
  
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '<',           'userdata', 'downarrow');
  uicontrol('tag', 'width3', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'threshold',   'userdata', 'z');
  uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '>',           'userdata', 'uparrow');
  
  %uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '<',       'userdata', 'control+uparrow')
  %uicontrol('tag', 'width1', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', 'channel', 'userdata', 'c')
  %uicontrol('tag', 'width2', 'parent', h, 'units', 'normalized', 'style', 'pushbutton', 'string', '>',       'userdata', 'control+downarrow')
  
  ft_uilayout(h, 'tag', 'width1', 'width', 0.10, 'height', 0.05);
  ft_uilayout(h, 'tag', 'width2', 'width', 0.05, 'height', 0.05);
  ft_uilayout(h, 'tag', 'width3', 'width', 0.12, 'height', 0.05);
  
  ft_uilayout(h, 'tag', 'width1', 'style', 'pushbutton', 'callback', @keyboard_cb);
  ft_uilayout(h, 'tag', 'width2', 'style', 'pushbutton', 'callback', @keyboard_cb);
  ft_uilayout(h, 'tag', 'width3', 'style', 'pushbutton', 'callback', @keyboard_cb);
  
  ft_uilayout(h, 'tag', 'width1', 'retag', 'viewui');
  ft_uilayout(h, 'tag', 'width2', 'retag', 'viewui');
  ft_uilayout(h, 'tag', 'width3', 'retag', 'viewui');
  ft_uilayout(h, 'tag', 'viewui', 'BackgroundColor', [0.8 0.8 0.8], 'hpos', 'auto', 'vpos', 0.005);
  
  while opt.quit==0
    uiwait(h);
    opt = getappdata(h, 'opt');
  end
  
else
  % compute the artifacts given the settings in the cfg
  setappdata(h, 'opt', opt);
  artval_cb(h);
end

h   = getparent(h);
opt = getappdata(h, 'opt');

% convert the artifact values per trial to one long boolean vector
boolvec = zeros(1,max(opt.trl(:,2)));
for trlop=1:opt.numtrl
  boolvec(opt.trl(trlop,1):opt.trl(trlop,2)) = opt.artval{trlop};
end

% find the padded artifacts and put them in a Nx2 trl-like matrix
artifact = boolvec2artifact(boolvec);

if strcmp(cfg.artfctdef.zvalue.artfctpeak, 'yes')
  % this is a re-implementation of the peak-detection stuff, to make the
  % overall code behavior more consistent. artifact will be adjusted
  % according to the specifications of the user, i.e. the peak index for
  % each identified artifact will be identified, and used for an offset
  % column. the peak_indx, peaks, and dssartifact fields are be obsoleted
  pre = round(cfg.artfctdef.zvalue.artfctpeakrange(1)*hdr.Fs);
  pst = round(cfg.artfctdef.zvalue.artfctpeakrange(2)*hdr.Fs);
  for k = 1:size(artifact,1)
    % identify the corresponding trl for the current artifact, the artifact
    % can either be fully within the trl, or overlapping at one (or
    % both) edges
    current = artifact(k,:);
    seltrl  = find(current(2)>=opt.trl(:,1) & current(1)<=opt.trl(:,2));
     
    % in case the artifact is in more than one trial a for-loop is needed
    mx     = [];
    mx_idx = [];
    for m = 1:numel(seltrl)
      idx = current - opt.trl(seltrl(m),1) + 1;
      idx(1) = max(idx(1),1);
      idx(2) = min(idx(2),size(opt.zval{seltrl(m)},2));
      [mx(m), mx_idx(m)] = max(opt.zval{seltrl(m)}(idx(1):idx(2)));
    end
    
    [maxtrl, maxtrl_idx] = max(mx);
    seltrl = seltrl(maxtrl_idx);
    peak   = current(1) + mx_idx(maxtrl_idx) - 1;
    
    artifact(k,1) = max(peak+pre, opt.trl(seltrl,1));
    artifact(k,2) = min(peak+pst, opt.trl(seltrl,2));
    artifact(k,3) = artifact(k,1) - peak;
  end
end

if strcmp(cfg.representation, 'numeric') && istable(artifact)
  if isempty(artifact)
    % an empty table does not have columns
    artifact = zeros(0,2);
  else
    % convert the table to a numeric array with the columns begsample and endsample
    artifact = table2array(artifact);
  end
elseif strcmp(cfg.representation, 'table') && isnumeric(artifact)
  if isempty(artifact)
    % an empty table does not have columns
    artifact = table();
  else
    % convert the numeric array to a table with the columns begsample and endsample
    begsample = artifact(:,1);
    endsample = artifact(:,2);
    if size(artifact,2)==3
      offset   = artifact(:,3);
      artifact = table(begsample, endsample, offset);
    else
      artifact = table(begsample, endsample);
    end
  end
end

% remember the details that were used here and store the detected artifacts
cfg.artfctdef.zvalue.trl      = opt.trl;          % remember where we have been looking for artifacts
cfg.artfctdef.zvalue.cutoff   = opt.threshold;    % remember the threshold that was used
cfg.artfctdef.zvalue.artifact = artifact;
if istrue(cfg.artfctdef.zvalue.keepintermediate)
  cfg.artfctdef.zvalue.datagui = opt;
end
ft_notice('detected %d artifacts\n', size(artifact,1));

delete(h);

% do the general cleanup and bookkeeping at the end of the function
ft_postamble previous data
ft_postamble provenance
ft_postamble savevar


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBFUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function artval_cb(h, eventdata)

opt = getappdata(h, 'opt');

artval = cell(1,opt.numtrl);
for trlop=1:opt.numtrl
  if opt.thresholdsum
    % threshold the accumulated z-values
    artval{trlop} = opt.zsum{trlop}>opt.threshold;
  else
    % threshold the max z-values
    artval{trlop} = opt.zmax{trlop}>opt.threshold;
  end
  % pad the artifacts
  artbeg = find(diff([0 artval{trlop}])== 1);
  artend = find(diff([artval{trlop} 0])==-1);
  artbeg = artbeg - opt.artpadding;
  artend = artend + opt.artpadding;
  artbeg(artbeg<1) = 1;
  artend(artend>length(artval{trlop})) = length(artval{trlop});
  for artlop=1:length(artbeg)
    artval{trlop}(artbeg(artlop):artend(artlop)) = 1;
  end
  opt.trialok(trlop) = isempty(artbeg);
end

for trlop = find(opt.keep==1 & opt.trialok==0)
  % overrule the objective criterion, i.e. keep the trial when the user
  % wants to keep it
  artval{trlop}(:) = 0;
end

for trlop = find(opt.keep<0 & opt.trialok==1)
  % if the user specifies that the trial is not OK
  % reject the whole trial if there is no extra-threshold data,
  % otherwise use the artifact as found by the thresholding
  if opt.thresholdsum && opt.keep(trlop)==-1
    % threshold the accumulated z-values
    artval{trlop} = opt.zsum{trlop}>opt.threshold;
  elseif opt.keep(trlop)==-1
    % threshold the max z-values
    artval{trlop} = opt.zmax{trlop}>opt.threshold;
  elseif opt.keep(trlop)==-2
    artval{trlop}(:) = 1;
  end
  % pad the artifacts
  artbeg = find(diff([0 artval{trlop}])== 1);
  artend = find(diff([artval{trlop} 0])==-1);
  artbeg = artbeg - opt.artpadding;
  artend = artend + opt.artpadding;
  artbeg(artbeg<1) = 1;
  artend(artend>length(artval{trlop})) = length(artval{trlop});
  if ~isempty(artbeg)
    for artlop=1:length(artbeg)
      artval{trlop}(artbeg(artlop):artend(artlop)) = 1;
    end
  else
    artval{trlop}(:) = 1;
  end
end

for trlop = find(opt.keep==-2 & opt.trialok==0)
  % if the user specifies the whole trial to be rejected define the whole
  % segment to be bad
  artval{trlop}(:) = 1;
  % pad the artifacts
  artbeg = find(diff([0 artval{trlop}])== 1);
  artend = find(diff([artval{trlop} 0])==-1);
  artbeg = artbeg - opt.artpadding;
  artend = artend + opt.artpadding;
  artbeg(artbeg<1) = 1;
  artend(artend>length(artval{trlop})) = length(artval{trlop});
  if ~isempty(artbeg)
    for artlop=1:length(artbeg)
      artval{trlop}(artbeg(artlop):artend(artlop)) = 1;
    end
  else
    artval{trlop}(:) = 1;
  end
end

opt.artval = artval;
setappdata(h, 'opt', opt);
uiresume;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBFUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function keyboard_cb(h, eventdata)

% If a mouseclick was made, use that value. If not, determine the key that
% corresponds to the uicontrol element that was activated.

if isa(eventdata, 'matlab.ui.eventdata.ActionData') % only the case when clicked with mouse
  curKey = get(h, 'userdata');
elseif isa(eventdata, 'matlab.ui.eventdata.KeyData') % only when key was pressed
  if isempty(eventdata.Character) && any(strcmp(eventdata.Key, {'control', 'shift', 'alt', '0'}))
    % only a modifier key was pressed
    return
  end
  if isempty(eventdata.Modifier)
    curKey = eventdata.Key;
  else
    curKey = [sprintf('%s+', eventdata.Modifier{:}) eventdata.Key];
  end
elseif isfield(eventdata, 'Key')  % only when key was pressed
  curKey = eventdata.Key;
elseif isempty(eventdata) % matlab2012b returns an empty double upon a mouse click
  curKey = get(h, 'userdata');
else
  ft_error('cannot process user input, please report this on http://bugzilla.fieldtriptoolbox.org including your MATLAB version');
end

h = getparent(h); % otherwise h is empty if isa [...].ActionData
opt = getappdata(h, 'opt');

switch strtrim(curKey)
  case 'leftarrow' % change trials
    opt.trlop = max(opt.trlop - 1, 1); % should not be smaller than 1
    setappdata(h, 'opt', opt);
    redraw_cb(h, eventdata);
  case 'x'
    opt.trlop = max(opt.trlop - 10, 1); % should not be smaller than 1
    setappdata(h, 'opt', opt);
    redraw_cb(h, eventdata);
  case 'rightarrow'
    opt.trlop = min(opt.trlop + 1, opt.numtrl); % should not be larger than the number of trials
    setappdata(h, 'opt', opt);
    redraw_cb(h, eventdata);
  case 'c'
    opt.trlop = min(opt.trlop + 10, opt.numtrl); % should not be larger than the number of trials
    setappdata(h, 'opt', opt);
    redraw_cb(h, eventdata);
  case 'uparrow' % change threshold
    opt.threshold = opt.threshold+0.5;
    opt.updatethreshold = true;
    setappdata(h, 'opt', opt);
    artval_cb(h, eventdata);
    redraw_cb(h, eventdata);
    opt = getappdata(h, 'opt'); % grab the opt-structure from the handle because it has been adjusted in the callbacks
    opt.updatethreshold = false;
    setappdata(h, 'opt', opt);
  case 'downarrow'
    opt.threshold = opt.threshold-0.5;
    opt.updatethreshold = true;
    setappdata(h, 'opt', opt);
    artval_cb(h, eventdata);
    redraw_cb(h, eventdata);
    opt = getappdata(h, 'opt'); % grab the opt-structure from the handle because it has been adjusted in the callbacks
    opt.updatethreshold = false;
    setappdata(h, 'opt', opt);
  case 'period' % change artifact
    artfctindx = find(opt.trialok == 0);
    sel        = find(artfctindx>opt.trlop);
    if ~isempty(sel)
      opt.trlop = artfctindx(sel(1));
    end
    setappdata(h, 'opt', opt);
    redraw_cb(h, eventdata);
  case 'comma'
    artfctindx = find(opt.trialok == 0);
    sel        = find(artfctindx<opt.trlop);
    if ~isempty(sel)
      opt.trlop = artfctindx(sel(end));
    end
    setappdata(h, 'opt', opt);
    redraw_cb(h, eventdata);
    %   case 'control+uparrow' % change channel
    %     if strcmp(opt.channel, 'artifact')
    %       [dum, indx] = max(opt.zval);
    %       chanindx      = opt.zindx(indx);
    %     else
    %       if ~isempty(opt.data)
    %         chanindx  = match_str(opt.channel, opt.data.label);
    %         selchan = match_str(opt.artcfg.channel, opt.channel);
    %       else
    %         chanindx  = match_str(opt.channel,   opt.hdr.label);
    %         selchan = match_str(opt.artcfg.channel, opt.channel);
    %       end
    %     end
    %     numchan = numel(opt.artcfg.channel);
    %     chansel = min(selchan+1, numchan);
    %     % convert numeric array into cell-array with channel labels
    %     opt.channel = tmpchan(chansel);
    %     setappdata(h, 'opt', opt);
    %     redraw_cb(h, eventdata);
    %   case 'c' % select channel
    %     select = match_str([opt.artcfg.channel;{'artifact'}], opt.channel);
    %     opt.channel = select_channel_list([opt.artcfg.channel;{'artifact'}], select);
    %     setappdata(h, 'opt', opt);
    %     redraw_cb(h, eventdata);
    %   case 'control+downarrow'
    %     tmpchan = [opt.artcfg.channel;{'artifact'}]; % append the 'artifact' channel
    %     chansel = match_str(tmpchan, opt.channel);
    %     chansel = max(chansel-1, 1);
    %     % convert numeric array into cell-array with channel labels
    %     opt.channel = tmpchan(chansel);
    %     setappdata(h, 'opt', opt);
    %     redraw_cb(h, eventdata);
  case 'a'
    % select the artifact to display
    response = inputdlg(sprintf('artifact trial to display'), 'specify', 1, {num2str(opt.trlop)});
    if ~isempty(response)
      artfctindx = find(opt.trialok == 0);
      sel        = str2double(response);
      sel        = min(numel(artfctindx), sel);
      sel        = max(1,                 sel);
      opt.trlop  = artfctindx(sel);
      setappdata(h, 'opt', opt);
      redraw_cb(h, eventdata);
    end
  case 'q'
    setappdata(h, 'opt', opt);
    cleanup_cb(h);
  case 't'
    % select the trial to display
    response = inputdlg(sprintf('trial to display'), 'specify', 1, {num2str(opt.trlop)});
    if ~isempty(response)
      opt.trlop = str2double(response);
      opt.trlop = min(opt.trlop, opt.numtrl); % should not be larger than the number of trials
      opt.trlop = max(opt.trlop, 1); % should not be smaller than 1
      setappdata(h, 'opt', opt);
      redraw_cb(h, eventdata);
    end
  case 'z'
    % select the threshold
    response = inputdlg('z-threshold', 'specify', 1, {num2str(opt.threshold)});
    if ~isempty(response)
      opt.threshold = str2double(response);
      opt.updatethreshold = true;
      setappdata(h, 'opt', opt);
      artval_cb(h, eventdata);
      redraw_cb(h, eventdata);
      opt = getappdata(h, 'opt'); % grab the opt-structure from the handle because it has been adjusted in the callbacks
      opt.updatethreshold = false;
      setappdata(h, 'opt', opt);
    end
  case 'k'
    opt.keep(opt.trlop) = 1;
    setappdata(h, 'opt', opt);
    artval_cb(h);
    redraw_cb(h);
  case 'r'
    % only of the trial contains a partial artifact
    if opt.trialok(opt.trlop) == 0
      opt.keep(opt.trlop) = -1;
    end
    setappdata(h, 'opt', opt);
    artval_cb(h);
    redraw_cb(h);
  case 'space'
    opt.keep(opt.trlop) = -2;
    setappdata(h, 'opt', opt);
    artval_cb(h);
    redraw_cb(h);
  case 'control+control'
    % do nothing
  case 'shift+shift'
    % do nothing
  case 'alt+alt'
    % do nothing
  otherwise
    setappdata(h, 'opt', opt);
    % this should be consistent with the help of the function
    fprintf('----------------------------------------------------------------------\n');
    fprintf('     q                 : Stop\n');
    fprintf('\n');
    fprintf('     comma             : Step to the previous artifact trial\n');
    fprintf('     a                 : Specify artifact trial to display\n');
    fprintf('     period            : Step to the next artifact trial\n');
    fprintf('\n');
    fprintf('     x                 : Step 10 trials back\n');
    fprintf('     leftarrow         : Step to the previous trial\n');
    fprintf('     t                 : Specify trial to display\n');
    fprintf('     rightarrow        : Step to the next trial\n');
    fprintf('     c                 : Step 10 trials forward\n');
    fprintf('\n');
    fprintf('     k                 : Keep trial\n');
    fprintf('     space             : Mark complete trial as artifact\n');
    fprintf('     r                 : Mark part of trial as artifact\n');
    fprintf('\n');
    fprintf('     downarrow         : Shift the z-threshold down\n');
    fprintf('     z                 : Specify the z-threshold\n');
    fprintf('     uparrow           : Shift the z-threshold down\n');
    fprintf('----------------------------------------------------------------------\n');
end
clear curKey;
uiresume(h);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBFUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function redraw_cb(h, eventdata)

h   = getparent(h);
opt = getappdata(h, 'opt');

% make a local copy of the relevant variables
trlop     = opt.trlop;
artval    = opt.artval{trlop};
zindx     = opt.zindx{trlop};
zval      = opt.zval{trlop};
cfg       = opt.cfg;
artcfg    = opt.artcfg;
hdr       = opt.hdr;
trl       = opt.trl;
trlpadsmp = round(artcfg.trlpadding*hdr.Fs);
channel   = opt.channel;
hasmontage = false;
if isfield(opt, 'montage')
  montage = opt.montage;
  hasmontage = true;
else
  hasmontage = false;
end

% determine the channel with the highest z-value to be displayed
% this is default behavior but can be overruled in the gui
if strcmp(channel, 'artifact')
  if ~isempty(opt.data)
    [dum, indx] = max(zval);
    chanindx    = zindx(indx);
  elseif isempty(opt.data)
    if hasmontage
      % the montage needs to be applied first to the data before the channel can be selected
      chanindx    = match_str(hdr.label, montage.labelold);
    elseif ~hasmontage
      [dum, indx] = max(zval);
      chanindx    = zindx(indx);
    end
  end
else
  if ~isempty(opt.data)
    chanindx = match_str(channel, opt.data.label);
  else
    if hasmontage
      % the montage needs to be applied first to the data before the channel can be selected
      chanindx = match_str(hdr.label, montage.labelold);
    elseif ~hasmontage
      chanindx = match_str(hdr.label, channel);
    end
  end
end

if ~isempty(opt.data)
  data = ft_fetch_data(opt.data, 'header', hdr, 'begsample', trl(trlop,1), 'endsample', trl(trlop,2), 'chanindx', chanindx, 'checkboundary', strcmp(cfg.continuous, 'no'));
else
  data = ft_read_data(cfg.datafile, 'header', hdr, 'begsample', trl(trlop,1), 'endsample', trl(trlop,2), 'chanindx', chanindx, 'checkboundary', strcmp(cfg.continuous, 'no'));
end

% data = preproc(data, '', hdr.Fs, artcfg, [], artcfg.fltpadding, artcfg.fltpadding);
if hasmontage
  % convert the data temporarily to a raw structure
  tmpdata.trial = {data};
  tmpdata.time  = {1:size(data,2)};
  tmpdata.label = hdr.label(chanindx);
  % apply the montage to the data
  tmpdata = ft_apply_montage(tmpdata, montage, 'feedback', 'none');
  data    = tmpdata.trial{1}; % the number of channels can have changed
  clear tmpdata
  
  if strcmp(channel, 'artifact')
    [dum, indx] = max(zval);
    chanindx    = find(chanindx==zindx(indx)); % this is relative to the original indices in the data, this is a bit ugly FIXME
  else
    chanindx    = match_sr(montage.labelnew, channel);
  end
  channame = montage.labelnew{chanindx};
else
  channame = hdr.label{chanindx};
end

% the string us used as title and printed in the command window
str = sprintf('trial %3d of %d, channel %s', trlop, size(trl,1), channame);
fprintf('showing %s\n', str);

%-----------------------------
% plot summary in left subplot
subplot(opt.h1); hold on;

% plot as a blue line only once
if isempty(get(opt.h1, 'children'))
  for k = 1:opt.numtrl
    xval = opt.trl(k,1):opt.trl(k,2);
    if opt.thresholdsum
      yval = opt.zsum{k};
    else
      yval = opt.zmax{k};
    end
    plot(opt.h1, xval, yval, 'linestyle', '-', 'color', 'b', 'displayname', 'data');
    xlabel('samples');
    ylabel('z-value');
  end
end
h1children = get(opt.h1, 'children');

% plot trial box
boxhandle = findall(h1children, 'displayname', 'highlight');
if isempty(boxhandle)
  % draw it
  xval = trl(opt.trlop,1):trl(opt.trlop,2);
  if opt.thresholdsum
    yval = opt.zsum{opt.trlop};
  else
    yval = opt.zmax{opt.trlop};
  end
  plot(opt.h1, xval, yval, 'linestyle', '-', 'color', 'm', 'linewidth', 2, 'displayname', 'highlight');
else
  % update it
  xval = trl(opt.trlop,1):trl(opt.trlop,2);
  if opt.thresholdsum
    yval = opt.zsum{opt.trlop};
  else
    yval = opt.zmax{opt.trlop};
  end
  set(boxhandle,  'XData', xval);
  set(boxhandle,  'YData', yval);
end

% plot as red lines the suprathreshold data points
thrhandle = findall(h1children, 'displayname', 'reddata');
if isempty(thrhandle)
  % they have to be drawn
  for k = 1:opt.numtrl
    xval = trl(k,1):trl(k,2);
    if opt.thresholdsum
      yval = opt.zsum{k};
    else
      yval = opt.zmax{k};
    end
    dum = yval<=opt.threshold;
    yval(dum) = nan;
    plot(opt.h1, xval, yval, 'linestyle', '-', 'color', [1 0 0], 'displayname', 'reddata');
  end
  hline(opt.threshold, 'color', 'r', 'linestyle', ':', 'displayname', 'threshline');
elseif ~isempty(thrhandle) && opt.updatethreshold
  % they can be updated
  for k = 1:opt.numtrl
    xval = trl(k,1):trl(k,2);
    if opt.thresholdsum
      yval = opt.zsum{k};
    else
      yval = opt.zmax{k};
    end
    dum = yval<=opt.threshold;
    yval(dum) = nan;
    set(thrhandle(k), 'XData', xval);
    set(thrhandle(k), 'YData', yval);
  end
  set(findall(h1children, 'displayname', 'threshline'), 'YData', [1 1].*opt.threshold);
end

%--------------------------------------------------
% get trial specific x-axis values and padding info
xval = ((trl(opt.trlop,1):trl(opt.trlop,2))-trl(opt.trlop,1)+trl(opt.trlop,3))./opt.hdr.Fs;
if trlpadsmp>0
  sel    = trlpadsmp:(size(data,2)-trlpadsmp);
  selpad = 1:size(data,2);
else
  sel    = 1:size(data,2);
  selpad = sel;
end

% plot data of most aberrant channel in upper subplot
subplot(opt.h2); hold on
if isempty(get(opt.h2, 'children'))
  % do the plotting
  plot(xval(selpad), data(selpad),          'color', [0.5 0.5 1], 'displayname', 'line1');
  plot(xval(sel),    data(sel),             'color', [0 0 1],     'displayname', 'line2');
  vline(xval(  1)+(trlpadsmp-1/opt.hdr.Fs), 'color', [0 0 0],     'displayname', 'vline1');
  vline(xval(end)-(trlpadsmp/opt.hdr.Fs),   'color', [0 0 0],     'displayname', 'vline2');
  data(~artval) = nan;
  plot(xval, data, 'r-', 'displayname', 'line3');
  xlabel('time(s)');
  ylabel('uV or Tesla');
  xlim([xval(1) xval(end)]);
  title(str);
else
  % update in the existing handles
  h2children = get(opt.h2, 'children');
  set(findall(h2children, 'displayname', 'vline1'), 'visible', 'off');
  set(findall(h2children, 'displayname', 'vline2'), 'visible', 'off');
  set(findall(h2children, 'displayname', 'line1'), 'XData', xval(selpad));
  set(findall(h2children, 'displayname', 'line1'), 'YData', data(selpad));
  set(findall(h2children, 'displayname', 'line2'), 'XData', xval(sel));
  set(findall(h2children, 'displayname', 'line2'), 'YData', data(sel));
  data(~artval) = nan;
  set(findall(h2children, 'displayname', 'line3'),  'XData', xval);
  set(findall(h2children, 'displayname', 'line3'),  'YData', data);
  abc2 = axis(opt.h2);
  set(findall(h2children, 'displayname', 'vline1'), 'XData', [1 1]*xval(  1)+(trlpadsmp-1/opt.hdr.Fs));
  set(findall(h2children, 'displayname', 'vline1'), 'YData', abc2(3:4));
  set(findall(h2children, 'displayname', 'vline2'), 'XData', [1 1]*xval(end)-(trlpadsmp/opt.hdr.Fs));
  set(findall(h2children, 'displayname', 'vline2'), 'YData', abc2(3:4));
  set(findall(h2children, 'displayname', 'vline1'), 'visible', 'on');
  set(findall(h2children, 'displayname', 'vline2'), 'visible', 'on');
  str = sprintf('trial %3d, channel %s', opt.trlop, channame);
  title(str);
  xlim([xval(1) xval(end)]);
end

% plot z-values in lower subplot
subplot(opt.h3); hold on;
if isempty(get(opt.h3, 'children'))
  % do the plotting
  plot(xval(selpad), zval(selpad), 'color', [0.5 0.5 1], 'displayname', 'line1b');
  plot(xval(sel),    zval(sel),    'color', [0 0 1],     'displayname', 'line2b');
  hline(opt.threshold, 'color', 'r', 'linestyle', ':', 'displayname', 'threshline');
  vline(xval(  1)+(trlpadsmp-1/opt.hdr.Fs),     'color', [0 0 0],     'displayname', 'vline1b');
  vline(xval(end)-(trlpadsmp/opt.hdr.Fs),       'color', [0 0 0],     'displayname', 'vline2b');
  zval(~artval) = nan;
  plot(xval, zval, 'r-', 'displayname', 'line3b');
  xlabel('time(s)');
  ylabel('z-value');
  xlim([xval(1) xval(end)]);
else
  % update in the existing handles
  h3children = get(opt.h3, 'children');
  set(findall(h3children, 'displayname', 'vline1b'), 'visible', 'off');
  set(findall(h3children, 'displayname', 'vline2b'), 'visible', 'off');
  set(findall(h3children, 'displayname', 'line1b'), 'XData', xval(selpad));
  set(findall(h3children, 'displayname', 'line1b'), 'YData', zval(selpad));
  set(findall(h3children, 'displayname', 'line2b'), 'XData', xval(sel));
  set(findall(h3children, 'displayname', 'line2b'), 'YData', zval(sel));
  zval(~artval) = nan;
  set(findall(h3children, 'displayname', 'line3b'),     'XData', xval);
  set(findall(h3children, 'displayname', 'line3b'),     'YData', zval);
  set(findall(h3children, 'displayname', 'threshline'), 'YData', [1 1].*opt.threshold);
  set(findall(h3children, 'displayname', 'threshline'), 'XData', xval([1 end]));
  abc = axis(opt.h3);
  set(findall(h3children, 'displayname', 'vline1b'), 'XData', [1 1]*xval(  1)+(trlpadsmp-1/opt.hdr.Fs));
  set(findall(h3children, 'displayname', 'vline1b'), 'YData', abc(3:4));
  set(findall(h3children, 'displayname', 'vline2b'), 'XData', [1 1]*xval(end)-(trlpadsmp/opt.hdr.Fs));
  set(findall(h3children, 'displayname', 'vline2b'), 'YData', abc(3:4));
  set(findall(h3children, 'displayname', 'vline1b'), 'visible', 'on');
  set(findall(h3children, 'displayname', 'vline2b'), 'visible', 'on');
  xlim([xval(1) xval(end)]);
end

setappdata(h, 'opt', opt);
uiresume

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBFUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function cleanup_cb(h, eventdata)
opt = getappdata(h, 'opt');
opt.quit = true;
setappdata(h, 'opt', opt);
uiresume

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBFUNCTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function h = getparent(h)
p = h;
while p~=0
  h = p;
  p = get(h, 'parent');
end
