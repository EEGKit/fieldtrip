function [hs] = ft_plot_mesh(mesh, varargin)

% FT_PLOT_MESH visualizes a surface or volumetric mesh, for example with the cortical
% folding of the brain, or the scalp surface of the head. Surface meshes are
% described by triangles and consist of a structure with the fields "pos" and "tri".
% Volumetric meshes are described with tetrahedrons or hexahedrons and have the fields
% "pos" and "tet" or "hex".
%
% Use as
%   ft_plot_mesh(mesh, ...)
% or if you only want to plot the 3-D vertices
%   ft_plot_mesh(pos, ...)
%
% Optional arguments should come in key-value pairs and can include
%   'facecolor'       = [r g b] values or string, for example 'skin', 'skull', 'brain', 'black', 'red', 'r', or an Nx3 or Nx1 array where N is the number of faces
%   'facealpha'       = transparency, between 0 and 1 (default = 1)
%   'faceindex'       = true or false (default = false)
%   'vertexcolor'     = [r g b] values or string, for example 'skin', 'skull', 'brain', 'black', 'red', 'r', or an Nx3 or Nx1 array where N is the number of vertices
%   'vertexsize'      = scalar or vector with the size for each vertex (default = 10)
%   'vertexmarker'    = character, e.g. '.', 'o' or 'x' (default = '.')
%   'vertexindex'     = true or false (default = false)
%   'edgecolor'       = [r g b] values or string, for example 'skin', 'skull', 'brain', 'black', 'red', 'r'
%   'edgealpha'       = transparency, between 0 and 1 (default = 1)
%   'surfaceonly'     = true or false, plot only the outer surface of a hexahedral or tetrahedral mesh (default = false)
%   'cutlocation'     = 1x3 vector specifying a point on the plane that cuts the mesh
%   'cutorientation'  = 1x3 vector specifying the direction orthogonal through the plane that cuts the mesh
%   'unit'            = string, convert to the specified geometrical units (default = [])
%   'axes'            = boolean, whether to plot the axes of the 3D coordinate system (default = false)
%   'maskstyle'       = 'opacity' or 'colormix', if the latter is specified, opacity masked color values
%                       are converted (in combination with a background color) to RGB. This bypasses
%                       openGL functionality, which behaves unpredictably on some platforms (e.g. when
%                       using software opengl)
%   'fontsize'        = number, sets the size of the text (default = 10)
%   'fontunits'       =
%   'fontname'        =
%   'fontweight'      =
%   'tag'             = string, the tag assigned to the plotted elements (default = '')
%
% If you don't want the faces, edges or vertices to be plotted, you should specify the color as 'none'.
%
% Example
%   [pos, tri] = mesh_sphere(162);
%   mesh.pos = pos;
%   mesh.tri = tri;
%   ft_plot_mesh(mesh, 'facecolor', 'skin', 'edgecolor', 'none');
%   camlight
%
% You can plot an additional contour around specified areas using
%   'contour'           = inside of contour per vertex, either 0 or 1
%   'contourcolor'      = string, color specification
%   'contourlinestyle'  = string, line specification
%   'contourlinewidth'  = number
%
% See also FT_PREPARE_MESH, FT_PLOT_SENS, FT_PLOT_HEADSHAPE, FT_PLOT_HEADMODEL,
% FT_PLOT_DIPOLE, TRIMESH, PATCH

% Copyright (C) 2009, Cristiano Micheli
% Copyright (C) 2009-2025, Robert Oostenveld
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

% rename pnt into pos
mesh = fixpos(mesh);

if ~isstruct(mesh) && isnumeric(mesh) && size(mesh,2)==3
  % the input seems like a list of points, convert into something that resembles a mesh
  mesh = struct('pos', mesh);
end

% the input is a structure, but might also be a struct-array
if numel(mesh)>1
  % plot each of the boundaries
  for i=1:numel(mesh)
    ft_plot_mesh(mesh(i), varargin{:})
  end
  return
end

% get the optional input arguments
if isfield(mesh, 'tri') && size(mesh.tri,1)>10000
  facecolor     = ft_getopt(varargin, 'facecolor',   'cortex_light');
  edgecolor     = ft_getopt(varargin, 'edgecolor',   'none');
else
  facecolor     = ft_getopt(varargin, 'facecolor',   'white');
  edgecolor     = ft_getopt(varargin, 'edgecolor',   'k');
end
vertexcolor     = ft_getopt(varargin, 'vertexcolor');
vertexindex     = ft_getopt(varargin, 'vertexindex',   false);
vertexsize      = ft_getopt(varargin, 'vertexsize',    10);
vertexmarker    = ft_getopt(varargin, 'vertexmarker',  '.');
faceindex       = ft_getopt(varargin, 'faceindex',     false);
facealpha       = ft_getopt(varargin, 'facealpha',     1);
edgealpha       = ft_getopt(varargin, 'edgealpha',     1);
edgelinewidth   = ft_getopt(varargin, 'edgelinewidth', 0.5);
material_       = ft_getopt(varargin, 'material');         % note the underscore, there is also a material function
tag             = ft_getopt(varargin, 'tag',           '');
surfaceonly     = ft_getopt(varargin, 'surfaceonly');      % default is handled below
unit            = ft_getopt(varargin, 'unit');
axes_           = ft_getopt(varargin, 'axes',      false); % do not confuse with built-in function
alphalim        = ft_getopt(varargin, 'alphalim');
alphamapping    = ft_getopt(varargin, 'alphamap',  'rampup');
maskstyle       = ft_getopt(varargin, 'maskstyle', 'opacity');
cmap            = ft_getopt(varargin, 'colormap');
clim            = ft_getopt(varargin, 'clim');
contour         = ft_getopt(varargin, 'contour');
insideonly      = ft_getopt(varargin, 'insideonly', false);
cutlocation     = ft_getopt(varargin, 'cutlocation', []);
cutorientation  = ft_getopt(varargin, 'cutorientation', []);

% these have to do with the font
fontcolor       = ft_getopt(varargin, 'fontcolor', 'k');  % default is black
fontsize        = ft_getopt(varargin, 'fontsize',   get(0, 'defaulttextfontsize'));
fontname        = ft_getopt(varargin, 'fontname',   get(0, 'defaulttextfontname'));
fontweight      = ft_getopt(varargin, 'fontweight', get(0, 'defaulttextfontweight'));
fontunits       = ft_getopt(varargin, 'fontunits',  get(0, 'defaulttextfontunits'));

contourcolor      = ft_getopt(varargin, 'contourcolor',     'k');
contourlinewidth  = ft_getopt(varargin, 'contourlinewidth', 3);
contourlinestyle  = ft_getopt(varargin, 'contourlinestyle', '-');

haspos   = isfield(mesh, 'pos');   % vertices
hascolor = isfield(mesh, 'color'); % color code for vertices
hastri   = isfield(mesh, 'tri');   % triangles   as a Mx3 matrix with vertex indices
hastet   = isfield(mesh, 'tet');   % tetrahedrons as a Mx4 matrix with vertex indices
hashex   = isfield(mesh, 'hex');   % hexahedrons  as a Mx8 matrix with vertex indices
hasline  = isfield(mesh, 'line');  % lines       as a Mx2 matrix with vertex indices
haspoly  = isfield(mesh, 'poly');  % polygons    as a MxP matrix with vertex indices
hasinside = isfield(mesh, 'inside');

if ~isempty(unit)
  mesh = ft_convert_units(mesh, unit);
end

if hastri+hastet+hashex+hasline+haspoly==1
  if hasinside && istrue(insideonly)
    % overrule inconsistent user setting
    ft_warning('overruling insideonly setting, don''t know how to deal with this in the presence of mesh faces');
    insideonly = false;
  end
elseif hastri+hastet+hashex+hasline+haspoly>1
  % the code further down cannot deal with simultaneous triangles, tetrahedrons and/or hexahedrons therefore we plot them one by one
  if hastri
    ft_plot_mesh(removefields(mesh, {'tet', 'hex', 'line', 'poly'}), varargin{:});
  end
  if hastet
    ft_plot_mesh(removefields(mesh, {'tri', 'hex', 'line', 'poly'}), varargin{:});
  end
  if hashex
    ft_plot_mesh(removefields(mesh, {'tri', 'tet', 'line', 'poly'}), varargin{:});
  end
  if hasline
    ft_plot_mesh(removefields(mesh, {'tri', 'tet', 'hex', 'poly'}), varargin{:});
  end
  if haspoly
    ft_plot_mesh(removefields(mesh, {'tri', 'tet', 'hex', 'line'}), varargin{:});
  end
  return
elseif hastri+hastet+hashex+hasline+haspoly==0
  % this is a situation where there are only vertices to plot, and it's safe to apply the inside vector if requested
  insideonly = istrue(insideonly);
end

if isempty(surfaceonly)
  % set the default depending on the input mesh
  if hastet
    ft_warning('only visualizing the outer surface of the tetrahedral mesh, see the "surfaceonly" option')
    surfaceonly = true;
  elseif hashex
    ft_warning('only visualizing the outer surface of the hexahedral mesh, see the "surfaceonly" option')
    surfaceonly = true;
  else
    surfaceonly = false;
  end
end

% convert string into boolean values
faceindex   = istrue(faceindex);   % yes=view the face number
vertexindex = istrue(vertexindex); % yes=view the vertex number
surfaceonly = istrue(surfaceonly); % yes/no

if surfaceonly
  mesh = mesh2edge(mesh);
  % update the flags that indicate which surface/volume elements are present
  hastri   = isfield(mesh, 'tri');   % triangles   as a Mx3 matrix with vertex indices
  hastet   = isfield(mesh, 'tet');   % tetrahedrons as a Mx4 matrix with vertex indices
  hashex   = isfield(mesh, 'hex');   % hexahedrons  as a Mx8 matrix with vertex indices
  hasline  = isfield(mesh, 'line');  % lines       as a Mx2 matrix with vertex indices
  haspoly  = isfield(mesh, 'poly');  % polygons    as a MxP matrix with vertex indices
end

if isempty(vertexcolor)
  if haspos && hascolor && (hastri || hastet || hashex || hasline || haspoly)
    vertexcolor = mesh.color;
  elseif haspos && (hastri || hastet || hashex || hasline || haspoly)
    vertexcolor ='none';
  else
    vertexcolor ='k';
  end
end

% there are various ways of specifying that this should not be plotted
if isequal(vertexcolor, 'false') || isequal(vertexcolor, 'no') || isequal(vertexcolor, 'off') || isequal(vertexcolor, false)
  vertexcolor = 'none';
end
if isequal(facecolor, 'false') || isequal(facecolor, 'no') || isequal(facecolor, 'off') || isequal(facecolor, false)
  facecolor = 'none';
end
if isequal(edgecolor, 'false') || isequal(edgecolor, 'no') || isequal(edgecolor, 'off') || isequal(edgecolor, false)
  edgecolor = 'none';
end

% color management
if ischar(vertexcolor) && ~isequal(vertexcolor, 'curv') 
  vertexcolor = colorspec2rgb(vertexcolor);
elseif ischar(vertexcolor) && isequal(vertexcolor, 'curv') % default of ft_sourceplot method surface
  if isfield(mesh, 'curv')
    cortex_light = colorspec2rgb('cortex_light');
    cortex_dark  = colorspec2rgb('cortex_dark');
    % the curvature determines the color of gyri and sulci
    vertexcolor = mesh.curv(:) * cortex_dark + (1-mesh.curv(:)) * cortex_light;
  else
    cortex_light = colorspec2rgb('cortex_light');
    vertexcolor  = repmat(cortex_light, size(mesh.pos,1), 1);
    ft_warning('no curv field present in the mesh structure, using cortex_light as vertexcolor')
  end
end

if ischar(facecolor), facecolor = colorspec2rgb(facecolor); end
if ischar(edgecolor), edgecolor = colorspec2rgb(edgecolor); end

if isfield(mesh, 'pos')
  % this is assumed to reflect 3-D vertices
  pos = mesh.pos;
  if insideonly
    pos = pos(mesh.inside,:);
  end
elseif isfield(mesh, 'prj')
  % this happens sometimes if the 3-D vertices are projected to a 2-D plane
  pos = mesh.prj;
else
  ft_error('no vertices found');
end

if ~isempty(cutlocation) && ~isempty(cutorientation)
  % shift the vertices so that the cut location is at the origin
  shiftedpos = pos;
  shiftedpos(:,1) = shiftedpos(:,1) - cutlocation(1);
  shiftedpos(:,2) = shiftedpos(:,2) - cutlocation(2);
  shiftedpos(:,3) = shiftedpos(:,3) - cutlocation(3);
  % find the vertices that are on the positive side of the plane, given the orientation
  cut = (shiftedpos * cutorientation(:))>0;
  % disable the vertices that are cut, note that this results in a ragged edge
  pos(cut,:) = nan;
end

if isempty(pos)
  hs = [];
  return
end

if hastri
  tri = mesh.tri;
elseif haspoly
  % these are treated just like triangles
  tri = mesh.poly;
elseif hastet
  % represent the tetraeders as the four triangles
  tri = [
    mesh.tet(:,[1 2 3]);
    mesh.tet(:,[2 3 4]);
    mesh.tet(:,[3 4 1]);
    mesh.tet(:,[4 1 2])];
  % or according to SimBio:  (1 2 3), (2 4 3), (4 1 3), (1 4 2)
  % there are shared triangles between neighbouring tetraeders, remove these
  tri = unique(tri, 'rows');
elseif hashex
  % represent the hexahedrons as a collection of 6 patches
  tri = [
    mesh.hex(:,[1 2 3 4]);
    mesh.hex(:,[5 6 7 8]);
    mesh.hex(:,[1 2 6 5]);
    mesh.hex(:,[2 3 7 6]);
    mesh.hex(:,[3 4 8 7]);
    mesh.hex(:,[4 1 5 8]);
    ];
  % there are shared faces between neighbouring hexahedrons, remove these
  tri = unique(tri, 'rows');
else
  tri = [];
end

if hasline
  line = mesh.line;
else
  line = [];
end

% everything is added to the current figure
holdflag = ishold;
if ~holdflag
  hold on
end

if haspos
  if ~isempty(tri)
    hs = patch('Vertices', pos, 'Faces', tri);
  elseif ~isempty(line)
    hs = patch('Vertices', pos, 'Faces', line);
  else
    hs = patch('Vertices', pos, 'Faces', []);
  end
  %set(hs, 'FaceColor', facecolor);
  set(hs, 'EdgeColor', edgecolor);
  set(hs, 'LineWidth', edgelinewidth);
  set(hs, 'tag', tag);
end

if ~isempty(material_)
  material(material_); % dull, default, shiny or metal
end

% the vertexcolor can be specified either as a RGB color for each vertex, or as a single value at each vertex
% the facecolor can be specified either as a RGB color for each triangle, or as a single value at each triangle
% if there are triangles, the vertexcolor is used for linear interpolation over the patches
vertexpotential = ~isempty(tri) && ~ischar(vertexcolor) && (size(pos,1)==numel(vertexcolor) || size(pos,1)==size(vertexcolor,1) && (size(vertexcolor,2)==1 || size(vertexcolor,2)==3));
facepotential   = ~isempty(tri) && ~ischar(facecolor  ) && (size(tri,1)==numel(facecolor  ) || size(tri,1)==size(facecolor  ,1) && (size(facecolor  ,2)==1 || size(facecolor,  2)==3));

switch maskstyle
  case 'opacity'
    % if both vertexcolor and facecolor are numeric arrays, let the vertexcolor prevail
    if vertexpotential
      % vertexcolor is an array with number of elements equal to the number of vertices
      set(hs, 'FaceVertexCData', vertexcolor, 'FaceColor', 'interp');
      if numel(vertexcolor)==size(pos,1)
        if ~isempty(clim), set(gca, 'clim', clim); end
        if ~isempty(cmap), ft_colormap(cmap); end
      end
    elseif facepotential
      set(hs, 'FaceVertexCData', facecolor, 'FaceColor', 'flat');
      if numel(facecolor)==size(tri,1)
        if ~isempty(clim), set(gca, 'clim', clim); end
        if ~isempty(cmap), ft_colormap(cmap); end
      end
    else
      % the color is indicated as a single character or as a single RGB triplet
      set(hs, 'FaceColor', facecolor);
    end

    % facealpha is a scalar, or an vector matching the number of vertices
    if size(pos,1)==numel(facealpha)
      set(hs, 'FaceVertexAlphaData', facealpha);
      set(hs, 'FaceAlpha', 'interp');
    elseif ~isempty(pos) && numel(facealpha)==1 && facealpha~=1
      % the default is 1, so that does not have to be set
      set(hs, 'FaceAlpha', facealpha);
    end

    if edgealpha~=1
      % the default is 1, so that does not have to be set
      set(hs, 'EdgeAlpha', edgealpha);
    end

    if ~(all(facealpha==1) && edgealpha==1)
      if ~isempty(alphalim)
        alim(gca, alphalim);
      end
      alphamap(alphamapping);
    end

  case 'colormix'
    % ensure facecolor to be 1x3
    assert(isequal(size(facecolor),[1 3]), 'facecolor should be 1x3');

    % ensure facealpha to be nvertex x 1
    if numel(facealpha)==1
      facealpha = repmat(facealpha, size(pos,1), 1);
    end
    assert(isequal(numel(facealpha),size(pos,1)), 'facealpha should be %dx1', size(pos,1));

    bgcolor = repmat(facecolor, [numel(vertexcolor) 1]);
    rgb     = bg_rgba2rgb(bgcolor, vertexcolor, cmap, clim, facealpha, alphamapping, alphalim);
    set(hs, 'FaceVertexCData', rgb, 'facecolor', 'interp');
    if ~isempty(clim); caxis(clim); end % set colorbar scale to match [fcolmin fcolmax]
end

if ~isempty(contour)
  if ~iscell(contour), contour = {contour}; end
  if ~iscell(contourlinestyle), contourlinestyle = {contourlinestyle}; end

  if ischar(contourcolor)
    if numel(contour)>numel(contourcolor)
      contourcolor = repmat(contourcolor(:), [numel(contour) 1]);
    else
      contourcolor = contourcolor(:);
    end
  end
  if size(contourcolor,2)==3 && numel(contour)>size(contourcolor,1), contourcolor = repmat(contourcolor, [numel(contour) 1] ); end
  if numel(contour)>numel(contourlinewidth), contourlinewidth = repmat(contourlinewidth, [1 numel(contour)]); end
  if numel(contour)>numel(contourlinestyle), contourlinestyle = repmat(contourlinestyle, [1 numel(contour)]); end

  for m = 1:numel(contour)
    C    = full(triangle2connectivity(tri));
    clus = findcluster(contour{m},C,0);

    for cl = 1:max(clus)
      idxcl = find(clus==cl);
      [xbnd, ybnd, zbnd] = extract_contour(pos,tri,idxcl,contour{m});

      % draw each individual line segment of the intersection
      p = [];
      for i = 1:length(xbnd)
        p(i) = patch(xbnd(i,:)', ybnd(i,:)', zbnd(i,:)',NaN);
      end
      set(p(:), 'EdgeColor', contourcolor(m,:), 'LineWidth', contourlinewidth(m), 'LineStyle', contourlinestyle{m});
    end
  end
end

if faceindex
  % plot the triangle indices (numbers) at each face
  for face_indx=1:size(tri,1)
    str = sprintf('%d', face_indx);
    tri_x = (pos(tri(face_indx,1), 1) +  pos(tri(face_indx,2), 1) +  pos(tri(face_indx,3), 1))/3;
    tri_y = (pos(tri(face_indx,1), 2) +  pos(tri(face_indx,2), 2) +  pos(tri(face_indx,3), 2))/3;
    tri_z = (pos(tri(face_indx,1), 3) +  pos(tri(face_indx,2), 3) +  pos(tri(face_indx,3), 3))/3;
    h   = text(tri_x, tri_y, tri_z, str, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    hs  = [hs; h];
  end
end

if ~isequal(vertexcolor, 'none') && ~vertexpotential
  % plot the vertices as points

  if isempty(vertexcolor)
    % use black for all points
    if isscalar(vertexsize)
      if size(pos,2)==2
        hs = plot(pos(:,1), pos(:,2), ['k' vertexmarker]);
      else
        hs = plot3(pos(:,1), pos(:,2), pos(:,3), ['k' vertexmarker]);
      end
      set(hs, 'MarkerSize', vertexsize);
    else
      if size(pos,2)==2
        for i=1:size(pos,1)
          hs = plot(pos(i,1), pos(i,2), ['k' vertexmarker]);
          set(hs, 'MarkerSize', vertexsize(i));
        end
      else
        for i=1:size(pos,1)
          hs = plot3(pos(i,1), pos(i,2), pos(i,3), ['k' vertexmarker]);
          set(hs, 'MarkerSize', vertexsize(i));
        end
      end
    end

  elseif ischar(vertexcolor) && numel(vertexcolor)==1
    % one color for all points
    if isscalar(vertexsize)
      if size(pos,2)==2
        hs = plot(pos(:,1), pos(:,2), [vertexcolor vertexmarker]);
      else
        hs = plot3(pos(:,1), pos(:,2), pos(:,3), [vertexcolor vertexmarker]);
      end
      set(hs, 'MarkerSize', vertexsize);
    else
      if size(pos,2)==2
        for i=1:size(pos,1)
          hs = plot(pos(i,1), pos(i,2), [vertexcolor vertexmarker]);
          set(hs, 'MarkerSize', vertexsize(i));
        end
      else
        for i=1:size(pos,1)
          hs = plot3(pos(i,1), pos(i,2), pos(i,3), [vertexcolor vertexmarker]);
          set(hs, 'MarkerSize', vertexsize(i));
        end
      end
    end

  elseif ischar(vertexcolor) && numel(vertexcolor)==size(pos,1)
    % one color for each point
    if size(pos,2)==2
      for i=1:size(pos,1)
        hs = plot(pos(i,1), pos(i,2), [vertexcolor(i) vertexmarker]);
        if isscalar(vertexsize)
          set(hs, 'MarkerSize', vertexsize);
        else
          set(hs, 'MarkerSize', vertexsize(i));
        end
      end
    else
      for i=1:size(pos,1)
        hs = plot3(pos(i,1), pos(i,2), pos(i,3), [vertexcolor(i) vertexmarker]);
        if isscalar(vertexsize)
          set(hs, 'MarkerSize', vertexsize);
        else
          set(hs, 'MarkerSize', vertexsize(i));
        end
      end
    end

  elseif ~ischar(vertexcolor) && size(vertexcolor,1)==1
    % one RGB color for all points
    if size(pos,2)==2
      hs = plot(pos(:,1), pos(:,2), vertexmarker);
      set(hs, 'MarkerSize', vertexsize, 'MarkerEdgeColor', vertexcolor);
    else
      hs = plot3(pos(:,1), pos(:,2), pos(:,3), vertexmarker);
      set(hs, 'MarkerSize', vertexsize, 'MarkerEdgeColor', vertexcolor);
    end

  elseif ~ischar(vertexcolor) && size(vertexcolor,1)==size(pos,1) && size(vertexcolor,2)==3
    % one RGB color for each point
    if size(pos,2)==2
      for i=1:size(pos,1)
        hs = plot(pos(i,1), pos(i,2), vertexmarker);
        if isscalar(vertexsize)
          set(hs, 'MarkerSize', vertexsize, 'MarkerEdgeColor', vertexcolor(i,:));
        else
          set(hs, 'MarkerSize', vertexsize(i), 'MarkerEdgeColor', vertexcolor(i,:));
        end
      end
    else
      for i=1:size(pos,1)
        hs = plot3(pos(i,1), pos(i,2), pos(i,3), vertexmarker);
        if isscalar(vertexsize)
          set(hs, 'MarkerSize', vertexsize, 'MarkerEdgeColor', vertexcolor(i,:));
        else
          set(hs, 'MarkerSize', vertexsize(i), 'MarkerEdgeColor', vertexcolor(i,:));
        end
      end
    end

  else
    ft_error('Unknown color specification for the vertices');
  end

end % plotting the vertices as points

if vertexindex
  % plot the vertex indices (numbers) at each node
  for node_indx=1:size(pos,1)
    str = sprintf('%d', node_indx);
    if size(pos, 2)==2
      h = text(pos(node_indx, 1), pos(node_indx, 2), str, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'color', fontcolor, 'fontunits', fontunits, 'fontsize', fontsize, 'fontname', fontname, 'fontweight', fontweight);
    else
      h = text(pos(node_indx, 1), pos(node_indx, 2), pos(node_indx, 3), str, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'color', fontcolor, 'fontunits', fontunits, 'fontsize', fontsize, 'fontname', fontname, 'fontweight', fontweight);
    end
    hs = [hs; h];
  end
end

axis off
axis vis3d
axis equal

if istrue(axes_)
  % plot the 3D axes, this depends on the units and coordsys
  ft_plot_axes(mesh);
end

if isfield(mesh, 'coordsys')
  % add a context sensitive menu to change the 3d viewpoint to top|bottom|left|right|front|back
  menu_viewpoint(gca, mesh.coordsys)
end

if ~holdflag
  hold off
end

if ~nargout
  clear hs
end
