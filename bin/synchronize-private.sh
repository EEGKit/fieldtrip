#!/usr/bin/env bash
################################################################################
#
# This Bash script synchronizes multiple copies of the same file in the repository.
# Note that it is not robust against files that have whitespace in their names.
#
# Please keep this file organized in alphabetical order.
#
################################################################################

function sync {
  # find the latest file from the list and copies it to all other files
  latest=`ls -t $* 2>/dev/null | head -n1`
  for file in $*; do
    if [ -n "$latest" ]; then
      if [ "$file" != "$latest" ] ; then
        cp "$latest" "$file"
      fi
    fi
  done
}

################################################################################
# add_mex_source.m

ARRAY=()
ARRAY+=(fileio/private/add_mex_source.m)
ARRAY+=(forward/private/add_mex_source.m)
sync ${ARRAY[*]}

################################################################################
# ama2headmodel.m

ARRAY=()
ARRAY+=(external/dipoli/ama2headmodel.m)
ARRAY+=(fileio/private/ama2headmodel.m)
ARRAY+=(forward/private/ama2headmodel.m)
sync ${ARRAY[*]}

################################################################################
# appendstruct.m

ARRAY=()
ARRAY+=(utilities/appendstruct.m)
ARRAY+=(fileio/private/appendstruct.m)
sync ${ARRAY[*]}

################################################################################
# artifact2boolvec.m

ARRAY=()
ARRAY+=(private/artifact2boolvec.m)
ARRAY+=(external/dss/private/artifact2boolvec.m)
sync ${ARRAY[*]}

################################################################################
# artifact2trl.m

ARRAY=()
ARRAY+=(private/artifact2trl.m)
ARRAY+=(external/dss/private/artifact2trl.m)
sync ${ARRAY[*]}
################################################################################
# atlas_lookup.m

ARRAY=()
ARRAY+=(contrib/nutmegtrip/private/atlas_lookup.m)
ARRAY+=(private/atlas_lookup.m)
ARRAY+=(plotting/private/atlas_lookup.m)
sync ${ARRAY[*]}

################################################################################
# avgref.m

ARRAY=()
ARRAY+=(inverse/private/avgref.m)
ARRAY+=(private/avgref.m)
sync ${ARRAY[*]}

################################################################################
# bg_rgba2rgb.m

ARRAY=()
ARRAY+=(plotting/private/bg_rgba2rgb.m)
ARRAY+=(private/bg_rgba2rgb.m)
sync ${ARRAY[*]}

################################################################################
# bids_sidecar.m

ARRAY=()
ARRAY+=(fileio/private/bids_sidecar.m)
ARRAY+=(trialfun/private/bids_sidecar.m)
sync ${ARRAY[*]}

################################################################################
# boolvec2artifact.m

ARRAY=()
ARRAY+=(private/boolvec2artifact.m)
ARRAY+=(external/dss/private/boolvec2artifact.m)
sync ${ARRAY[*]}

################################################################################
# buffer.mexa64

ARRAY=()
ARRAY+=(fileio/private/buffer.mexa64)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexa64)
sync ${ARRAY[*]}

################################################################################
# buffer.mexglx

ARRAY=()
ARRAY+=(fileio/private/buffer.mexglx)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexglx)
sync ${ARRAY[*]}

################################################################################
# buffer.mexmac

ARRAY=()
ARRAY+=(fileio/private/buffer.mexmac)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexmac)
sync ${ARRAY[*]}

################################################################################
# buffer.mexmaca64

ARRAY=()
ARRAY+=(fileio/private/buffer.mexmaca64)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# buffer.mexmaci

ARRAY=()
ARRAY+=(fileio/private/buffer.mexmaci)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexmaci)
sync ${ARRAY[*]}

################################################################################
# buffer.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/buffer.mexmaci64)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# buffer.mexw32

ARRAY=()
ARRAY+=(fileio/private/buffer.mexw32)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexw32)
sync ${ARRAY[*]}

################################################################################
# buffer.mexw64

ARRAY=()
ARRAY+=(fileio/private/buffer.mexw64)
ARRAY+=(realtime/src/buffer/matlab/buffer.mexw64)
sync ${ARRAY[*]}

################################################################################
# channelconnectivity.m

ARRAY=()
ARRAY+=(private/channelconnectivity.m)
ARRAY+=(test/private/channelconnectivity.m)
sync ${ARRAY[*]}

################################################################################
# channelposition.m

ARRAY=()
ARRAY+=(fileio/private/channelposition.m)
ARRAY+=(forward/private/channelposition.m)
ARRAY+=(plotting/private/channelposition.m)
ARRAY+=(private/channelposition.m)
ARRAY+=(utilities/private/channelposition.m)
sync ${ARRAY[*]}

################################################################################
# colorspec2rgb.m

ARRAY=()
ARRAY+=(plotting/private/colorspec2rgb.m)
ARRAY+=(private/colorspec2rgb.m)
sync ${ARRAY[*]}

################################################################################
# combineClusters.m

ARRAY=()
ARRAY+=(private/combineClusters.m)
ARRAY+=(plotting/private/combineClusters.m)
sync ${ARRAY[*]}

################################################################################
# combineClusters.mexa64

ARRAY=()
ARRAY+=(private/combineClusters.mexa64)
ARRAY+=(plotting/private/combineClusters.mexa64)
ARRAY+=(src/combineClusters.mexa64)
sync ${ARRAY[*]}

################################################################################
# combineClusters.mexw32

ARRAY=()
ARRAY+=(private/combineClusters.mexw32)
ARRAY+=(plotting/private/combineClusters.mexw32)
ARRAY+=(src/combineClusters.mexw32)
sync ${ARRAY[*]}

################################################################################
# combineClusters.mexw64

ARRAY=()
ARRAY+=(private/combineClusters.mexw64)
ARRAY+=(plotting/private/combineClusters.mexw64)
ARRAY+=(src/combineClusters.mexw64)
sync ${ARRAY[*]}

################################################################################
# compile_mex_list.m

ARRAY=()
ARRAY+=(fileio/private/compile_mex_list.m)
ARRAY+=(forward/private/compile_mex_list.m)
sync ${ARRAY[*]}

################################################################################
# compiler.h

ARRAY=()
ARRAY+=(src/compiler.h)
sync ${ARRAY[*]}

################################################################################
# contains.m

ARRAY=()
ARRAY+=(matlablt2016b/contains.m)
ARRAY+=(octave/contains.m)
sync ${ARRAY[*]}

################################################################################
# coordsys2label.m

ARRAY=()
ARRAY+=(utilities/private/coordsys2label.m)
ARRAY+=(plotting/private/coordsys2label.m)
ARRAY+=(private/coordsys2label.m)
sync ${ARRAY[*]}

################################################################################
# cornerpoints.m

ARRAY=()
ARRAY+=(fileio/private/cornerpoints.m)
ARRAY+=(forward/private/cornerpoints.m)
ARRAY+=(plotting/private/cornerpoints.m)
ARRAY+=(private/cornerpoints.m)
ARRAY+=(utilities/private/cornerpoints.m)
sync ${ARRAY[*]}

################################################################################
# csp.m

ARRAY=()
ARRAY+=(private/csp.m)
ARRAY+=(test/private/csp.m)
sync ${ARRAY[*]}

################################################################################
# ctf2grad.m

ARRAY=()
ARRAY+=(fileio/private/ctf2grad.m)
ARRAY+=(private/ctf2grad.m)
sync ${ARRAY[*]}

################################################################################
# dataset2files.m

ARRAY=()
ARRAY+=(fileio/private/dataset2files.m)
ARRAY+=(utilities/private/dataset2files.m)
sync ${ARRAY[*]}

################################################################################
# defaultId.m

ARRAY=()
ARRAY+=(connectivity/private/defaultId.m)
ARRAY+=(fileio/private/defaultId.m)
ARRAY+=(forward/private/defaultId.m)
ARRAY+=(inverse/private/defaultId.m)
ARRAY+=(plotting/private/defaultId.m)
ARRAY+=(preproc/private/defaultId.m)
ARRAY+=(private/defaultId.m)
ARRAY+=(specest/private/defaultId.m)
ARRAY+=(statfun/private/defaultId.m)
ARRAY+=(test/private/defaultId.m)
ARRAY+=(trialfun/private/defaultId.m)
ARRAY+=(utilities/private/defaultId.m)
sync ${ARRAY[*]}

################################################################################
# det2x2.m

ARRAY=()
ARRAY+=(connectivity/private/det2x2.m)
ARRAY+=(private/det2x2.m)
ARRAY+=(src/det2x2.m)
sync ${ARRAY[*]}

################################################################################
# det2x2.mexa64

ARRAY=()
ARRAY+=(connectivity/private/det2x2.mexa64)
ARRAY+=(private/det2x2.mexa64)
ARRAY+=(src/det2x2.mexa64)
sync ${ARRAY[*]}

################################################################################
# det2x2.mexglx

ARRAY=()
ARRAY+=(connectivity/private/det2x2.mexglx)
ARRAY+=(private/det2x2.mexglx)
ARRAY+=(src/det2x2.mexglx)
sync ${ARRAY[*]}

################################################################################
# det2x2.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/det2x2.mexmaci)
ARRAY+=(private/det2x2.mexmaci)
ARRAY+=(src/det2x2.mexmaci)
sync ${ARRAY[*]}

################################################################################
# det2x2.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/det2x2.mexmaci64)
ARRAY+=(private/det2x2.mexmaci64)
ARRAY+=(src/det2x2.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# det2x2.mexw32

ARRAY=()
ARRAY+=(connectivity/private/det2x2.mexw32)
ARRAY+=(private/det2x2.mexw32)
ARRAY+=(src/det2x2.mexw32)
sync ${ARRAY[*]}

################################################################################
# det2x2.mexw64

ARRAY=()
ARRAY+=(connectivity/private/det2x2.mexw64)
ARRAY+=(private/det2x2.mexw64)
ARRAY+=(src/det2x2.mexw64)
sync ${ARRAY[*]}

################################################################################
# det3x3.m

ARRAY=()
ARRAY+=(connectivity/private/det3x3.m)
ARRAY+=(private/det3x3.m)
ARRAY+=(src/det3x3.m)
sync ${ARRAY[*]}

################################################################################
# det3x3.mexa64

ARRAY=()
ARRAY+=(connectivity/private/det3x3.mexa64)
ARRAY+=(private/det3x3.mexa64)
ARRAY+=(src/det3x3.mexa64)
sync ${ARRAY[*]}

################################################################################
# det3x3.mexglx

ARRAY=()
ARRAY+=(connectivity/private/det3x3.mexglx)
ARRAY+=(private/det3x3.mexglx)
ARRAY+=(src/det3x3.mexglx)
sync ${ARRAY[*]}

################################################################################
# det3x3.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/det3x3.mexmaci)
ARRAY+=(private/det3x3.mexmaci)
ARRAY+=(src/det3x3.mexmaci)
sync ${ARRAY[*]}

################################################################################
# det3x3.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/det3x3.mexmaci64)
ARRAY+=(private/det3x3.mexmaci64)
ARRAY+=(src/det3x3.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# det3x3.mexw32

ARRAY=()
ARRAY+=(connectivity/private/det3x3.mexw32)
ARRAY+=(private/det3x3.mexw32)
ARRAY+=(src/det3x3.mexw32)
sync ${ARRAY[*]}

################################################################################
# det3x3.mexw64

ARRAY=()
ARRAY+=(connectivity/private/det3x3.mexw64)
ARRAY+=(private/det3x3.mexw64)
ARRAY+=(src/det3x3.mexw64)
sync ${ARRAY[*]}

################################################################################
# determine_segmentationstyle.m

ARRAY=()
ARRAY+=(private/determine_segmentationstyle.m)
ARRAY+=(utilities/private/determine_segmentationstyle.m)
sync ${ARRAY[*]}

################################################################################
# dimindex.m

ARRAY=()
ARRAY+=(private/dimindex.m)
ARRAY+=(utilities/private/dimindex.m)
sync ${ARRAY[*]}

################################################################################
# dimlength.m

ARRAY=()
ARRAY+=(fileio/private/dimlength.m)
ARRAY+=(private/dimlength.m)
ARRAY+=(utilities/private/dimlength.m)
sync ${ARRAY[*]}

################################################################################
# elproj.m

ARRAY=()
ARRAY+=(fileio/private/elproj.m)
ARRAY+=(forward/private/elproj.m)
ARRAY+=(plotting/private/elproj.m)
ARRAY+=(test/private/elproj.m)
ARRAY+=(private/elproj.m)
sync ${ARRAY[*]}

################################################################################
# encode_nifti1.m

ARRAY=()
ARRAY+=(fileio/private/encode_nifti1.m)
ARRAY+=(realtime/example/private/encode_nifti1.m)
ARRAY+=(realtime/online_mri/private/encode_nifti1.m)
sync ${ARRAY[*]}

################################################################################
# endsWith.m

ARRAY=()
ARRAY+=(matlablt2016b/endsWith.m)
ARRAY+=(octave/endsWith.m)
sync ${ARRAY[*]}

################################################################################
# fexec.m

ARRAY=()
ARRAY+=(qsub/private/fexec.m)
sync ${ARRAY[*]}

################################################################################
# filter_with_correction.m

ARRAY=()
ARRAY+=(preproc/private/filter_with_correction.m)
ARRAY+=(specest/private/filter_with_correction.m)
sync ${ARRAY[*]}

################################################################################
# findcluster.m

ARRAY=()
ARRAY+=(private/findcluster.m)
ARRAY+=(plotting/private/findcluster.m)
sync ${ARRAY[*]}

################################################################################
# find_innermost_boundary.m

ARRAY=()
ARRAY+=(external/dipoli/private/find_innermost_boundary.m)
ARRAY+=(external/openmeeg/private/find_innermost_boundary.m)
ARRAY+=(forward/private/find_innermost_boundary.m)
ARRAY+=(inverse/private/find_innermost_boundary.m)
ARRAY+=(private/find_innermost_boundary.m)
sync ${ARRAY[*]}

################################################################################
# find_mesh_edge.m

ARRAY=()
ARRAY+=(forward/private/find_mesh_edge.m)
ARRAY+=(plotting/private/find_mesh_edge.m)
ARRAY+=(private/find_mesh_edge.m)
sync ${ARRAY[*]}

################################################################################
# find_outermost_boundary.m

ARRAY=()
ARRAY+=(external/dipoli/private/find_outermost_boundary.m)
ARRAY+=(external/openmeeg/private/find_outermost_boundary.m)
ARRAY+=(fileio/private/find_outermost_boundary.m)
ARRAY+=(forward/private/find_outermost_boundary.m)
ARRAY+=(private/find_outermost_boundary.m)
sync ${ARRAY[*]}

################################################################################
# find_triangle_neighbours.m

ARRAY=()
ARRAY+=(forward/private/find_triangle_neighbours.m)
ARRAY+=(plotting/private/find_triangle_neighbours.m)
ARRAY+=(private/find_triangle_neighbours.m)
sync ${ARRAY[*]}

################################################################################
# fir_df.m

ARRAY=()
ARRAY+=(preproc/private/fir_df.m)
ARRAY+=(specest/private/fir_df.m)
sync ${ARRAY[*]}

################################################################################
# fir_filterdcpadded.m

ARRAY=()
ARRAY+=(preproc/private/fir_filterdcpadded.m)
ARRAY+=(specest/private/fir_filterdcpadded.m)
sync ${ARRAY[*]}

################################################################################
# firws.m

ARRAY=()
ARRAY+=(preproc/private/firws.m)
ARRAY+=(specest/private/firws.m)
sync ${ARRAY[*]}

################################################################################
# firwsord.m

ARRAY=()
ARRAY+=(preproc/private/firwsord.m)
ARRAY+=(specest/private/firwsord.m)
sync ${ARRAY[*]}

################################################################################
# fitsphere.m

ARRAY=()
ARRAY+=(forward/private/fitsphere.m)
ARRAY+=(plotting/private/fitsphere.m)
ARRAY+=(private/fitsphere.m)
sync ${ARRAY[*]}

################################################################################
# fixcoordsys.m

ARRAY=()
ARRAY+=(fileio/private/fixcoordsys.m)
ARRAY+=(forward/private/fixcoordsys.m)
ARRAY+=(plotting/private/fixcoordsys.m)
ARRAY+=(utilities/private/fixcoordsys.m)
sync ${ARRAY[*]}

################################################################################
# fixdimord.m

ARRAY=()
ARRAY+=(fileio/private/fixdimord.m)
ARRAY+=(private/fixdimord.m)
ARRAY+=(utilities/private/fixdimord.m)
sync ${ARRAY[*]}

################################################################################
# fixdipole.m

ARRAY=()
ARRAY+=(inverse/private/fixdipole.m)
ARRAY+=(private/fixdipole.m)
ARRAY+=(utilities/private/fixdipole.m)
sync ${ARRAY[*]}

################################################################################
# fixinside.m

ARRAY=()
ARRAY+=(inverse/private/fixinside.m)
ARRAY+=(fileio/private/fixinside.m)
ARRAY+=(private/fixinside.m)
ARRAY+=(utilities/private/fixinside.m)
sync ${ARRAY[*]}

################################################################################
# fixoldorg.m

ARRAY=()
ARRAY+=(fileio/private/fixoldorg.m)
ARRAY+=(forward/private/fixoldorg.m)
ARRAY+=(plotting/private/fixoldorg.m)
ARRAY+=(utilities/private/fixoldorg.m)
sync ${ARRAY[*]}

################################################################################
# fixname.m

ARRAY=()
ARRAY+=(connectivity/private/fixname.m)
ARRAY+=(fileio/private/fixname.m)
ARRAY+=(forward/private/fixname.m)
ARRAY+=(inverse/private/fixname.m)
ARRAY+=(plotting/private/fixname.m)
ARRAY+=(preproc/private/fixname.m)
ARRAY+=(private/fixname.m)
ARRAY+=(qsub/private/fixname.m)
ARRAY+=(specest/private/fixname.m)
ARRAY+=(statfun/private/fixname.m)
ARRAY+=(test/private/fixname.m)
ARRAY+=(utilities/private/fixname.m)
ARRAY+=(compat/matlablt2014b/private/fixname.m)
sync ${ARRAY[*]}

################################################################################
# fixpos.m

ARRAY=()
ARRAY+=(fileio/private/fixpos.m)
ARRAY+=(forward/private/fixpos.m)
ARRAY+=(plotting/private/fixpos.m)
ARRAY+=(private/fixpos.m)
ARRAY+=(utilities/private/fixpos.m)
sync ${ARRAY[*]}

################################################################################
# fixsampleinfo.m

ARRAY=()
ARRAY+=(fileio/private/fixsampleinfo.m)
ARRAY+=(private/fixsampleinfo.m)
ARRAY+=(utilities/private/fixsampleinfo.m)
sync ${ARRAY[*]}

################################################################################
# fopen_or_error.m

ARRAY=()
ARRAY+=(private/fopen_or_error.m)
ARRAY+=(fileio/private/fopen_or_error.m)
sync ${ARRAY[*]}

################################################################################
# ft_apply_montage.m

ARRAY=()
ARRAY+=(fileio/private/ft_apply_montage.m)
ARRAY+=(forward/ft_apply_montage.m)
ARRAY+=(plotting/private/ft_apply_montage.m)
sync ${ARRAY[*]}

################################################################################
# ft_checkdata.m

ARRAY=()
ARRAY+=(fileio/private/ft_checkdata.m)
ARRAY+=(utilities/ft_checkdata.m)
sync ${ARRAY[*]}

################################################################################
# ft_checkopt.m

ARRAY=()
ARRAY+=(qsub/private/ft_checkopt.m)
ARRAY+=(utilities/ft_checkopt.m)
sync ${ARRAY[*]}

################################################################################
# ft_convert_units.m

ARRAY=()
ARRAY+=(fileio/private/ft_convert_units.m)
ARRAY+=(forward/ft_convert_units.m)
ARRAY+=(plotting/private/ft_convert_units.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype.m)
ARRAY+=(utilities/ft_datatype.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_comp.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_comp.m)
ARRAY+=(utilities/ft_datatype_comp.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_dip.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_dip.m)
ARRAY+=(utilities/ft_datatype_dip.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_freq.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_freq.m)
ARRAY+=(utilities/ft_datatype_freq.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_headmodel.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_headmodel.m)
ARRAY+=(forward/private/ft_datatype_headmodel.m)
ARRAY+=(utilities/ft_datatype_headmodel.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_mvar.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_mvar.m)
ARRAY+=(utilities/ft_datatype_mvar.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_raw.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_raw.m)
ARRAY+=(utilities/ft_datatype_raw.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_sens.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_sens.m)
ARRAY+=(forward/private/ft_datatype_sens.m)
ARRAY+=(plotting/private/ft_datatype_sens.m)
ARRAY+=(utilities/ft_datatype_sens.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_source.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_source.m)
ARRAY+=(utilities/ft_datatype_source.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_spike.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_spike.m)
ARRAY+=(utilities/ft_datatype_spike.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_timelock.m

ARRAY=()
ARRAY+=(fileio/private/ft_datatype_timelock.m)
ARRAY+=(utilities/ft_datatype_timelock.m)
sync ${ARRAY[*]}

################################################################################
# ft_datatype_volume.m

ARRAY=()
ARRAY+=(plotting/private/ft_datatype_volume.m)
ARRAY+=(utilities/ft_datatype_volume.m)
sync ${ARRAY[*]}

################################################################################
# ft_determine_units.m

ARRAY=()
ARRAY+=(fileio/private/ft_determine_units.m)
ARRAY+=(forward/ft_determine_units.m)
ARRAY+=(plotting/private/ft_determine_units.m)
sync ${ARRAY[*]}

################################################################################
# ft_estimate_units.m

ARRAY=()
ARRAY+=(fileio/private/ft_estimate_units.m)
ARRAY+=(forward/ft_estimate_units.m)
ARRAY+=(plotting/private/ft_estimate_units.m)
sync ${ARRAY[*]}

################################################################################
# ft_fetch_data.m

ARRAY=()
ARRAY+=(fileio/private/ft_fetch_data.m)
ARRAY+=(test/private/ft_fetch_data.m)
ARRAY+=(utilities/ft_fetch_data.m)
sync ${ARRAY[*]}

################################################################################
# ft_fetch_header.m

ARRAY=()
ARRAY+=(fileio/private/ft_fetch_header.m)
ARRAY+=(utilities/ft_fetch_header.m)
sync ${ARRAY[*]}

################################################################################
# ft_fetch_sens.m

ARRAY=()
ARRAY+=(private/ft_fetch_sens.m)
ARRAY+=(test/private/ft_fetch_sens.m)
ARRAY+=(external/artinis/private/ft_fetch_sens.m)
sync ${ARRAY[*]}

################################################################################
# ft_findcfg.m

ARRAY=()
ARRAY+=(fileio/private/ft_findcfg.m)
ARRAY+=(utilities/ft_findcfg.m)
ARRAY+=(utilities/private/ft_findcfg.m)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.c

ARRAY=()
ARRAY+=(src/ft_getopt.c)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.m

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.m)
ARRAY+=(fileio/private/ft_getopt.m)
ARRAY+=(forward/private/ft_getopt.m)
ARRAY+=(inverse/private/ft_getopt.m)
ARRAY+=(plotting/private/ft_getopt.m)
ARRAY+=(qsub/private/ft_getopt.m)
ARRAY+=(specest/private/ft_getopt.m)
ARRAY+=(utilities/ft_getopt.m)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.mexa64

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.mexa64)
ARRAY+=(fileio/private/ft_getopt.mexa64)
ARRAY+=(forward/private/ft_getopt.mexa64)
ARRAY+=(inverse/private/ft_getopt.mexa64)
ARRAY+=(plotting/private/ft_getopt.mexa64)
ARRAY+=(qsub/private/ft_getopt.mexa64)
ARRAY+=(specest/private/ft_getopt.mexa64)
ARRAY+=(src/ft_getopt.mexa64)
ARRAY+=(utilities/ft_getopt.mexa64)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.mexglx

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.mexglx)
ARRAY+=(fileio/private/ft_getopt.mexglx)
ARRAY+=(forward/private/ft_getopt.mexglx)
ARRAY+=(inverse/private/ft_getopt.mexglx)
ARRAY+=(plotting/private/ft_getopt.mexglx)
ARRAY+=(qsub/private/ft_getopt.mexglx)
ARRAY+=(specest/private/ft_getopt.mexglx)
ARRAY+=(src/ft_getopt.mexglx)
ARRAY+=(utilities/ft_getopt.mexglx)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.mexmaci)
ARRAY+=(fileio/private/ft_getopt.mexmaci)
ARRAY+=(forward/private/ft_getopt.mexmaci)
ARRAY+=(inverse/private/ft_getopt.mexmaci)
ARRAY+=(plotting/private/ft_getopt.mexmaci)
ARRAY+=(qsub/private/ft_getopt.mexmaci)
ARRAY+=(specest/private/ft_getopt.mexmaci)
ARRAY+=(src/ft_getopt.mexmaci)
ARRAY+=(utilities/ft_getopt.mexmaci)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.mexmaci64)
ARRAY+=(fileio/private/ft_getopt.mexmaci64)
ARRAY+=(forward/private/ft_getopt.mexmaci64)
ARRAY+=(inverse/private/ft_getopt.mexmaci64)
ARRAY+=(plotting/private/ft_getopt.mexmaci64)
ARRAY+=(qsub/private/ft_getopt.mexmaci64)
ARRAY+=(specest/private/ft_getopt.mexmaci64)
ARRAY+=(src/ft_getopt.mexmaci64)
ARRAY+=(utilities/ft_getopt.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.mexw32

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.mexw32)
ARRAY+=(fileio/private/ft_getopt.mexw32)
ARRAY+=(forward/private/ft_getopt.mexw32)
ARRAY+=(inverse/private/ft_getopt.mexw32)
ARRAY+=(plotting/private/ft_getopt.mexw32)
ARRAY+=(qsub/private/ft_getopt.mexw32)
ARRAY+=(specest/private/ft_getopt.mexw32)
ARRAY+=(src/ft_getopt.mexw32)
ARRAY+=(utilities/ft_getopt.mexw32)
sync ${ARRAY[*]}

################################################################################
# ft_getopt.mexw64

ARRAY=()
ARRAY+=(connectivity/private/ft_getopt.mexw64)
ARRAY+=(fileio/private/ft_getopt.mexw64)
ARRAY+=(forward/private/ft_getopt.mexw64)
ARRAY+=(inverse/private/ft_getopt.mexw64)
ARRAY+=(plotting/private/ft_getopt.mexw64)
ARRAY+=(qsub/private/ft_getopt.mexw64)
ARRAY+=(specest/private/ft_getopt.mexw64)
ARRAY+=(src/ft_getopt.mexw64)
ARRAY+=(utilities/ft_getopt.mexw64)
sync ${ARRAY[*]}

################################################################################
# ft_hastoolbox.m

ARRAY=()
ARRAY+=(fileio/private/ft_hastoolbox.m)
ARRAY+=(forward/private/ft_hastoolbox.m)
ARRAY+=(inverse/private/ft_hastoolbox.m)
ARRAY+=(plotting/private/ft_hastoolbox.m)
ARRAY+=(utilities/ft_hastoolbox.m)
sync ${ARRAY[*]}

################################################################################
# ft_headcoordinates.m

ARRAY=()
ARRAY+=(fileio/private/ft_headcoordinates.m)
ARRAY+=(forward/private/ft_headcoordinates.m)
ARRAY+=(utilities/ft_headcoordinates.m)
sync ${ARRAY[*]}

################################################################################
# ft_headmodeltype.m

ARRAY=()
ARRAY+=(fileio/private/ft_headmodeltype.m)
ARRAY+=(forward/ft_headmodeltype.m)
ARRAY+=(inverse/private/ft_headmodeltype.m)
ARRAY+=(plotting/private/ft_headmodeltype.m)
sync ${ARRAY[*]}

################################################################################
# ft_inside_headmodel.m

ARRAY=()
ARRAY+=(forward/ft_inside_headmodel.m)
ARRAY+=(inverse/private/ft_inside_headmodel.m)
sync ${ARRAY[*]}

################################################################################
# ft_inv.m

ARRAY=()
ARRAY+=(private/ft_inv.m)
ARRAY+=(inverse/private/ft_inv.m)
sync ${ARRAY[*]}

################################################################################
# ft_notification.m, should be consistent with ft_warning etc

ARRAY=()
ARRAY+=(connectivity/private/ft_notification.m)
ARRAY+=(fileio/private/ft_notification.m)
ARRAY+=(forward/private/ft_notification.m)
ARRAY+=(inverse/private/ft_notification.m)
ARRAY+=(plotting/private/ft_notification.m)
ARRAY+=(preproc/private/ft_notification.m)
ARRAY+=(specest/private/ft_notification.m)
ARRAY+=(utilities/private/ft_notification.m)
sync ${ARRAY[*]}

ARRAY=()
ARRAY+=(connectivity/private/ft_warning.m)
ARRAY+=(fileio/private/ft_warning.m)
ARRAY+=(forward/private/ft_warning.m)
ARRAY+=(inverse/private/ft_warning.m)
ARRAY+=(plotting/private/ft_warning.m)
ARRAY+=(preproc/private/ft_warning.m)
ARRAY+=(specest/private/ft_warning.m)
ARRAY+=(utilities/ft_warning.m)
sync ${ARRAY[*]}

ARRAY=()
ARRAY+=(connectivity/private/ft_error.m)
ARRAY+=(fileio/private/ft_error.m)
ARRAY+=(forward/private/ft_error.m)
ARRAY+=(inverse/private/ft_error.m)
ARRAY+=(plotting/private/ft_error.m)
ARRAY+=(preproc/private/ft_error.m)
ARRAY+=(specest/private/ft_error.m)
ARRAY+=(utilities/ft_error.m)
sync ${ARRAY[*]}

ARRAY=()
ARRAY+=(connectivity/private/ft_notice.m)
ARRAY+=(fileio/private/ft_notice.m)
ARRAY+=(forward/private/ft_notice.m)
ARRAY+=(inverse/private/ft_notice.m)
ARRAY+=(plotting/private/ft_notice.m)
ARRAY+=(preproc/private/ft_notice.m)
ARRAY+=(specest/private/ft_notice.m)
ARRAY+=(utilities/ft_notice.m)
sync ${ARRAY[*]}

ARRAY=()
ARRAY+=(connectivity/private/ft_info.m)
ARRAY+=(fileio/private/ft_info.m)
ARRAY+=(forward/private/ft_info.m)
ARRAY+=(inverse/private/ft_info.m)
ARRAY+=(plotting/private/ft_info.m)
ARRAY+=(preproc/private/ft_info.m)
ARRAY+=(specest/private/ft_info.m)
ARRAY+=(utilities/ft_info.m)
sync ${ARRAY[*]}

ARRAY=()
ARRAY+=(connectivity/private/ft_debug.m)
ARRAY+=(fileio/private/ft_debug.m)
ARRAY+=(forward/private/ft_debug.m)
ARRAY+=(inverse/private/ft_debug.m)
ARRAY+=(plotting/private/ft_debug.m)
ARRAY+=(preproc/private/ft_debug.m)
ARRAY+=(specest/private/ft_debug.m)
ARRAY+=(utilities/ft_debug.m)
sync ${ARRAY[*]}

################################################################################
# ft_platform_supports.m

ARRAY=()
ARRAY+=(utilities/ft_platform_supports.m)
ARRAY+=(connectivity/private/ft_platform_supports.m)
ARRAY+=(fileio/private/ft_platform_supports.m)
ARRAY+=(forward/private/ft_platform_supports.m)
ARRAY+=(inverse/private/ft_platform_supports.m)
ARRAY+=(plotting/private/ft_platform_supports.m)
ARRAY+=(preproc/private/ft_platform_supports.m)
ARRAY+=(qsub/private/ft_platform_supports.m)
ARRAY+=(specest/private/ft_platform_supports.m)
sync ${ARRAY[*]}

################################################################################
# ft_preproc_bandpassfilter.m

ARRAY=()
ARRAY+=(preproc/ft_preproc_bandpassfilter.m)
ARRAY+=(specest/private/ft_preproc_bandpassfilter.m)
sync ${ARRAY[*]}

################################################################################
# ft_preproc_polyremoval.m

ARRAY=()
ARRAY+=(preproc/ft_preproc_polyremoval.m)
ARRAY+=(specest/private/ft_preproc_polyremoval.m)
sync ${ARRAY[*]}

################################################################################
# ft_progress.m

ARRAY=()
ARRAY+=(connectivity/private/ft_progress.m)
ARRAY+=(fileio/private/ft_progress.m)
ARRAY+=(inverse/private/ft_progress.m)
ARRAY+=(plotting/private/ft_progress.m)
ARRAY+=(utilities/ft_progress.m)
sync ${ARRAY[*]}

################################################################################
# ft_scalingfactor.m

ARRAY=()
ARRAY+=(fileio/private/ft_scalingfactor.m)
ARRAY+=(forward/private/ft_scalingfactor.m)
ARRAY+=(inverse/private/ft_scalingfactor.m)
ARRAY+=(plotting/private/ft_scalingfactor.m)
ARRAY+=(utilities/ft_scalingfactor.m)
sync ${ARRAY[*]}

################################################################################
# ft_senslabel.m

ARRAY=()
ARRAY+=(fileio/private/ft_senslabel.m)
ARRAY+=(forward/ft_senslabel.m)
ARRAY+=(inverse/private/ft_senslabel.m)
ARRAY+=(plotting/private/ft_senslabel.m)
sync ${ARRAY[*]}

################################################################################
# ft_senstype.m

ARRAY=()
ARRAY+=(fileio/private/ft_senstype.m)
ARRAY+=(forward/ft_senstype.m)
ARRAY+=(inverse/private/ft_senstype.m)
ARRAY+=(plotting/private/ft_senstype.m)
sync ${ARRAY[*]}

################################################################################
# ft_setopt.m

ARRAY=()
ARRAY+=(inverse/private/ft_setopt.m)
ARRAY+=(utilities/ft_setopt.m)
sync ${ARRAY[*]}

################################################################################
# ft_version.m

ARRAY=()
ARRAY+=(connectivity/private/ft_version.m)
ARRAY+=(fileio/private/ft_version.m)
ARRAY+=(forward/private/ft_version.m)
ARRAY+=(inverse/private/ft_version.m)
ARRAY+=(plotting/private/ft_version.m)
ARRAY+=(preproc/private/ft_version.m)
ARRAY+=(specest/private/ft_version.m)
ARRAY+=(utilities/ft_version.m)
sync ${ARRAY[*]}

################################################################################
# ft_warp_apply.m

ARRAY=()
ARRAY+=(fileio/private/ft_warp_apply.m)
ARRAY+=(forward/private/ft_warp_apply.m)
ARRAY+=(plotting/private/ft_warp_apply.m)
ARRAY+=(utilities/ft_warp_apply.m)
sync ${ARRAY[*]}

################################################################################
# getcustompath.m

ARRAY=()
ARRAY+=(qsub/private/getcustompath.m)
sync ${ARRAY[*]}

################################################################################
# getcustompwd.m

ARRAY=()
ARRAY+=(qsub/private/getcustompwd.m)
sync ${ARRAY[*]}

################################################################################
# getdatfield.m

ARRAY=()
ARRAY+=(fileio/private/getdatfield.m)
ARRAY+=(private/getdatfield.m)
ARRAY+=(test/private/getdatfield.m)
ARRAY+=(utilities/private/getdatfield.m)
ARRAY+=(plotting/private/getdatfield.m)
sync ${ARRAY[*]}

################################################################################
# getdimord.m

ARRAY=()
ARRAY+=(fileio/private/getdimord.m)
ARRAY+=(forward/private/getdimord.m)
ARRAY+=(private/getdimord.m)
ARRAY+=(test/private/getdimord.m)
ARRAY+=(utilities/private/getdimord.m)
ARRAY+=(contrib/spike/private/getdimord.m)
sync ${ARRAY[*]}

################################################################################
# getdimsiz.m

ARRAY=()
ARRAY+=(contrib/nutmegtrip/private/getdimsiz.m)
ARRAY+=(fileio/private/getdimsiz.m)
ARRAY+=(forward/private/getdimsiz.m)
ARRAY+=(private/getdimsiz.m)
ARRAY+=(test/private/getdimsiz.m)
ARRAY+=(utilities/private/getdimsiz.m)
ARRAY+=(contrib/spike/private/getdimsiz.m)
sync ${ARRAY[*]}

################################################################################
# getglobal.m

ARRAY=()
ARRAY+=(qsub/private/getglobal.m)
sync ${ARRAY[*]}

################################################################################
# gethostname.m

ARRAY=()
ARRAY+=(qsub/private/gethostname.m)
ARRAY+=(test/private/gethostname.m)
ARRAY+=(utilities/private/gethostname.m)
sync ${ARRAY[*]}

################################################################################
# getorthoviewpos.m

ARRAY=()
ARRAY+=(private/getorthoviewpos.m)
ARRAY+=(fileio/private/getorthoviewpos.m)
sync ${ARRAY[*]}

################################################################################
# getpid.m

ARRAY=()
ARRAY+=(qsub/private/getpid.m)
ARRAY+=(src/getpid.m)
sync ${ARRAY[*]}

################################################################################
# getpid.mexa64

ARRAY=()
ARRAY+=(qsub/private/getpid.mexa64)
ARRAY+=(src/getpid.mexa64)
sync ${ARRAY[*]}

################################################################################
# getpid.mexmaci

ARRAY=()
ARRAY+=(qsub/private/getpid.mexmaci)
ARRAY+=(src/getpid.mexmaci)
sync ${ARRAY[*]}

################################################################################
# getpid.mexmaci64

ARRAY=()
ARRAY+=(qsub/private/getpid.mexmaci64)
ARRAY+=(src/getpid.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# getsubfield.m

ARRAY=()
ARRAY+=(connectivity/private/getsubfield.m)
ARRAY+=(fileio/private/getsubfield.m)
ARRAY+=(forward/private/getsubfield.m)
ARRAY+=(inverse/private/getsubfield.m)
ARRAY+=(plotting/private/getsubfield.m)
ARRAY+=(private/getsubfield.m)
ARRAY+=(qsub/private/getsubfield.m)
ARRAY+=(specest/private/getsubfield.m)
ARRAY+=(statfun/private/getsubfield.m)
ARRAY+=(utilities/getsubfield.m)
sync ${ARRAY[*]}

################################################################################
# getusername.m

ARRAY=()
ARRAY+=(private/getusername.m)
ARRAY+=(qsub/private/getusername.m)
ARRAY+=(utilities/private/getusername.m)
sync ${ARRAY[*]}

################################################################################
# globalrescale.m

ARRAY=()
ARRAY+=(private/globalrescale.m)
ARRAY+=(utilities/private/globalrescale.m)
sync ${ARRAY[*]}

################################################################################
# hasyokogawa.m

ARRAY=()
ARRAY+=(fileio/private/hasyokogawa.m)
ARRAY+=(forward/private/hasyokogawa.m)
ARRAY+=(inverse/private/hasyokogawa.m)
ARRAY+=(utilities/hasyokogawa.m)
sync ${ARRAY[*]}

################################################################################
# headsurface.m

ARRAY=()
ARRAY+=(forward/private/headsurface.m)
ARRAY+=(inverse/private/headsurface.m)
ARRAY+=(plotting/private/headsurface.m)
ARRAY+=(private/headsurface.m)
sync ${ARRAY[*]}

################################################################################
# htmlcolors.m

ARRAY=()
ARRAY+=(private/htmlcolors.m)
ARRAY+=(plotting/private/htmlcolors.m)
sync ${ARRAY[*]}

################################################################################
# ignorefields.m

ARRAY=()
ARRAY+=(private/ignorefields.m)
ARRAY+=(utilities/private/ignorefields.m)
ARRAY+=(fileio/private/ignorefields.m)
ARRAY+=(contrib/misc/private/ignorefields.m)
sync ${ARRAY[*]}

################################################################################
# inside_contour.m

ARRAY=()
ARRAY+=(plotting/private/inside_contour.m)
ARRAY+=(private/inside_contour.m)
sync ${ARRAY[*]}

################################################################################
# intersect_line.m

ARRAY=()
ARRAY+=(plotting/private/intersect_line.m)
ARRAY+=(private/intersect_line.m)
sync ${ARRAY[*]}

################################################################################
# inv2x2.m

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.m)
ARRAY+=(src/inv2x2.m)
sync ${ARRAY[*]}

################################################################################
# inv2x2.mexa64

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.mexa64)
ARRAY+=(src/inv2x2.mexa64)
sync ${ARRAY[*]}

################################################################################
# inv2x2.mexglx

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.mexglx)
ARRAY+=(src/inv2x2.mexglx)
sync ${ARRAY[*]}

################################################################################
# inv2x2.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.mexmaci)
ARRAY+=(src/inv2x2.mexmaci)
sync ${ARRAY[*]}

################################################################################
# inv2x2.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.mexmaci64)
ARRAY+=(private/inv2x2.mexmaci64)
ARRAY+=(src/inv2x2.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# inv2x2.mexw32

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.mexw32)
ARRAY+=(private/inv2x2.mexw32)
ARRAY+=(src/inv2x2.mexw32)
sync ${ARRAY[*]}

################################################################################
# inv2x2.mexw64

ARRAY=()
ARRAY+=(connectivity/private/inv2x2.mexw64)
ARRAY+=(private/inv2x2.mexw64)
ARRAY+=(src/inv2x2.mexw64)
sync ${ARRAY[*]}

################################################################################
# inv3x3.m

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.m)
ARRAY+=(private/inv3x3.m)
ARRAY+=(src/inv3x3.m)
sync ${ARRAY[*]}

################################################################################
# inv3x3.mexglx

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.mexglx)
ARRAY+=(private/inv3x3.mexglx)
ARRAY+=(src/inv3x3.mexglx)
sync ${ARRAY[*]}

################################################################################
# inv3x3.mexa64

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.mexa64)
ARRAY+=(private/inv3x3.mexa64)
ARRAY+=(src/inv3x3.mexa64)
sync ${ARRAY[*]}

################################################################################
# inv3x3.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.mexmaci)
ARRAY+=(private/inv3x3.mexmaci)
ARRAY+=(src/inv3x3.mexmaci)
sync ${ARRAY[*]}

################################################################################
# inv3x3.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.mexmaci64)
ARRAY+=(private/inv3x3.mexmaci64)
ARRAY+=(src/inv3x3.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# inv3x3.mexw32

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.mexw32)
ARRAY+=(private/inv3x3.mexw32)
ARRAY+=(src/inv3x3.mexw32)
sync ${ARRAY[*]}

################################################################################
# inv3x3.mexw64

ARRAY=()
ARRAY+=(connectivity/private/inv3x3.mexw64)
ARRAY+=(private/inv3x3.mexw64)
ARRAY+=(src/inv3x3.mexw64)
sync ${ARRAY[*]}

################################################################################
# invfirwsord.m

ARRAY=()
ARRAY+=(preproc/private/invfirwsord.m)
ARRAY+=(specest/private/invfirwsord.m)
sync ${ARRAY[*]}

################################################################################
# isdir_or_mkdir.m

ARRAY=()
ARRAY+=(fileio/private/isdir_or_mkdir.m)
ARRAY+=(private/isdir_or_mkdir.m)
sync ${ARRAY[*]}

################################################################################
# isalmostequal.m

ARRAY=()
ARRAY+=(test/private/isalmostequal.m)
ARRAY+=(private/isalmostequal.m)
ARRAY+=(preproc/private/isalmostequal.m)
ARRAY+=(specest/private/isalmostequal.m)
sync ${ARRAY[*]}

################################################################################
# isfile.m

ARRAY=()
ARRAY+=(compat/matlablt2017b/isfile.m)
ARRAY+=(compat/octave/isfile.m)
sync ${ARRAY[*]}

################################################################################
# isfolder.m

ARRAY=()
ARRAY+=(compat/matlablt2017b/isfolder.m)
ARRAY+=(compat/octave/isfolder.m)
sync ${ARRAY[*]}

################################################################################
# ismatch.m

ARRAY=()
ARRAY+=(private/ismatch.m)
ARRAY+=(trialfun/private/ismatch.m)
sync ${ARRAY[*]}

################################################################################
# isrealmat.m

ARRAY=()
ARRAY+=(contrib/spike/private/isrealmat.m)
ARRAY+=(private/isrealmat.m)
sync ${ARRAY[*]}

################################################################################
# isrealvec.m

ARRAY=()
ARRAY+=(contrib/spike/private/isrealvec.m)
ARRAY+=(private/isrealvec.m)
sync ${ARRAY[*]}

################################################################################
# issubfield.m

ARRAY=()
ARRAY+=(connectivity/private/issubfield.m)
ARRAY+=(fileio/private/issubfield.m)
ARRAY+=(forward/private/issubfield.m)
ARRAY+=(inverse/private/issubfield.m)
ARRAY+=(plotting/private/issubfield.m)
ARRAY+=(private/issubfield.m)
ARRAY+=(qsub/private/issubfield.m)
ARRAY+=(specest/private/issubfield.m)
ARRAY+=(statfun/private/issubfield.m)
ARRAY+=(utilities/issubfield.m)
sync ${ARRAY[*]}

################################################################################
# istrue.m

ARRAY=()
ARRAY+=(connectivity/private/istrue.m)
ARRAY+=(fileio/private/istrue.m)
ARRAY+=(forward/private/istrue.m)
ARRAY+=(plotting/private/istrue.m)
ARRAY+=(preproc/private/istrue.m)
ARRAY+=(qsub/private/istrue.m)
ARRAY+=(specest/private/istrue.m)
ARRAY+=(statfun/private/istrue.m)
ARRAY+=(utilities/istrue.m)
sync ${ARRAY[*]}

################################################################################
# jaga16_packet.m

ARRAY=()
ARRAY+=(fileio/private/jaga16_packet.m)
ARRAY+=(realtime/example/private/jaga16_packet.m)
sync ${ARRAY[*]}

################################################################################
# kaiserbeta.m

ARRAY=()
ARRAY+=(preproc/private/kaiserbeta.m)
ARRAY+=(specest/private/kaiserbeta.m)
sync ${ARRAY[*]}

################################################################################
# keyval.m

ARRAY=()
ARRAY+=(connectivity/private/keyval.m)
ARRAY+=(fileio/private/keyval.m)
ARRAY+=(forward/private/keyval.m)
ARRAY+=(inverse/private/keyval.m)
ARRAY+=(plotting/private/keyval.m)
ARRAY+=(preproc/private/keyval.m)
ARRAY+=(specest/private/keyval.m)
ARRAY+=(utilities/keyval.m)
sync ${ARRAY[*]}

################################################################################
# keyvalcheck.m

ARRAY=()
ARRAY+=(plotting/private/keyvalcheck.m)
ARRAY+=(specest/private/keyvalcheck.m)
ARRAY+=(utilities/keyvalcheck.m)
sync ${ARRAY[*]}

################################################################################
# labelcmb2indx.m

ARRAY=()
ARRAY+=(fileio/private/labelcmb2indx.m)
ARRAY+=(private/labelcmb2indx.m)
ARRAY+=(utilities/private/labelcmb2indx.m)
sync ${ARRAY[*]}

################################################################################
# lmoutr.m

ARRAY=()
ARRAY+=(forward/private/lmoutr.m)
ARRAY+=(private/lmoutr.m)
ARRAY+=(utilities/private/lmoutr.m)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexa64

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexa64)
ARRAY+=(private/lmoutr.mexa64)
ARRAY+=(src/lmoutr.mexa64)
ARRAY+=(utilities/private/lmoutr.mexa64)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexglx

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexglx)
ARRAY+=(private/lmoutr.mexglx)
ARRAY+=(src/lmoutr.mexglx)
ARRAY+=(utilities/private/lmoutr.mexglx)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexmac

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexmac)
ARRAY+=(private/lmoutr.mexmac)
ARRAY+=(src/lmoutr.mexmac)
ARRAY+=(utilities/private/lmoutr.mexmac)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexmaca64

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexmaca64)
ARRAY+=(private/lmoutr.mexmaca64)
ARRAY+=(src/lmoutr.mexmaca64)
ARRAY+=(utilities/private/lmoutr.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexmaci

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexmaci)
ARRAY+=(private/lmoutr.mexmaci)
ARRAY+=(src/lmoutr.mexmaci)
ARRAY+=(utilities/private/lmoutr.mexmaci)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexmaci64

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexmaci64)
ARRAY+=(private/lmoutr.mexmaci64)
ARRAY+=(src/lmoutr.mexmaci64)
ARRAY+=(utilities/private/lmoutr.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexw32

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexw32)
ARRAY+=(private/lmoutr.mexw32)
ARRAY+=(src/lmoutr.mexw32)
ARRAY+=(utilities/private/lmoutr.mexw32)
sync ${ARRAY[*]}

################################################################################
# lmoutr.mexw64

ARRAY=()
ARRAY+=(forward/private/lmoutr.mexw64)
ARRAY+=(private/lmoutr.mexw64)
ARRAY+=(src/lmoutr.mexw64)
ARRAY+=(utilities/private/lmoutr.mexw64)
sync ${ARRAY[*]}

################################################################################
# lmoutrn.m

ARRAY=()
ARRAY+=(private/lmoutrn.m)
ARRAY+=(plotting/private/lmoutrn.m)
ARRAY+=(forward/private/lmoutrn.m)
ARRAY+=(utilities/private/lmoutrn.m)
sync ${ARRAY[*]}

################################################################################
# loadama.m

ARRAY=()
ARRAY+=(external/dipoli/loadama.m)
ARRAY+=(fileio/private/loadama.m)
ARRAY+=(forward/private/loadama.m)
sync ${ARRAY[*]}

################################################################################
# loadvar.m

ARRAY=()
ARRAY+=(fileio/private/loadvar.m)
ARRAY+=(private/loadvar.m)
ARRAY+=(test/private/loadvar.m)
ARRAY+=(utilities/private/loadvar.m)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexa64

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexa64)
ARRAY+=(private/ltrisect.mexa64)
ARRAY+=(src/ltrisect.mexa64)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexglx

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexglx)
ARRAY+=(private/ltrisect.mexglx)
ARRAY+=(src/ltrisect.mexglx)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexmac

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexmac)
ARRAY+=(private/ltrisect.mexmac)
ARRAY+=(src/ltrisect.mexmac)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexmaca64

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexmaca64)
ARRAY+=(private/ltrisect.mexmaca64)
ARRAY+=(src/ltrisect.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexmaci

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexmaci)
ARRAY+=(private/ltrisect.mexmaci)
ARRAY+=(src/ltrisect.mexmaci)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexmaci64

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexmaci64)
ARRAY+=(private/ltrisect.mexmaci64)
ARRAY+=(src/ltrisect.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexw32

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexw32)
ARRAY+=(private/ltrisect.mexw32)
ARRAY+=(src/ltrisect.mexw32)
sync ${ARRAY[*]}

################################################################################
# ltrisect.mexw64

ARRAY=()
ARRAY+=(plotting/private/ltrisect.mexw64)
ARRAY+=(private/ltrisect.mexw64)
ARRAY+=(src/ltrisect.mexw64)
sync ${ARRAY[*]}

################################################################################
# makessense.m

ARRAY=()
ARRAY+=(utilities/private/makessense.m)
ARRAY+=(fileio/private/makessense.m)
sync ${ARRAY[*]}

################################################################################
# match_str.m

ARRAY=()
ARRAY+=(fileio/private/match_str.m)
ARRAY+=(forward/private/match_str.m)
ARRAY+=(plotting/private/match_str.m)
ARRAY+=(utilities/match_str.m)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexa64

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexa64)
ARRAY+=(src/meg_leadfield1.mexa64)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexglx

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexglx)
ARRAY+=(src/meg_leadfield1.mexglx)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexmac

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexmac)
ARRAY+=(src/meg_leadfield1.mexmac)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexmaca64

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexmaca64)
ARRAY+=(src/meg_leadfield1.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexmaci

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexmaci)
ARRAY+=(src/meg_leadfield1.mexmaci)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexmaci64

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexmaci64)
ARRAY+=(src/meg_leadfield1.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexw32

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexw32)
ARRAY+=(src/meg_leadfield1.mexw32)
sync ${ARRAY[*]}

################################################################################
# meg_leadfield1.mexw64

ARRAY=()
ARRAY+=(forward/private/meg_leadfield1.mexw64)
ARRAY+=(src/meg_leadfield1.mexw64)
sync ${ARRAY[*]}

################################################################################
# memprofile.m

ARRAY=()
ARRAY+=(qsub/private/memprofile.m)
ARRAY+=(utilities/private/memprofile.m)
sync ${ARRAY[*]}

################################################################################
# memprofile.mexa64

ARRAY=()
ARRAY+=(qsub/private/memprofile.mexa64)
ARRAY+=(utilities/private/memprofile.mexa64)
sync ${ARRAY[*]}

################################################################################
# memprofile.mexglx

ARRAY=()
ARRAY+=(qsub/private/memprofile.mexglx)
ARRAY+=(utilities/private/memprofile.mexglx)
sync ${ARRAY[*]}

################################################################################
# memprofile.mexmaca64

ARRAY=()
ARRAY+=(qsub/private/memprofile.mexmaca64)
ARRAY+=(utilities/private/memprofile.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# memprofile.mexmaci

ARRAY=()
ARRAY+=(qsub/private/memprofile.mexmaci)
ARRAY+=(utilities/private/memprofile.mexmaci)
sync ${ARRAY[*]}

################################################################################
# memprofile.mexmaci64

ARRAY=()
ARRAY+=(qsub/private/memprofile.mexmaci64)
ARRAY+=(utilities/private/memprofile.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mergestruct.m

ARRAY=()
ARRAY+=(private/mergestruct.m)
ARRAY+=(test/private/mergestruct.m)
ARRAY+=(utilities/private/mergestruct.m)
sync ${ARRAY[*]}

################################################################################
# mesh2edge.m

ARRAY=()
ARRAY+=(private/mesh2edge.m)
ARRAY+=(forward/private/mesh2edge.m)
ARRAY+=(plotting/private/mesh2edge.m)
sync ${ARRAY[*]}

################################################################################
# mesh_icosahedron.m

ARRAY=()
ARRAY+=(external/openmeeg/mesh_icosahedron.m)
ARRAY+=(external/bemcp/mesh_icosahedron.m)
ARRAY+=(external/dipoli/mesh_icosahedron.m)
ARRAY+=(forward/private/mesh_icosahedron.m)
ARRAY+=(plotting/private/mesh_icosahedron.m)
ARRAY+=(private/mesh_icosahedron.m)
ARRAY+=(test/private/mesh_icosahedron.m)
ARRAY+=(utilities/private/mesh_icosahedron.m)
sync ${ARRAY[*]}

################################################################################
# mesh_octahedron.m

ARRAY=()
ARRAY+=(external/openmeeg/mesh_octahedron.m)
ARRAY+=(external/bemcp/mesh_octahedron.m)
ARRAY+=(external/dipoli/mesh_octahedron.m)
ARRAY+=(forward/private/mesh_octahedron.m)
ARRAY+=(plotting/private/mesh_octahedron.m)
ARRAY+=(private/mesh_octahedron.m)
ARRAY+=(test/private/mesh_octahedron.m)
ARRAY+=(utilities/private/mesh_octahedron.m)
sync ${ARRAY[*]}

################################################################################
# mesh_sphere.m

ARRAY=()
ARRAY+=(external/bemcp/mesh_sphere.m)
ARRAY+=(external/dipoli/mesh_sphere.m)
ARRAY+=(external/openmeeg/mesh_sphere.m)
ARRAY+=(forward/private/mesh_sphere.m)
ARRAY+=(plotting/private/mesh_sphere.m)
ARRAY+=(private/mesh_sphere.m)
ARRAY+=(test/private/mesh_sphere.m)
ARRAY+=(utilities/private/mesh_sphere.m)
sync ${ARRAY[*]}

################################################################################
# mesh_tetrahedron.m

ARRAY=()
ARRAY+=(external/openmeeg/mesh_tetrahedron.m)
ARRAY+=(external/bemcp/mesh_tetrahedron.m)
ARRAY+=(external/dipoli/mesh_tetrahedron.m)
ARRAY+=(forward/private/mesh_tetrahedron.m)
ARRAY+=(plotting/private/mesh_tetrahedron.m)
ARRAY+=(private/mesh_tetrahedron.m)
ARRAY+=(test/private/mesh_tetrahedron.m)
ARRAY+=(utilities/private/mesh_tetrahedron.m)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.m

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.m)
ARRAY+=(private/mtimes2x2.m)
ARRAY+=(src/mtimes2x2.m)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexa64

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexa64)
ARRAY+=(private/mtimes2x2.mexa64)
ARRAY+=(src/mtimes2x2.mexa64)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexglx

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexglx)
ARRAY+=(private/mtimes2x2.mexglx)
ARRAY+=(src/mtimes2x2.mexglx)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexmaca64

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexglx)
ARRAY+=(private/mtimes2x2.mexglx)
ARRAY+=(src/mtimes2x2.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexmaci)
ARRAY+=(private/mtimes2x2.mexmaci)
ARRAY+=(src/mtimes2x2.mexmaci)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexmaci64)
ARRAY+=(private/mtimes2x2.mexmaci64)
ARRAY+=(src/mtimes2x2.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexw32

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexw32)
ARRAY+=(private/mtimes2x2.mexw32)
ARRAY+=(src/mtimes2x2.mexw32)
sync ${ARRAY[*]}

################################################################################
# mtimes2x2.mexw64

ARRAY=()
ARRAY+=(connectivity/private/mtimes2x2.mexw64)
ARRAY+=(private/mtimes2x2.mexw64)
ARRAY+=(src/mtimes2x2.mexw64)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.m

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.m)
ARRAY+=(private/mtimes3x3.m)
ARRAY+=(src/mtimes3x3.m)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.mexa64

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.mexa64)
ARRAY+=(private/mtimes3x3.mexa64)
ARRAY+=(src/mtimes3x3.mexa64)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.mexglx

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.mexglx)
ARRAY+=(private/mtimes3x3.mexglx)
ARRAY+=(src/mtimes3x3.mexglx)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.mexmaci)
ARRAY+=(private/mtimes3x3.mexmaci)
ARRAY+=(src/mtimes3x3.mexmaci)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.mexmaci64)
ARRAY+=(private/mtimes3x3.mexmaci64)
ARRAY+=(src/mtimes3x3.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.mexw32

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.mexw32)
ARRAY+=(private/mtimes3x3.mexw32)
ARRAY+=(src/mtimes3x3.mexw32)
sync ${ARRAY[*]}

################################################################################
# mtimes3x3.mexw64

ARRAY=()
ARRAY+=(connectivity/private/mtimes3x3.mexw64)
ARRAY+=(private/mtimes3x3.mexw64)
ARRAY+=(src/mtimes3x3.mexw64)
sync ${ARRAY[*]}

################################################################################
# multivariate_decomp.m

ARRAY=()
ARRAY+=(connectivity/private/multivariate_decomp.m)
ARRAY+=(private/multivariate_decomp.m)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize.m

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize.m)
ARRAY+=(private/mxDeserialize.m)
ARRAY+=(src/mxDeserialize.m)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexa64

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexa64)
ARRAY+=(private/mxDeserialize_c.mexa64)
ARRAY+=(src/mxDeserialize_c.mexa64)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexglx

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexglx)
ARRAY+=(private/mxDeserialize_c.mexglx)
ARRAY+=(src/mxDeserialize_c.mexglx)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexmac

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexmac)
ARRAY+=(private/mxDeserialize_c.mexmac)
ARRAY+=(src/mxDeserialize_c.mexmac)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexmaca64

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexmaca64)
ARRAY+=(private/mxDeserialize_c.mexmaca64)
ARRAY+=(src/mxDeserialize_c.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexmaci

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexmaci)
ARRAY+=(private/mxDeserialize_c.mexmaci)
ARRAY+=(src/mxDeserialize_c.mexmaci)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexmaci64)
ARRAY+=(private/mxDeserialize_c.mexmaci64)
ARRAY+=(src/mxDeserialize_c.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexw32

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexw32)
ARRAY+=(private/mxDeserialize_c.mexw32)
ARRAY+=(src/mxDeserialize_c.mexw32)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_c.mexw64

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_c.mexw64)
ARRAY+=(private/mxDeserialize_c.mexw64)
ARRAY+=(src/mxDeserialize_c.mexw64)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_cpp.mexa64

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_cpp.mexa64)
ARRAY+=(private/mxDeserialize_cpp.mexa64)
ARRAY+=(src/mxDeserialize_cpp.mexa64)
ARRAY+=(utilities/private/mxDeserialize_cpp.mexa64)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_cpp.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_cpp.mexmaci64)
ARRAY+=(private/mxDeserialize_cpp.mexmaci64)
ARRAY+=(src/mxDeserialize_cpp.mexmaci64)
ARRAY+=(utilities/private/mxDeserialize_cpp.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mxDeserialize_cpp.mexw32

ARRAY=()
ARRAY+=(fileio/private/mxDeserialize_cpp.mexw32)
ARRAY+=(private/mxDeserialize_cpp.mexw32)
ARRAY+=(src/mxDeserialize_cpp.mexw32)
ARRAY+=(utilities/private/mxDeserialize_cpp.mexw32)
sync ${ARRAY[*]}

################################################################################
# mxSerialize.m

ARRAY=()
ARRAY+=(fileio/private/mxSerialize.m)
ARRAY+=(private/mxSerialize.m)
ARRAY+=(src/mxSerialize.m)
ARRAY+=(utilities/private/mxSerialize.m)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexa64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexa64)
ARRAY+=(private/mxSerialize_c.mexa64)
ARRAY+=(src/mxSerialize_c.mexa64)
ARRAY+=(utilities/private/mxSerialize_c.mexa64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexglx

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexglx)
ARRAY+=(private/mxSerialize_c.mexglx)
ARRAY+=(src/mxSerialize_c.mexglx)
ARRAY+=(utilities/private/mxSerialize_c.mexglx)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexmac

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexmac)
ARRAY+=(private/mxSerialize_c.mexmac)
ARRAY+=(src/mxSerialize_c.mexmac)
ARRAY+=(utilities/private/mxSerialize_c.mexmac)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexmaca64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexmaca64)
ARRAY+=(private/mxSerialize_c.mexmaca64)
ARRAY+=(src/mxSerialize_c.mexmaca64)
ARRAY+=(utilities/private/mxSerialize_c.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexmaci

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexmaci)
ARRAY+=(private/mxSerialize_c.mexmaci)
ARRAY+=(src/mxSerialize_c.mexmaci)
ARRAY+=(utilities/private/mxSerialize_c.mexmaci)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexmaci64)
ARRAY+=(private/mxSerialize_c.mexmaci64)
ARRAY+=(src/mxSerialize_c.mexmaci64)
ARRAY+=(utilities/private/mxSerialize_c.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexw32

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexw32)
ARRAY+=(private/mxSerialize_c.mexw32)
ARRAY+=(src/mxSerialize_c.mexw32)
ARRAY+=(utilities/private/mxSerialize_c.mexw32)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_c.mexw64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_c.mexw64)
ARRAY+=(private/mxSerialize_c.mexw64)
ARRAY+=(src/mxSerialize_c.mexw64)
ARRAY+=(utilities/private/mxSerialize_c.mexw64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_cpp.mexa64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_cpp.mexa64)
ARRAY+=(private/mxSerialize_cpp.mexa64)
ARRAY+=(src/mxSerialize_cpp.mexa64)
ARRAY+=(utilities/private/mxSerialize_cpp.mexa64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_cpp.mexmaca64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_cpp.mexmaca64)
ARRAY+=(private/mxSerialize_cpp.mexmaca64)
ARRAY+=(src/mxSerialize_cpp.mexmaca64)
ARRAY+=(utilities/private/mxSerialize_cpp.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_cpp.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_cpp.mexmaci64)
ARRAY+=(private/mxSerialize_cpp.mexmaci64)
ARRAY+=(src/mxSerialize_cpp.mexmaci64)
ARRAY+=(utilities/private/mxSerialize_cpp.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_cpp.mexw32

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_cpp.mexw32)
ARRAY+=(private/mxSerialize_cpp.mexw32)
ARRAY+=(src/mxSerialize_cpp.mexw32)
ARRAY+=(utilities/private/mxSerialize_cpp.mexw32)
sync ${ARRAY[*]}

################################################################################
# mxSerialize_cpp.mexw64

ARRAY=()
ARRAY+=(fileio/private/mxSerialize_cpp.mexw64)
ARRAY+=(private/mxSerialize_cpp.mexw64)
ARRAY+=(src/mxSerialize_cpp.mexw64)
ARRAY+=(utilities/private/mxSerialize_cpp.mexw64)
sync ${ARRAY[*]}

################################################################################
# nanmean.m

ARRAY=()
ARRAY+=(external/stats/nanmean.m)
ARRAY+=(src/nanmean.m)
sync ${ARRAY[*]}

################################################################################
# nanmean.mexa64

ARRAY=()
ARRAY+=(external/stats/nanmean.mexa64)
ARRAY+=(src/nanmean.mexa64)
sync ${ARRAY[*]}

################################################################################
# nanmean.mexmaca64

ARRAY=()
ARRAY+=(external/stats/nanmean.mexmaca64)
ARRAY+=(src/nanmean.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# nanmean.mexmaci

ARRAY=()
ARRAY+=(external/stats/nanmean.mexmaci)
ARRAY+=(src/nanmean.mexmaci)
sync ${ARRAY[*]}

################################################################################
# nanmean.mexmaci64

ARRAY=()
ARRAY+=(external/stats/nanmean.mexmaci64)
ARRAY+=(src/nanmean.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# nanmean.mexw32

ARRAY=()
ARRAY+=(external/stats/nanmean.mexw32)
ARRAY+=(src/nanmean.mexw32)
sync ${ARRAY[*]}

################################################################################
# nanmean.mexw64

ARRAY=()
ARRAY+=(external/stats/nanmean.mexw64)
ARRAY+=(src/nanmean.mexw64)
sync ${ARRAY[*]}

################################################################################
# nanstd.m

ARRAY=()
ARRAY+=(external/stats/nanstd.m)
ARRAY+=(src/nanstd.m)
sync ${ARRAY[*]}

################################################################################
# nanstd.mexa64

ARRAY=()
ARRAY+=(external/stats/nanstd.mexa64)
ARRAY+=(src/nanstd.mexa64)
sync ${ARRAY[*]}

################################################################################
# nanstd.mexmaca64

ARRAY=()
ARRAY+=(external/stats/nanstd.mexmaca64)
ARRAY+=(src/nanstd.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# nanstd.mexmaci

ARRAY=()
ARRAY+=(external/stats/nanstd.mexmaci)
ARRAY+=(src/nanstd.mexmaci)
sync ${ARRAY[*]}

################################################################################
# nanstd.mexmaci64

ARRAY=()
ARRAY+=(external/stats/nanstd.mexmaci64)
ARRAY+=(src/nanstd.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# nanstd.mexw32

ARRAY=()
ARRAY+=(external/stats/nanstd.mexw32)
ARRAY+=(src/nanstd.mexw32)
sync ${ARRAY[*]}

################################################################################
# nanstd.mexw64

ARRAY=()
ARRAY+=(external/stats/nanstd.mexw64)
ARRAY+=(src/nanstd.mexw64)
sync ${ARRAY[*]}

################################################################################
# nansum.m

ARRAY=()
ARRAY+=(external/stats/nansum.m)
ARRAY+=(src/nansum.m)
sync ${ARRAY[*]}

################################################################################
# nansum.mexa64

ARRAY=()
ARRAY+=(external/stats/nansum.mexa64)
ARRAY+=(src/nansum.mexa64)
sync ${ARRAY[*]}

################################################################################
# nansum.mexmaci

ARRAY=()
ARRAY+=(external/stats/nansum.mexmaci)
ARRAY+=(src/nansum.mexmaci)
sync ${ARRAY[*]}

################################################################################
# nansum.mexmaca64

ARRAY=()
ARRAY+=(external/stats/nansum.mexmaca64)
ARRAY+=(src/nansum.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# nansum.mexmaci64

ARRAY=()
ARRAY+=(external/stats/nansum.mexmaci64)
ARRAY+=(src/nansum.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# nansum.mexw32

ARRAY=()
ARRAY+=(external/stats/nansum.mexw32)
ARRAY+=(src/nansum.mexw32)
sync ${ARRAY[*]}

################################################################################
# nansum.mexw64

ARRAY=()
ARRAY+=(external/stats/nansum.mexw64)
ARRAY+=(src/nansum.mexw64)
sync ${ARRAY[*]}

################################################################################
# nanvar.m

ARRAY=()
ARRAY+=(external/stats/nanvar.m)
ARRAY+=(src/nanvar.m)
sync ${ARRAY[*]}

################################################################################
# nanvar.mexa64

ARRAY=()
ARRAY+=(external/stats/nanvar.mexa64)
ARRAY+=(src/nanvar.mexa64)
sync ${ARRAY[*]}

################################################################################
# nanvar.mexmaca64

ARRAY=()
ARRAY+=(external/stats/nanvar.mexmaca64)
ARRAY+=(src/nanvar.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# nanvar.mexmaci

ARRAY=()
ARRAY+=(external/stats/nanvar.mexmaci)
ARRAY+=(src/nanvar.mexmaci)
sync ${ARRAY[*]}

################################################################################
# nanvar.mexmaci64

ARRAY=()
ARRAY+=(external/stats/nanvar.mexmaci64)
ARRAY+=(src/nanvar.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# nanvar.mexw32

ARRAY=()
ARRAY+=(external/stats/nanvar.mexw32)
ARRAY+=(src/nanvar.mexw32)
sync ${ARRAY[*]}

################################################################################
# nanvar.mexw64

ARRAY=()
ARRAY+=(external/stats/nanvar.mexw64)
ARRAY+=(src/nanvar.mexw64)
sync ${ARRAY[*]}

################################################################################
# ndgrid.m

ARRAY=()
ARRAY+=(fileio/private/ndgrid.m)
ARRAY+=(plotting/private/ndgrid.m)
ARRAY+=(private/ndgrid.m)
sync ${ARRAY[*]}

################################################################################
# nearest.m

ARRAY=()
ARRAY+=(utilities/nearest.m)
ARRAY+=(preproc/private/nearest.m)
sync ${ARRAY[*]}

################################################################################
# neuralynx_crc.m

ARRAY=()
ARRAY+=(contrib/spike/private/neuralynx_crc.m)
ARRAY+=(fileio/private/neuralynx_crc.m)
sync ${ARRAY[*]}

################################################################################
# neuralynx_getheader.m

ARRAY=()
ARRAY+=(contrib/spike/private/neuralynx_getheader.m)
ARRAY+=(fileio/private/neuralynx_getheader.m)
sync ${ARRAY[*]}

################################################################################
# offset2time.m

ARRAY=()
ARRAY+=(contrib/spike/private/offset2time.m)
ARRAY+=(private/offset2time.m)
ARRAY+=(utilities/private/offset2time.m)
sync ${ARRAY[*]}

################################################################################
# open_figure.m

ARRAY=()
ARRAY+=(private/open_figure.m)
ARRAY+=(realtime/online_meg/private/open_figure.m)
sync ${ARRAY[*]}

################################################################################
# parameterselection.m

ARRAY=()
ARRAY+=(contrib/nutmegtrip/private/parameterselection.m)
ARRAY+=(fileio/private/parameterselection.m)
ARRAY+=(private/parameterselection.m)
ARRAY+=(utilities/private/parameterselection.m)
sync ${ARRAY[*]}

################################################################################
# parsekeyboardevent.m

ARRAY=()
ARRAY+=(private/parsekeyboardevent.m)
ARRAY+=(realtime/online_meg/private/parsekeyboardevent.m)
sync ${ARRAY[*]}

################################################################################
# peakdetect3.m

ARRAY=()
ARRAY+=(contrib/spike/private/peakdetect3.m)
ARRAY+=(private/peakdetect3.m)
sync ${ARRAY[*]}

################################################################################
# pinvNx2.m

ARRAY=()
ARRAY+=(private/pinvNx2.m)
ARRAY+=(plotting/private/pinvNx2.m)
ARRAY+=(forward/private/pinvNx2.m)
ARRAY+=(utilities/private/pinvNx2.m)
sync ${ARRAY[*]}

################################################################################
# platform.h

ARRAY=()
ARRAY+=(realtime/src/buffer/src/platform.h)
ARRAY+=(src/platform.h)
sync ${ARRAY[*]}

################################################################################
# plgndr.m

ARRAY=()
ARRAY+=(forward/private/plgndr.m)
ARRAY+=(private/plgndr.m)
ARRAY+=(src/plgndr.m)
sync ${ARRAY[*]}

################################################################################
# plgndr.c

ARRAY=()
ARRAY+=(forward/private/plgndr.c)
ARRAY+=(private/plgndr.c)
ARRAY+=(src/plgndr.c)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexa64

ARRAY=()
ARRAY+=(forward/private/plgndr.mexa64)
ARRAY+=(private/plgndr.mexa64)
ARRAY+=(src/plgndr.mexa64)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexglx

ARRAY=()
ARRAY+=(forward/private/plgndr.mexglx)
ARRAY+=(private/plgndr.mexglx)
ARRAY+=(src/plgndr.mexglx)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexmac

ARRAY=()
ARRAY+=(forward/private/plgndr.mexmac)
ARRAY+=(private/plgndr.mexmac)
ARRAY+=(src/plgndr.mexmac)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexmaca64

ARRAY=()
ARRAY+=(forward/private/plgndr.mexmaca64)
ARRAY+=(private/plgndr.mexmaca64)
ARRAY+=(src/plgndr.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexmaci

ARRAY=()
ARRAY+=(forward/private/plgndr.mexmaci)
ARRAY+=(private/plgndr.mexmaci)
ARRAY+=(src/plgndr.mexmaci)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexmaci64

ARRAY=()
ARRAY+=(forward/private/plgndr.mexmaci64)
ARRAY+=(private/plgndr.mexmaci64)
ARRAY+=(src/plgndr.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexw32

ARRAY=()
ARRAY+=(forward/private/plgndr.mexw32)
ARRAY+=(private/plgndr.mexw32)
ARRAY+=(src/plgndr.mexw32)
sync ${ARRAY[*]}

################################################################################
# plgndr.mexw64

ARRAY=()
ARRAY+=(forward/private/plgndr.mexw64)
ARRAY+=(private/plgndr.mexw64)
ARRAY+=(src/plgndr.mexw64)
sync ${ARRAY[*]}

################################################################################
# plinprojn.m

ARRAY=()
ARRAY+=(forward/private/plinprojn.m)
ARRAY+=(private/plinprojn.m)
ARRAY+=(utilities/private/plinprojn.m)
sync ${ARRAY[*]}

################################################################################
# pos2dim.m

ARRAY=()
ARRAY+=(fileio/private/pos2dim.m)
ARRAY+=(private/pos2dim.m)
ARRAY+=(utilities/private/pos2dim.m)
sync ${ARRAY[*]}

################################################################################
# pos2dim3d.m

ARRAY=()
ARRAY+=(fileio/private/pos2dim3d.m)
ARRAY+=(private/pos2dim3d.m)
sync ${ARRAY[*]}

################################################################################
# pos2transform.m

ARRAY=()
ARRAY+=(fileio/private/pos2transform.m)
ARRAY+=(private/pos2transform.m)
ARRAY+=(utilities/private/pos2transform.m)
sync ${ARRAY[*]}

################################################################################
# preproc.m

ARRAY=()
ARRAY+=(contrib/spike/private/preproc.m)
ARRAY+=(private/preproc.m)
sync ${ARRAY[*]}

################################################################################
# printor.m

ARRAY=()
ARRAY+=(utilities/private/printor.m)
ARRAY+=(fileio/private/printor.m)
sync ${ARRAY[*]}

################################################################################
# print_mem.m

ARRAY=()
ARRAY+=(qsub/private/print_mem.m)
sync ${ARRAY[*]}

################################################################################
# print_tim.m

ARRAY=()
ARRAY+=(private/print_tim.m)
ARRAY+=(qsub/private/print_tim.m)
sync ${ARRAY[*]}

################################################################################
# project_elec.m

ARRAY=()
ARRAY+=(forward/private/project_elec.m)
ARRAY+=(private/project_elec.m)
ARRAY+=(utilities/private/project_elec.m)
sync ${ARRAY[*]}

################################################################################
# projecttri.m

ARRAY=()
ARRAY+=(forward/private/projecttri.m)
ARRAY+=(plotting/private/projecttri.m)
ARRAY+=(private/projecttri.m)
sync ${ARRAY[*]}

################################################################################
# pthreadGC2-w64.dll

ARRAY=()
ARRAY+=(realtime/src/external/pthreads-win64/lib/pthreadGC2-w64.dll)
sync ${ARRAY[*]}

################################################################################
# pthreadGC2.dll

ARRAY=()
ARRAY+=(fileio/private/pthreadGC2.dll)
ARRAY+=(realtime/bin/win32/pthreadGC2.dll)
ARRAY+=(realtime/src/external/pthreads-win32/lib/pthreadGC2.dll)
sync ${ARRAY[*]}

################################################################################
# ptriproj.m

ARRAY=()
ARRAY+=(forward/private/ptriproj.m)
ARRAY+=(private/ptriproj.m)
ARRAY+=(utilities/private/ptriproj.m)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexa64

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexa64)
ARRAY+=(private/ptriproj.mexa64)
ARRAY+=(src/ptriproj.mexa64)
ARRAY+=(utilities/private/ptriproj.mexa64)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexglx

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexglx)
ARRAY+=(private/ptriproj.mexglx)
ARRAY+=(src/ptriproj.mexglx)
ARRAY+=(utilities/private/ptriproj.mexglx)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexmac

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexmac)
ARRAY+=(private/ptriproj.mexmac)
ARRAY+=(src/ptriproj.mexmac)
ARRAY+=(utilities/private/ptriproj.mexmac)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexmaca64

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexmaca64)
ARRAY+=(private/ptriproj.mexmaca64)
ARRAY+=(src/ptriproj.mexmaca64)
ARRAY+=(utilities/private/ptriproj.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexmaci

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexmaci)
ARRAY+=(private/ptriproj.mexmaci)
ARRAY+=(src/ptriproj.mexmaci)
ARRAY+=(utilities/private/ptriproj.mexmaci)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexmaci64

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexmaci64)
ARRAY+=(private/ptriproj.mexmaci64)
ARRAY+=(src/ptriproj.mexmaci64)
ARRAY+=(utilities/private/ptriproj.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexw32

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexw32)
ARRAY+=(private/ptriproj.mexw32)
ARRAY+=(src/ptriproj.mexw32)
ARRAY+=(utilities/private/ptriproj.mexw32)
sync ${ARRAY[*]}

################################################################################
# ptriproj.mexw64

ARRAY=()
ARRAY+=(forward/private/ptriproj.mexw64)
ARRAY+=(private/ptriproj.mexw64)
ARRAY+=(src/ptriproj.mexw64)
ARRAY+=(utilities/private/ptriproj.mexw64)
sync ${ARRAY[*]}

################################################################################
# ptriprojn.m

ARRAY=()
ARRAY+=(forward/private/ptriprojn.m)
ARRAY+=(private/ptriprojn.m)
ARRAY+=(utilities/private/ptriprojn.m)
sync ${ARRAY[*]}

################################################################################
# ptriside.m

ARRAY=()
ARRAY+=(plotting/private/ptriside.m)
ARRAY+=(private/ptriside.m)
sync ${ARRAY[*]}

################################################################################
# quaternion.m

ARRAY=()
ARRAY+=(fileio/private/quaternion.m)
ARRAY+=(inverse/private/quaternion.m)
ARRAY+=(plotting/private/quaternion.m)
ARRAY+=(private/quaternion.m)
ARRAY+=(utilities/private/quaternion.m)
sync ${ARRAY[*]}

################################################################################
# randomseed.m

ARRAY=()
ARRAY+=(test/private/randomseed.m)
ARRAY+=(utilities/private/randomseed.m)
sync ${ARRAY[*]}

################################################################################
# read_16bit.mexa64

ARRAY=()
ARRAY+=(fileio/private/read_16bit.mexa64)
ARRAY+=(src/read_16bit.mexa64)
sync ${ARRAY[*]}

################################################################################
# read_16bit.mexglx

ARRAY=()
ARRAY+=(fileio/private/read_16bit.mexglx)
ARRAY+=(src/read_16bit.mexglx)
sync ${ARRAY[*]}

################################################################################
# read_16bit.mexmaci

ARRAY=()
ARRAY+=(fileio/private/read_16bit.mexmaci)
ARRAY+=(src/read_16bit.mexmaci)
sync ${ARRAY[*]}

################################################################################
# read_16bit.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/read_16bit.mexmaci64)
ARRAY+=(src/read_16bit.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# read_16bit.mexw32

ARRAY=()
ARRAY+=(fileio/private/read_16bit.mexw32)
ARRAY+=(src/read_16bit.mexw32)
sync ${ARRAY[*]}

################################################################################
# read_16bit.mexw64

ARRAY=()
ARRAY+=(fileio/private/read_16bit.mexw64)
ARRAY+=(src/read_16bit.mexw64)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexa64

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexa64)
ARRAY+=(src/read_24bit.mexa64)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexglx

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexglx)
ARRAY+=(src/read_24bit.mexglx)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexmac

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexmac)
ARRAY+=(src/read_24bit.mexmac)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexmaca64

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexmaca64)
ARRAY+=(src/read_24bit.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexmaci

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexmaci)
ARRAY+=(src/read_24bit.mexmaci)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexmaci64)
ARRAY+=(src/read_24bit.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexw32

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexw32)
ARRAY+=(src/read_24bit.mexw32)
sync ${ARRAY[*]}

################################################################################
# read_24bit.mexw64

ARRAY=()
ARRAY+=(fileio/private/read_24bit.mexw64)
ARRAY+=(src/read_24bit.mexw64)
sync ${ARRAY[*]}

################################################################################
# read_besa_avr.m

ARRAY=()
ARRAY+=(fileio/private/read_besa_avr.m)
ARRAY+=(private/read_besa_avr.m)
sync ${ARRAY[*]}

################################################################################
# read_besa_swf.m

ARRAY=()
ARRAY+=(fileio/private/read_besa_swf.m)
ARRAY+=(private/read_besa_swf.m)
sync ${ARRAY[*]}

################################################################################
# read_ctf_hc.m

ARRAY=()
ARRAY+=(fileio/private/read_ctf_hc.m)
ARRAY+=(private/read_ctf_hc.m)
sync ${ARRAY[*]}

################################################################################
# read_ctf_hist.m

ARRAY=()
ARRAY+=(fileio/private/read_ctf_hist.m)
ARRAY+=(private/read_ctf_hist.m)
sync ${ARRAY[*]}

################################################################################
# read_ctf_shm.mexglx

ARRAY=()
ARRAY+=(fileio/private/read_ctf_shm.mexglx)
ARRAY+=(src/read_ctf_shm.mexglx)
sync ${ARRAY[*]}

################################################################################
# read_neuralynx_dma.m

ARRAY=()
ARRAY+=(contrib/spike/private/read_neuralynx_dma.m)
ARRAY+=(fileio/private/read_neuralynx_dma.m)
sync ${ARRAY[*]}

################################################################################
# refine.m

ARRAY=()
ARRAY+=(external/bemcp/refine.m)
ARRAY+=(external/dipoli/private/refine.m)
ARRAY+=(external/openmeeg/private/refine.m)
ARRAY+=(forward/private/refine.m)
ARRAY+=(plotting/private/refine.m)
ARRAY+=(fileio/private/refine.m)
ARRAY+=(private/refine.m)
ARRAY+=(test/private/refine.m)
ARRAY+=(utilities/private/refine.m)
sync ${ARRAY[*]}

################################################################################
# remove_vertices.m

ARRAY=()
ARRAY+=(private/remove_vertices.m)
ARRAY+=(fileio/private/remove_vertices.m)
ARRAY+=(forward/private/remove_vertices.m)
ARRAY+=(plotting/private/remove_vertices.m)
sync ${ARRAY[*]}

################################################################################
# remove_double_vertices.m

ARRAY=()
ARRAY+=(private/remove_double_vertices.m)
ARRAY+=(forward/private/remove_double_vertices.m)
ARRAY+=(fileio/private/remove_double_vertices.m)
sync ${ARRAY[*]}

################################################################################
# remove_unused_vertices.m

ARRAY=()
ARRAY+=(private/remove_unused_vertices.m)
ARRAY+=(forward/private/remove_unused_vertices.m)
ARRAY+=(fileio/private/remove_unused_vertices.m)
sync ${ARRAY[*]}

################################################################################
# rename.mexa64

ARRAY=()
ARRAY+=(qsub/private/rename.mexa64)
ARRAY+=(src/rename.mexa64)
sync ${ARRAY[*]}

################################################################################
# rename.mexmaca64

ARRAY=()
ARRAY+=(qsub/private/rename.mexmaca64)
ARRAY+=(src/rename.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# rename.mexmaci

ARRAY=()
ARRAY+=(qsub/private/rename.mexmaci)
ARRAY+=(src/rename.mexmaci)
sync ${ARRAY[*]}

################################################################################
# rename.mexmaci64

ARRAY=()
ARRAY+=(qsub/private/rename.mexmaci64)
ARRAY+=(src/rename.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# retriangulate.m

ARRAY=()
ARRAY+=(forward/private/retriangulate.m)
ARRAY+=(private/retriangulate.m)
sync ${ARRAY[*]}

################################################################################
# rfbevent.mexa64

ARRAY=()
ARRAY+=(fileio/private/rfbevent.mexa64)
ARRAY+=(src/rfbevent.mexa64)
sync ${ARRAY[*]}

################################################################################
# rfbevent.mexglx

ARRAY=()
ARRAY+=(fileio/private/rfbevent.mexglx)
ARRAY+=(src/rfbevent.mexglx)
sync ${ARRAY[*]}

################################################################################
# rfbevent.mexmac

ARRAY=()
ARRAY+=(fileio/private/rfbevent.mexmac)
ARRAY+=(src/rfbevent.mexmac)
sync ${ARRAY[*]}

################################################################################
# rfbevent.mexmaca64

ARRAY=()
ARRAY+=(fileio/private/rfbevent.mexmaca64)
ARRAY+=(src/rfbevent.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# rfbevent.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/rfbevent.mexmaci64)
ARRAY+=(src/rfbevent.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# rigidbody.m

ARRAY=()
ARRAY+=(inverse/private/rigidbody.m)
ARRAY+=(private/rigidbody.m)
ARRAY+=(utilities/private/rigidbody.m)
sync ${ARRAY[*]}

################################################################################
# rmsubfield.m

ARRAY=()
ARRAY+=(connectivity/private/rmsubfield.m)
ARRAY+=(fileio/private/rmsubfield.m)
ARRAY+=(forward/private/rmsubfield.m)
ARRAY+=(plotting/private/rmsubfield.m)
ARRAY+=(private/rmsubfield.m)
ARRAY+=(qsub/private/rmsubfield.m)
ARRAY+=(specest/private/rmsubfield.m)
ARRAY+=(statfun/private/rmsubfield.m)
ARRAY+=(test/private/rmsubfield.m)
ARRAY+=(utilities/rmsubfield.m)
sync ${ARRAY[*]}

################################################################################
# rollback_provenance.m

ARRAY=()
ARRAY+=(private/rollback_provenance.m)
ARRAY+=(contrib/misc/private/rollback_provenance.m)
sync ${ARRAY[*]}

################################################################################
# rotate.m

ARRAY=()
ARRAY+=(fileio/private/rotate.m)
ARRAY+=(inverse/private/rotate.m)
ARRAY+=(plotting/private/rotate.m)
ARRAY+=(private/rotate.m)
ARRAY+=(utilities/private/rotate.m)
sync ${ARRAY[*]}

################################################################################
# routlm.mexa64

ARRAY=()
ARRAY+=(forward/private/routlm.mexa64)
ARRAY+=(private/routlm.mexa64)
ARRAY+=(src/routlm.mexa64)
sync ${ARRAY[*]}

################################################################################
# routlm.mexglx

ARRAY=()
ARRAY+=(forward/private/routlm.mexglx)
ARRAY+=(private/routlm.mexglx)
ARRAY+=(src/routlm.mexglx)
sync ${ARRAY[*]}

################################################################################
# routlm.mexmac

ARRAY=()
ARRAY+=(forward/private/routlm.mexmac)
ARRAY+=(private/routlm.mexmac)
ARRAY+=(src/routlm.mexmac)
sync ${ARRAY[*]}

################################################################################
# routlm.mexmaca64

ARRAY=()
ARRAY+=(forward/private/routlm.mexmaca64)
ARRAY+=(private/routlm.mexmaca64)
ARRAY+=(src/routlm.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# routlm.mexmaci

ARRAY=()
ARRAY+=(forward/private/routlm.mexmaci)
ARRAY+=(private/routlm.mexmaci)
ARRAY+=(src/routlm.mexmaci)
sync ${ARRAY[*]}

################################################################################
# routlm.mexmaci64

ARRAY=()
ARRAY+=(forward/private/routlm.mexmaci64)
ARRAY+=(private/routlm.mexmaci64)
ARRAY+=(src/routlm.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# routlm.mexw32

ARRAY=()
ARRAY+=(forward/private/routlm.mexw32)
ARRAY+=(private/routlm.mexw32)
ARRAY+=(src/routlm.mexw32)
sync ${ARRAY[*]}

################################################################################
# routlm.mexw64

ARRAY=()
ARRAY+=(forward/private/routlm.mexw64)
ARRAY+=(private/routlm.mexw64)
ARRAY+=(src/routlm.mexw64)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.m

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.m)
ARRAY+=(private/sandwich2x2.m)
ARRAY+=(src/sandwich2x2.m)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexa64

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexa64)
ARRAY+=(private/sandwich2x2.mexa64)
ARRAY+=(src/sandwich2x2.mexa64)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexglx

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexglx)
ARRAY+=(private/sandwich2x2.mexglx)
ARRAY+=(src/sandwich2x2.mexglx)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexmaca64

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexmaca64)
ARRAY+=(private/sandwich2x2.mexmaca64)
ARRAY+=(src/sandwich2x2.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexmaci)
ARRAY+=(private/sandwich2x2.mexmaci)
ARRAY+=(src/sandwich2x2.mexmaci)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexmaci64)
ARRAY+=(private/sandwich2x2.mexmaci64)
ARRAY+=(src/sandwich2x2.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexw32

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexw32)
ARRAY+=(private/sandwich2x2.mexw32)
ARRAY+=(src/sandwich2x2.mexw32)
sync ${ARRAY[*]}

################################################################################
# sandwich2x2.mexw64

ARRAY=()
ARRAY+=(connectivity/private/sandwich2x2.mexw64)
ARRAY+=(private/sandwich2x2.mexw64)
ARRAY+=(src/sandwich2x2.mexw64)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.m

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.m)
ARRAY+=(private/sandwich3x3.m)
ARRAY+=(src/sandwich3x3.m)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexa64

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexa64)
ARRAY+=(private/sandwich3x3.mexa64)
ARRAY+=(src/sandwich3x3.mexa64)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexglx

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexglx)
ARRAY+=(private/sandwich3x3.mexglx)
ARRAY+=(src/sandwich3x3.mexglx)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexmaca64

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexmaca64)
ARRAY+=(private/sandwich3x3.mexmaca64)
ARRAY+=(src/sandwich3x3.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexmaci

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexmaci)
ARRAY+=(private/sandwich3x3.mexmaci)
ARRAY+=(src/sandwich3x3.mexmaci)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexmaci64

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexmaci64)
ARRAY+=(private/sandwich3x3.mexmaci64)
ARRAY+=(src/sandwich3x3.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexw32

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexw32)
ARRAY+=(private/sandwich3x3.mexw32)
ARRAY+=(src/sandwich3x3.mexw32)
sync ${ARRAY[*]}

################################################################################
# sandwich3x3.mexw64

ARRAY=()
ARRAY+=(connectivity/private/sandwich3x3.mexw64)
ARRAY+=(private/sandwich3x3.mexw64)
ARRAY+=(src/sandwich3x3.mexw64)
sync ${ARRAY[*]}

################################################################################
# sap2matlab.mexa64

ARRAY=()
ARRAY+=(fileio/private/sap2matlab.mexa64)
ARRAY+=(realtime/src/acquisition/siemens/src/sap2matlab.mexa64)
sync ${ARRAY[*]}

################################################################################
# sap2matlab.mexmaci64

ARRAY=()
ARRAY+=(fileio/private/sap2matlab.mexmaci64)
ARRAY+=(realtime/src/acquisition/siemens/src/sap2matlab.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# sap2matlab.mexw32

ARRAY=()
ARRAY+=(fileio/private/sap2matlab.mexw32)
ARRAY+=(realtime/src/acquisition/siemens/src/sap2matlab.mexw32)
sync ${ARRAY[*]}

################################################################################
# savevar.m

ARRAY=()
ARRAY+=(private/savevar.m)
ARRAY+=(utilities/private/savevar.m)
sync ${ARRAY[*]}

################################################################################
# scale.m

ARRAY=()
ARRAY+=(plotting/private/scale.m)
ARRAY+=(private/scale.m)
ARRAY+=(utilities/private/scale.m)
sync ${ARRAY[*]}

################################################################################
# select3d.m

ARRAY=()
ARRAY+=(plotting/private/select3d.m)
ARRAY+=(private/select3d.m)
sync ${ARRAY[*]}

################################################################################
# select_channel_list.m

ARRAY=()
ARRAY+=(private/select_channel_list.m)
ARRAY+=(trialfun/private/select_channel_list.m)
sync ${ARRAY[*]}

################################################################################
# semaphore.h

ARRAY=()
ARRAY+=(realtime/src/external/pthreads-win32/include/semaphore.h)
ARRAY+=(realtime/src/external/pthreads-win64/include/semaphore.h)
sync ${ARRAY[*]}

################################################################################
# serial.c

ARRAY=()
ARRAY+=(realtime/src/acquisition/modeeg/serial.c)
ARRAY+=(realtime/src/acquisition/neurosky/serial.c)
ARRAY+=(realtime/src/acquisition/openbci/serial.c)
sync ${ARRAY[*]}

################################################################################
# serial.h

ARRAY=()
ARRAY+=(realtime/src/acquisition/modeeg/serial.h)
ARRAY+=(realtime/src/acquisition/neurosky/serial.h)
ARRAY+=(realtime/src/acquisition/openbci/serial.h)
sync ${ARRAY[*]}

################################################################################
# setcustompath.m

ARRAY=()
ARRAY+=(qsub/private/setcustompath.m)
sync ${ARRAY[*]}

################################################################################
# setcustompwd.m

ARRAY=()
ARRAY+=(qsub/private/setcustompwd.m)
sync ${ARRAY[*]}

################################################################################
# setglobal.m

ARRAY=()
ARRAY+=(qsub/private/setglobal.m)
sync ${ARRAY[*]}

################################################################################
# setsubfield.m

ARRAY=()
ARRAY+=(connectivity/private/setsubfield.m)
ARRAY+=(fileio/private/setsubfield.m)
ARRAY+=(forward/private/setsubfield.m)
ARRAY+=(plotting/private/setsubfield.m)
ARRAY+=(private/setsubfield.m)
ARRAY+=(qsub/private/setsubfield.m)
ARRAY+=(specest/private/setsubfield.m)
ARRAY+=(statfun/private/setsubfield.m)
ARRAY+=(test/private/setsubfield.m)
ARRAY+=(utilities/setsubfield.m)
sync ${ARRAY[*]}

################################################################################
# setviewpoint.m

ARRAY=()
ARRAY+=(private/setviewpoint.m)
ARRAY+=(plotting/private/setviewpoint.m)
sync ${ARRAY[*]}

################################################################################
# sine_taper.m

ARRAY=()
ARRAY+=(contrib/spike/private/sine_taper.m)
ARRAY+=(private/sine_taper.m)
ARRAY+=(specest/private/sine_taper.m)
sync ${ARRAY[*]}

################################################################################
# smartinput.m

ARRAY=()
ARRAY+=(contrib/spike/private/smartinput.m)
ARRAY+=(private/smartinput.m)
ARRAY+=(utilities/private/smartinput.m)
sync ${ARRAY[*]}

################################################################################
# solid_angle.m

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.m)
ARRAY+=(external/openmeeg/private/solid_angle.m)
ARRAY+=(fileio/private/solid_angle.m)
ARRAY+=(forward/private/solid_angle.m)
ARRAY+=(inverse/private/solid_angle.m)
ARRAY+=(plotting/private/solid_angle.m)
ARRAY+=(private/solid_angle.m)
ARRAY+=(src/solid_angle.m)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexa64

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexa64)
ARRAY+=(external/openmeeg/private/solid_angle.mexa64)
ARRAY+=(fileio/private/solid_angle.mexa64)
ARRAY+=(forward/private/solid_angle.mexa64)
ARRAY+=(inverse/private/solid_angle.mexa64)
ARRAY+=(plotting/private/solid_angle.mexa64)
ARRAY+=(private/solid_angle.mexa64)
ARRAY+=(src/solid_angle.mexa64)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexglx

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexglx)
ARRAY+=(external/openmeeg/private/solid_angle.mexglx)
ARRAY+=(forward/private/solid_angle.mexglx)
ARRAY+=(inverse/private/solid_angle.mexglx)
ARRAY+=(plotting/private/solid_angle.mexglx)
ARRAY+=(private/solid_angle.mexglx)
ARRAY+=(src/solid_angle.mexglx)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexmac

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexmac)
ARRAY+=(external/openmeeg/private/solid_angle.mexmac)
ARRAY+=(forward/private/solid_angle.mexmac)
ARRAY+=(inverse/private/solid_angle.mexmac)
ARRAY+=(plotting/private/solid_angle.mexmac)
ARRAY+=(private/solid_angle.mexmac)
ARRAY+=(src/solid_angle.mexmac)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexmaca64

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexmaca64)
ARRAY+=(external/openmeeg/private/solid_angle.mexmaca64)
ARRAY+=(forward/private/solid_angle.mexmaca64)
ARRAY+=(inverse/private/solid_angle.mexmaca64)
ARRAY+=(plotting/private/solid_angle.mexmaca64)
ARRAY+=(private/solid_angle.mexmaca64)
ARRAY+=(src/solid_angle.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexmaci

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexmaci)
ARRAY+=(external/openmeeg/private/solid_angle.mexmaci)
ARRAY+=(forward/private/solid_angle.mexmaci)
ARRAY+=(inverse/private/solid_angle.mexmaci)
ARRAY+=(plotting/private/solid_angle.mexmaci)
ARRAY+=(private/solid_angle.mexmaci)
ARRAY+=(src/solid_angle.mexmaci)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexmaci64

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexmaci64)
ARRAY+=(external/openmeeg/private/solid_angle.mexmaci64)
ARRAY+=(forward/private/solid_angle.mexmaci64)
ARRAY+=(inverse/private/solid_angle.mexmaci64)
ARRAY+=(plotting/private/solid_angle.mexmaci64)
ARRAY+=(private/solid_angle.mexmaci64)
ARRAY+=(src/solid_angle.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexw32

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexw32)
ARRAY+=(external/openmeeg/private/solid_angle.mexw32)
ARRAY+=(forward/private/solid_angle.mexw32)
ARRAY+=(inverse/private/solid_angle.mexw32)
ARRAY+=(plotting/private/solid_angle.mexw32)
ARRAY+=(private/solid_angle.mexw32)
ARRAY+=(src/solid_angle.mexw32)
sync ${ARRAY[*]}

################################################################################
# solid_angle.mexw64

ARRAY=()
ARRAY+=(external/dipoli/private/solid_angle.mexw64)
ARRAY+=(external/openmeeg/private/solid_angle.mexw64)
ARRAY+=(forward/private/solid_angle.mexw64)
ARRAY+=(inverse/private/solid_angle.mexw64)
ARRAY+=(plotting/private/solid_angle.mexw64)
ARRAY+=(private/solid_angle.mexw64)
ARRAY+=(src/solid_angle.mexw64)
sync ${ARRAY[*]}

################################################################################
# specest_nanfft.m

ARRAY=()
ARRAY+=(contrib/spike/private/specest_nanfft.m)
ARRAY+=(private/specest_nanfft.m)
sync ${ARRAY[*]}

################################################################################
# standardcolors.m

ARRAY=()
ARRAY+=(private/standardcolors.m)
ARRAY+=(plotting/private/standardcolors.m)
sync ${ARRAY[*]}

################################################################################
# standardise.m

ARRAY=()
ARRAY+=(connectivity/private/standardise.m)
ARRAY+=(private/standardise.m)
sync ${ARRAY[*]}

################################################################################
# startsWith.m

ARRAY=()
ARRAY+=(matlablt2016b/startsWith.m)
ARRAY+=(octave/startsWith.m)
sync ${ARRAY[*]}


################################################################################
# strel_bol.m

ARRAY=()
ARRAY+=(private/strel_bol.m)
ARRAY+=(utilities/strel_bol.m)
sync ${ARRAY[*]}

################################################################################
# surface_normals.m

ARRAY=()
ARRAY+=(external/openmeeg/private/surface_normals.m)
ARRAY+=(fileio/private/surface_normals.m)
ARRAY+=(forward/private/surface_normals.m)
ARRAY+=(plotting/private/surface_normals.m)
ARRAY+=(private/surface_normals.m)
ARRAY+=(test/private/surface_normals.m)
sync ${ARRAY[*]}

################################################################################
# surface_orientation.m

ARRAY=()
ARRAY+=(forward/private/surface_orientation.m)
ARRAY+=(inverse/private/surface_orientation.m)
ARRAY+=(plotting/private/surface_orientation.m)
ARRAY+=(private/surface_orientation.m)
sync ${ARRAY[*]}

################################################################################
# surface_inside.m

ARRAY=()
ARRAY+=(external/dipoli/private/surface_inside.m)
ARRAY+=(external/openmeeg/private/surface_inside.m)
ARRAY+=(fileio/private/surface_inside.m)
ARRAY+=(forward/private/surface_inside.m)
ARRAY+=(inverse/private/surface_inside.m)
ARRAY+=(private/surface_inside.m)
sync ${ARRAY[*]}

################################################################################
# surface_shift

ARRAY=()
ARRAY+=(forward/private/surface_shift.m)
ARRAY+=(private/surface_shift.m)
sync ${ARRAY[*]}

################################################################################
# time2offset.m

ARRAY=()
ARRAY+=(fileio/private/time2offset.m)
ARRAY+=(private/time2offset.m)
ARRAY+=(utilities/private/time2offset.m)
sync ${ARRAY[*]}

################################################################################
# tokenize.m

ARRAY=()
ARRAY+=(fileio/private/tokenize.m)
ARRAY+=(qsub/private/tokenize.m)
ARRAY+=(utilities/tokenize.m)
sync ${ARRAY[*]}

################################################################################
# traditional.m

ARRAY=()
ARRAY+=(private/traditional.m)
ARRAY+=(utilities/private/traditional.m)
sync ${ARRAY[*]}

################################################################################
# transfer2coeffs.m

ARRAY=()
ARRAY+=(private/transfer2coeffs.m)
ARRAY+=(connectivity/private/transfer2coeffs.m)
sync ${ARRAY[*]}

################################################################################
# translate.m

ARRAY=()
ARRAY+=(fileio/private/translate.m)
ARRAY+=(inverse/private/translate.m)
ARRAY+=(plotting/private/translate.m)
ARRAY+=(private/translate.m)
ARRAY+=(utilities/private/translate.m)
sync ${ARRAY[*]}

################################################################################
# triangle2connectivity.m

ARRAY=()
ARRAY+=(private/triangle2connectivity.m)
ARRAY+=(plotting/private/triangle2connectivity.m)
sync ${ARRAY[*]}


################################################################################
# triangle4pt.m

ARRAY=()
ARRAY+=(forward/private/triangle4pt.m)
ARRAY+=(private/triangle4pt.m)
sync ${ARRAY[*]}

################################################################################
# trl2boolvec.m

ARRAY=()
ARRAY+=(private/trl2boolvec.m)
ARRAY+=(external/dss/private/trl2boolvec.m)
sync ${ARRAY[*]}

################################################################################
# undobalancing.m

ARRAY=()
ARRAY+=(fileio/private/undobalancing.m)
ARRAY+=(forward/private/undobalancing.m)
ARRAY+=(plotting/private/undobalancing.m)
ARRAY+=(private/undobalancing.m)
ARRAY+=(utilities/private/undobalancing.m)
sync ${ARRAY[*]}

################################################################################
# unparcellate.m

ARRAY=()
ARRAY+=(private/unparcellate.m)
ARRAY+=(utilities/private/unparcellate.m)
sync ${ARRAY[*]}

################################################################################
# volumefillholes.m

ARRAY=()
ARRAY+=(private/volumefillholes.m)
ARRAY+=(utilities/private/volumefillholes.m)
sync ${ARRAY[*]}

################################################################################
# volumeflip.m

ARRAY=()
ARRAY+=(private/volumeflip.m)
ARRAY+=(utilities/private/volumeflip.m)
sync ${ARRAY[*]}

################################################################################
# volumepermute.m

ARRAY=()
ARRAY+=(private/volumepermute.m)
ARRAY+=(utilities/private/volumepermute.m)
sync ${ARRAY[*]}

################################################################################
# volumesmooth.m

ARRAY=()
ARRAY+=(private/volumesmooth.m)
ARRAY+=(utilities/private/volumesmooth.m)
sync ${ARRAY[*]}

################################################################################
# volumethreshold.m

ARRAY=()
ARRAY+=(private/volumethreshold.m)
ARRAY+=(utilities/private/volumethreshold.m)
sync ${ARRAY[*]}

################################################################################
# watchdog.m

ARRAY=()
ARRAY+=(qsub/private/watchdog.m)
sync ${ARRAY[*]}

################################################################################
# watchdog.mexa64

ARRAY=()
ARRAY+=(qsub/private/watchdog.mexa64)
sync ${ARRAY[*]}

################################################################################
# watchdog.mexglx

ARRAY=()
ARRAY+=(qsub/private/watchdog.mexglx)
sync ${ARRAY[*]}

################################################################################
# watchdog.mexmaci

ARRAY=()
ARRAY+=(qsub/private/watchdog.mexmaca64)
sync ${ARRAY[*]}

################################################################################
# watchdog.mexmaci

ARRAY=()
ARRAY+=(qsub/private/watchdog.mexmaci)
sync ${ARRAY[*]}

################################################################################
# watchdog.mexmaci64

ARRAY=()
ARRAY+=(qsub/private/watchdog.mexmaci64)
sync ${ARRAY[*]}

################################################################################
# windows.m

ARRAY=()
ARRAY+=(preproc/private/windows.m)
ARRAY+=(specest/private/windows.m)
sync ${ARRAY[*]}

################################################################################
# write_ctf_shm.mexglx

ARRAY=()
ARRAY+=(fileio/private/write_ctf_shm.mexglx)
ARRAY+=(src/write_ctf_shm.mexglx)
sync ${ARRAY[*]}
