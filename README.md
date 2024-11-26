# make_slice_images

```
Tool for generating 2D JPEG images slicing through 3D data for Quality Control, with overlay support
Usage: ./make_slice_images.sh [-h|--help] [--label-overlay <arg>] [--label-overlay-opacity <arg>] [--additional-row <arg>] [--crop-file <arg>] [--transverse-slices <arg>] [--coronal-slices <arg>] [--sagittal-slices <arg>] [--colour-map <arg>] [-d|--(no-)debug] <input> <output>
        <input>: Input file, MINC or NIFTI
        <output>: Output JPG Image
        -h, --help: Prints help
        --label-overlay: Labels to overlay on each image row, repeat for additional rows (empty by default)
        --label-overlay-opacity: Label overlay opacity (default: '0.3')
        --additional-row: Generate additional image row from different files, repeat for more rows (empty by default)
        --crop-file: Use bounding box of file for all slicing bounds (no default)
        --transverse-slices: Number of slices to generate for transverse direction (default: '10')
        --coronal-slices: Number of slices to generate for coronal direction (default: '10')
        --sagittal-slices: Number of slices to generate for sagittal direction (default: '10')
        --colour-map: Colour map to use for images (default: 'gray')
        -d, --debug, --no-debug: Show all internal commands and logic for debug (off by default)
```
