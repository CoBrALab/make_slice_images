#!/usr/bin/env bash

# Created by argbash-init v2.10.0
# ARG_HELP([<The general help message of my script>])
# ARG_POSITIONAL_SINGLE([input],[Input file, MINC or NIFTI])

# ARG_POSITIONAL_SINGLE([output],[Output JPG Image])

# ARG_OPTIONAL_SINGLE([label-overlay],[],[Generate second row with label overlay file],[])
# ARG_OPTIONAL_SINGLE([label-overlay-opacity],[],[Label overlay opacity],[0.3])

# ARG_OPTIONAL_SINGLE([second-row],[],[Generate second row from a different file, conflicts with label],[])

# ARG_OPTIONAL_SINGLE([crop-file],[],[Use bounding box of file for slicing bounds],[])

# ARG_OPTIONAL_SINGLE([transverse-slices],[],[Number of slices to generate for transverse direction],[10])
# ARG_OPTIONAL_SINGLE([coronal-slices],[],[Number of slices to generate for coronal direction],[10])
# ARG_OPTIONAL_SINGLE([sagittal-slices],[],[Number of slices to generate for sagittal direction],[10])

# ARG_OPTIONAL_SINGLE([colour-map],[],[Colour map to use for images],[gray])

# ARG_OPTIONAL_BOOLEAN([debug],[d],[Show all internal commands and logic for debug],[])
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.dev for more info


die()
{
  local _ret="${2:-1}"
  test "${_PRINT_HELP:-no}" = yes && print_help >&2
  echo "$1" >&2
  exit "${_ret}"
}


begins_with_short_option()
{
  local first_option all_short_options='hd'
  first_option="${1:0:1}"
  test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_label_overlay=
_arg_label_overlay_opacity="0.3"
_arg_second_row=
_arg_crop_file=
_arg_transverse_slices="10"
_arg_coronal_slices="10"
_arg_sagittal_slices="10"
_arg_colour_map="gray"
_arg_debug="off"


print_help()
{
  printf '%s\n' "<The general help message of my script>"
  printf 'Usage: %s [-h|--help] [--label-overlay <arg>] [--label-overlay-opacity <arg>] [--second-row <arg>] [--crop-file <arg>] [--transverse-slices <arg>] [--coronal-slices <arg>] [--sagittal-slices <arg>] [--colour-map <arg>] [-d|--(no-)debug] <input> <output>\n' "$0"
  printf '\t%s\n' "<input>: Input file, MINC or NIFTI"
  printf '\t%s\n' "<output>: Output JPG Image"
  printf '\t%s\n' "-h, --help: Prints help"
  printf '\t%s\n' "--label-overlay: Generate second row with label overlay file (no default)"
  printf '\t%s\n' "--label-overlay-opacity: Label overlay opacity (default: '0.3')"
  printf '\t%s\n' "--second-row: Generate second row from a different file, conflicts with label (no default)"
  printf '\t%s\n' "--crop-file: Use bounding box of file for slicing bounds (no default)"
  printf '\t%s\n' "--transverse-slices: Number of slices to generate for transverse direction (default: '10')"
  printf '\t%s\n' "--coronal-slices: Number of slices to generate for coronal direction (default: '10')"
  printf '\t%s\n' "--sagittal-slices: Number of slices to generate for sagittal direction (default: '10')"
  printf '\t%s\n' "--colour-map: Colour map to use for images (default: 'gray')"
  printf '\t%s\n' "-d, --debug, --no-debug: Show all internal commands and logic for debug (off by default)"
}


parse_commandline()
{
  _positionals_count=0
  while test $# -gt 0
  do
    _key="$1"
    case "$_key" in
      -h|--help)
        print_help
        exit 0
        ;;
      -h*)
        print_help
        exit 0
        ;;
      --label-overlay)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_label_overlay="$2"
        shift
        ;;
      --label-overlay=*)
        _arg_label_overlay="${_key##--label-overlay=}"
        ;;
      --label-overlay-opacity)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_label_overlay_opacity="$2"
        shift
        ;;
      --label-overlay-opacity=*)
        _arg_label_overlay_opacity="${_key##--label-overlay-opacity=}"
        ;;
      --second-row)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_second_row="$2"
        shift
        ;;
      --second-row=*)
        _arg_second_row="${_key##--second-row=}"
        ;;
      --crop-file)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_crop_file="$2"
        shift
        ;;
      --crop-file=*)
        _arg_crop_file="${_key##--crop-file=}"
        ;;
      --transverse-slices)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_transverse_slices="$2"
        shift
        ;;
      --transverse-slices=*)
        _arg_transverse_slices="${_key##--transverse-slices=}"
        ;;
      --coronal-slices)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_coronal_slices="$2"
        shift
        ;;
      --coronal-slices=*)
        _arg_coronal_slices="${_key##--coronal-slices=}"
        ;;
      --sagittal-slices)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_sagittal_slices="$2"
        shift
        ;;
      --sagittal-slices=*)
        _arg_sagittal_slices="${_key##--sagittal-slices=}"
        ;;
      --colour-map)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_colour_map="$2"
        shift
        ;;
      --colour-map=*)
        _arg_colour_map="${_key##--colour-map=}"
        ;;
      -d|--no-debug|--debug)
        _arg_debug="on"
        test "${1:0:5}" = "--no-" && _arg_debug="off"
        ;;
      -d*)
        _arg_debug="on"
        _next="${_key##-d}"
        if test -n "$_next" -a "$_next" != "$_key"
        then
          { begins_with_short_option "$_next" && shift && set -- "-d" "-${_next}" "$@"; } || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
        fi
        ;;
      *)
        _last_positional="$1"
        _positionals+=("$_last_positional")
        _positionals_count=$((_positionals_count + 1))
        ;;
    esac
    shift
  done
}


handle_passed_args_count()
{
  local _required_args_string="'input' and 'output'"
  test "${_positionals_count}" -ge 2 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 2 (namely: $_required_args_string), but got only ${_positionals_count}." 1
  test "${_positionals_count}" -le 2 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 2 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
  local _positional_name _shift_for=$1
  _positional_names="_arg_input _arg_output "

  shift "$_shift_for"
  for _positional_name in ${_positional_names}
  do
    test $# -gt 0 || break
    eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
    shift
  done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
set -uo pipefail
set -eE -o functrace

### BASH HELPER FUNCTIONS ###
# Stolen from https://github.com/kvz/bash3boilerplate

# Set magic variables for current file, directory, os, etc.
__dir="$(cd "$(dirname "${BASH_SOURCE[${__b3bp_tmp_source_idx:-0}]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[${__b3bp_tmp_source_idx:-0}]}")"
__base="$(basename "${__file}" .sh)"
# shellcheck disable=SC2034,SC2015
__invocation="$(printf %q "${__file}")$( (($#)) && printf ' %q' "$@" || true)"

if [[ ${_arg_debug} == "on" ]]; then
  LOG_LEVEL=7
  set -x
else
  LOG_LEVEL=6
fi

function __b3bp_log() {
  local log_level="${1}"
  shift

  # shellcheck disable=SC2034
  local color_debug="\\x1b[35m" #]
  # shellcheck disable=SC2034
  local color_info="\\x1b[32m" #]
  # shellcheck disable=SC2034
  local color_notice="\\x1b[34m" #]
  # shellcheck disable=SC2034
  local color_warning="\\x1b[33m" #]
  # shellcheck disable=SC2034
  local color_error="\\x1b[31m" #]
  # shellcheck disable=SC2034
  local color_critical="\\x1b[1;31m" #]
  # shellcheck disable=SC2034
  local color_alert="\\x1b[1;37;41m" #]
  # shellcheck disable=SC2034
  local color_failure="\\x1b[1;4;5;37;41m" #]

  local colorvar="color_${log_level}"

  local color="${!colorvar:-${color_error}}"
  local color_reset="\\x1b[0m" #]

  if [[ "${NO_COLOR:-}" = "true" ]] || { [[ "${TERM:-}" != "xterm"* ]] && [[ "${TERM:-}" != "screen"* ]]; } || [[ ! -t 2 ]]; then
    if [[ "${NO_COLOR:-}" != "false" ]]; then
      # Don't use colors on pipes or non-recognized terminals
      color=""
      color_reset=""
    fi
  fi

  # all remaining arguments are to be printed
  local log_line=""

  while IFS=$'\n' read -r log_line; do
    echo -e "$(date -u +"%Y-%m-%d %H:%M:%S UTC") ${color}$(printf "[%9s]" "${log_level}")${color_reset} ${log_line}" 1>&2
  done <<<"${@:-}"
}

function failure() {
  __b3bp_log failure "${@}"
  exit 1
}
function alert() {
  [[ "${LOG_LEVEL:-0}" -ge 1 ]] && __b3bp_log alert "${@}"
  true
}
function critical() {
  [[ "${LOG_LEVEL:-0}" -ge 2 ]] && __b3bp_log critical "${@}"
  true
}
function error() {
  [[ "${LOG_LEVEL:-0}" -ge 3 ]] && __b3bp_log error "${@}"
  true
}
function warning() {
  [[ "${LOG_LEVEL:-0}" -ge 4 ]] && __b3bp_log warning "${@}"
  true
}
function notice() {
  [[ "${LOG_LEVEL:-0}" -ge 5 ]] && __b3bp_log notice "${@}"
  true
}
function info() {
  [[ "${LOG_LEVEL:-0}" -ge 6 ]] && __b3bp_log info "${@}"
  true
}
function debug() {
  [[ "${LOG_LEVEL:-0}" -ge 7 ]] && __b3bp_log debug "${@}"
  true
}

# Add handler for failure to show where things went wrong
failure_handler() {
  local lineno=$2
  local fn=$3
  local exitstatus=$4
  local msg=$5
  local lineno_fns=${1% 0}
  if [[ "$lineno_fns" != "0" ]]; then
    lineno="${lineno} ${lineno_fns}"
  fi
  echo "${BASH_SOURCE[1]}:${fn}[${lineno}] Failed with status ${exitstatus}: $msg"
}
trap 'failure_handler "${BASH_LINENO[*]}" "$LINENO" "${FUNCNAME[*]:-script}" "$?" "$BASH_COMMAND"' ERR

if [[ -n ${_arg_label_overlay} && -n ${_arg_second_row} ]]; then
  fatal "Cannot combine label and second row settings"
fi

tmpdir=$(mktemp -d)

# Convert input NIFTI files if provided

if [[ ${_arg_input} = *nii || ${_arg_input} = *nii.gz ]]; then
	nii2mnc ${_arg_input} ${tmpdir}/input.mnc
	_arg_input=${tmpdir}/input.mnc
fi

if [[ ${_arg_label_overlay} = *nii || ${_arg_label_overlay} = *nii.gz ]]; then
	nii2mnc ${_arg_label_overlay} ${tmpdir}/label.mnc
	_arg_label=${tmpdir}/label.mnc
fi

if [[ -z ${_arg_crop_file} ]]; then
    ThresholdImage 3 ${_arg_input} ${tmpdir}/bgmask.mnc 1e-12 Inf 1 0
    ThresholdImage 3 ${_arg_input} ${tmpdir}/bgmask.mnc Otsu 4 ${tmpdir}/bgmask.mnc
    ThresholdImage 3 ${tmpdir}/bgmask.mnc ${tmpdir}/bgmask.mnc 2 Inf 1 0
    mincresample -keep -near -like ${_arg_input} ${tmpdir}/bgmask.mnc ${tmpdir}/resample.mnc
    mincresample $(mincbbox -mincresample ${tmpdir}/resample.mnc) ${tmpdir}/resample.mnc ${tmpdir}/label-crop.mnc
    minccalc -expression "1" ${tmpdir}/label-crop.mnc ${tmpdir}/bounding.mnc
else
    # Use the provided crop file to generate a bounding box
    mincresample -unsigned -int -keep -near -labels $(mincbbox -mincresample ${_arg_crop_file} | grep -v Reading) ${_arg_crop_file} ${tmpdir}/label-crop.mnc
    minccalc -expression "1" ${tmpdir}/label-crop.mnc ${tmpdir}/bounding.mnc
fi

if [[ -n ${_arg_label_overlay} ]]; then
  # Labelled layers
  echo """
  create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_t.rgb \
      -width 1920 -autocols ${_arg_transverse_slices} -autocol_planes t \
      -bounding_volume ${tmpdir}/bounding.mnc \
      -background orange \
      -row ${_arg_input} color:${_arg_colour_map} \
      volume_overlay:${_arg_label_overlay}:${_arg_label_overlay_opacity}

  create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_s.rgb \
      -width 1920 -autocols ${_arg_sagittal_slices} -autocol_planes s \
      -bounding_volume ${tmpdir}/bounding.mnc \
      -background orange \
      -row ${_arg_input} color:${_arg_colour_map} \
      volume_overlay:${_arg_label_overlay}:${_arg_label_overlay_opacity}

  create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_c.rgb \
      -width 1920 -autocols ${_arg_coronal_slices} -autocol_planes c \
      -bounding_volume ${tmpdir}/bounding.mnc \
      -background orange \
      -row ${_arg_input} color:${_arg_colour_map} \
      volume_overlay:${_arg_label_overlay}:${_arg_label_overlay_opacity}
  """ | parallel
fi

if [[ -n ${_arg_second_row} ]]; then
  echo """
    # Trasverse
    create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_t.rgb \
        -width 1920 -height 360 -autocols ${_arg_transverse_slices} -autocol_planes t \
        -bounding_volume ${tmpdir}/bounding.mnc \
        -background orange \
        -row ${_arg_second_row} color:${_arg_colour_map}

    # Saggital
    create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_s.rgb \
        -width 1920 -height 360 -autocols ${_arg_sagittal_slices} -autocol_planes s \
        -bounding_volume ${tmpdir}/bounding.mnc \
        -background orange \
        -row ${_arg_second_row} color:${_arg_colour_map}

    # Coronal
    create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_c.rgb \
        -width 1920 -height 360 -autocols ${_arg_coronal_slices} -autocol_planes c \
        -bounding_volume ${tmpdir}/bounding.mnc \
        -background orange \
        -row ${_arg_second_row} color:${_arg_colour_map} -background orange
  """ | parallel
fi

# Generate the main QC image
echo """
# Trasverse
create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_t2.rgb \
    -width 1920 -height 360 -autocols ${_arg_transverse_slices} -autocol_planes t \
    -bounding_volume ${tmpdir}/bounding.mnc \
    -background orange \
    -row ${_arg_input} color:${_arg_colour_map}

# Saggital
create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_s2.rgb \
    -width 1920 -height 360 -autocols ${_arg_sagittal_slices} -autocol_planes s \
    -bounding_volume ${tmpdir}/bounding.mnc \
    -background orange \
    -row ${_arg_input} color:${_arg_colour_map}

# Coronal
create_verify_image -quiet -align_com -range_floor 0 ${tmpdir}/$(basename ${_arg_input} .mnc)_c2.rgb \
    -width 1920 -height 360 -autocols ${_arg_coronal_slices} -autocol_planes c \
    -bounding_volume ${tmpdir}/bounding.mnc \
    -background orange \
    -row ${_arg_input} color:${_arg_colour_map}
""" | parallel


# Magick to trim only the top and bottom of the images
for file in ${tmpdir}/*rgb; do
  echo """
  convert ${file} \
          -background white -splice 0x1 -background black -splice 0x1 \
          -trim +repage -chop 0x1 -gravity South -background white -splice 0x1 -background black -splice 0x1 \
          -trim +repage -chop 0x1 ${tmpdir}/$(basename $file .rgb).mpc
  """
done | parallel

# Swap the orange filler for black and stack up the images
convert \
  -background black \
  -fill black -opaque orange \
  -gravity center \
  -strip \
  -interlace Plane -sampling-factor 4:2:0 -quality "85%" \
  -append ${tmpdir}/*.mpc \
  ${_arg_output}

rm -r ${tmpdir}

# ] <-- needed because of Argbash