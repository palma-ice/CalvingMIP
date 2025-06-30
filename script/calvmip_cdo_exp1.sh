#!/bin/bash

# 2D files first
cdo seltimestep,11 yelmo2D.nc output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d.nc

ncks -x -v H_sed,area,basins,ice_allowed,regions,x2D,y2D,z_bed_sd output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d.nc output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d-variables.nc

rm output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d.nc

# rename dimensions
ncrename -O -d xc,X -v xc,X -d yc,Y -v yc,Y output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d-variables.nc

# merge files
ncks -A profiles/profiles2D.nc output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d-variables.nc

cdo -setctomiss,-9999 output/calvingmip-exp1-yelmo-awi-ucm-igeo_3d-variables.nc output/calvingmip-exp1-yelmo-awi-ucm-igeo.nc
