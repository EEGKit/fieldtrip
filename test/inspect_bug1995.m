function inspect_bug1995

% WALLTIME 00:10:00
% MEM 1gb
% DEPENDENCY ft_voumerealign ft_sourceplot
% DATA private

filename = dccnpath('/project/3031000.02/test/latest/mri/dicom/19112010_JHORSCHIG.MR.FCDC_SEQUENCES_STANDARD_SEQUENCES.0002.0176.2010.11.19.12.08.01.265625.73007255.IMA');
mri = ft_read_mri(filename);

cfg =[];
cfg.method = 'interactive';
ft_volumerealign(cfg, mri);

cfg =[];
cfg.method = 'ortho';
% cfg.interactive = 'yes';
ft_sourceplot(cfg, mri);
