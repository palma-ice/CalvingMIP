#!/bin/bash

# 2D files first
cdo seltimestep,1,101,201,301,401,501,601,701,801,901,1001 yelmo2D.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d.nc

ncks -x -v H_sed,area,basins,ice_allowed,regions,x2D,y2D,z_bed_sd output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc

rm output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d.nc

# rename dimensions
ncrename -O -d xc,X -v xc,X -d yc,Y -v yc,Y -d time,Time100 -v time,Time100 output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc

# 1D
cdo select,name=iareafl,iareagr,lim,limnsw,tendlicalvf,tendligroundf,iareatotalNW,iareatotalNE,iareatotalSW,iareatotalSE yelmo1D.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_1d.nc
# rename dimensions
ncrename -O -d time,Time1 -v time,Time1 output/calvingmip-exp4-yelmo-awi-ucm-igeo_1d.nc

#ncks -A output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_1d.nc

# merge files
ncks -A profiles/Halbrane1D.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A profiles/Halbrane2D.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A profiles/Caprona1D.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A profiles/Caprona2D.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A output/calvingmip-exp4-yelmo-awi-ucm-igeo_1d.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc

cdo -setctomiss,-9999 output/calvingmip-exp4-yelmo-awi-ucm-igeo_3d-variables.nc output/calvingmip-exp4-yelmo-awi-ucm-igeo.nc
