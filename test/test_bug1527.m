function test_bug1527

% MEM 1gb
% WALLTIME 00:10:00
% DEPENDENCY ft_sourceplot
% DATA private

load(dccnpath('/project/3031000.02/test/bug1527.mat'));

% this should be enough to reproduce the error
ft_sourceplot(cfg, source)
