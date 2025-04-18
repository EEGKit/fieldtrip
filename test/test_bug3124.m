function test_bug3124

% WALLTIME 00:30:00
% MEM 1gb
% DEPENDENCY ft_sourceanalysis
% DATA public

%%

load(dccnpath('/project/3031000.02/external/download/tutorial/beamformer/headmodel.mat'))
load(dccnpath('/project/3031000.02/external/download/tutorial/beamformer/data_all.mat'))

%%

cfg = [];
cfg.method = 'mtmfft';
cfg.taper = 'hanning';
cfg.output = 'fourier';
freq = ft_freqanalysis(cfg, data_all);

%%
% with 1 cm grid -> 3000 grid points, 1484 inside
% with 2 cm grid -> 186 grid points

cfg = [];
cfg.headmodel = ft_convert_units(headmodel, 'cm');
cfg.resolution = 2;
cfg.channel = 'MEG';

sourcemodel = ft_prepare_leadfield(cfg, freq);

%%
% make a manual selection of a single frequency

fcfg = [];
fcfg.frequency = 10;
freq1 = ft_selectdata(fcfg, freq);

fcfg = [];
fcfg.foilim = 10;
freq2 = ft_selectdata(fcfg, freq);

%%
% the result should be at 10 Hz in all cases

cfg = [];
cfg.headmodel = headmodel;
cfg.sourcemodel = sourcemodel;
cfg.frequency = 10;
source0 = ft_sourceanalysis(cfg, freq);

cfg = [];
cfg.headmodel = headmodel;
cfg.sourcemodel = sourcemodel;
source1 = ft_sourceanalysis(cfg, freq1);

cfg = [];
cfg.headmodel = headmodel;
cfg.sourcemodel = sourcemodel;
source2 = ft_sourceanalysis(cfg, freq2);

assert(isequal(source0.freq, [10]));
assert(isequal(source1.freq, [10]));
assert(isequal(source2.freq, [10]));

assert(isequaln(source0.avg.pow, source1.avg.pow));
assert(isequaln(source0.avg.pow, source2.avg.pow));

%%
% make a manual selection of a range

fcfg = [];
fcfg.frequency = [9 11];
freq1 = ft_selectdata(fcfg, freq);

fcfg = [];
fcfg.foilim = [9 11];
freq2 = ft_selectdata(fcfg, freq);

%%
% the result should be at 10 Hz in all cases, i.e. averaged from 9-11

cfg = [];
cfg.headmodel = headmodel;
cfg.sourcemodel = sourcemodel;
cfg.frequency = [9 11];
source0 = ft_sourceanalysis(cfg, freq);

cfg = [];
cfg.headmodel = headmodel;
cfg.sourcemodel = sourcemodel;
source1 = ft_sourceanalysis(cfg, freq1);

cfg = [];
cfg.headmodel = headmodel;
cfg.sourcemodel = sourcemodel;
source2 = ft_sourceanalysis(cfg, freq2);

assert(isequal(source0.freq, [10]));
assert(isequal(source1.freq, [10]));
assert(isequal(source2.freq, [10]));

assert(isequaln(source0.avg.pow, source1.avg.pow));
assert(isequaln(source0.avg.pow, source2.avg.pow));


