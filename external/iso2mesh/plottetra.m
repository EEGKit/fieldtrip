function hm = plottetra(node, elem, varargin)
%
% hm=plottetra(node,elem,opt)
%
% plot 3D surface meshes
%
% author: Qianqian Fang <q.fang at neu.edu>
%
% input:
%      node: a node coordinate list, 3 columns for x/y/z; if node has a
%            4th column, it will be used to set the color at each node.
%      elem: a tetrahedral element list; if elem has a 5th column,
%            and the 5th column are all integers, it will be treated
%            as labels of sub-domains and display them in different colors.
%            if the 5th column contains non-integer values, it will be
%            used to map to the color of triangles.
%      opt:  additional options for a patch object, see plotmesh
%
% output:
%   hm: handle or handles (vector) to the plotted surfaces
%
% example:
%
%   h=plottetra(node,elem);
%   h=plottetra(node,elem,'facealpha',0.5);
%
% -- this function is part of iso2mesh toolbox (http://iso2mesh.sf.net)
%

rngstate = rand ('state');

randseed = hex2dec('623F9A9E'); % "U+623F U+9A9E"
if (isoctavemesh)
    randseed = randseed + 3;
end

if (~isempty(getvarfrom({'caller', 'base'}, 'ISO2MESH_RANDSEED')))
    randseed = getvarfrom({'caller', 'base'}, 'ISO2MESH_RANDSEED');
end
rand('state', randseed);

if (~iscell(elem))
    if (size(elem, 2) > 4)
        tag = elem(:, 5);
        types = unique(tag);
        hold on;
        h = [];
        if (all(isinteger(tag)))
            for i = 1:length(types)
                idx = find(tag == types(i));
                face = volface(elem(idx, 1:4));
                if (size(node, 2) == 3)
                    h = [h plotsurf(node, face, 'facecolor', rand(3, 1), varargin{:})];
                else
                    h = [h plotsurf(node, face, varargin{:})];
                end
            end
        else
            [face, eid] = volface(elem(:, 1:4));
            if (size(elem, 2) >= 5)
                h = [h plotsurf(node, face, 'FaceVertexCData', tag(eid), varargin{:})];
            else
                h = [h plotsurf(node, face, varargin{:})];
            end
        end
    else
        face = volface(elem(:, 1:4));
        h = plotsurf(node, face, varargin{:});
    end
end

if (~isempty(h))
    axis equal;
end
if (~isempty(h) && nargout >= 1)
    hm = h;
end

rand ('state', rngstate);
