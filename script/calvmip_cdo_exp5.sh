#!/bin/bash

# 2D files first
cdo seltimestep,1,101,201,301,401,501,601,701,801,901,1001,1101,1201,1301,1401,1501,1601,1701,1801,1901,2001,2101,2201,2301,2401,2501,2601,2701,2801,2901,3001,3101,3201,3301,3401,3501,3601,3701,3801,3901,4001,4101,4201,4301,4401,4501,4601,4701,4801,4901,5001,5101,5201,5301,5401,5501,5601,5701,5801,5901,6001 yelmo2D.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d.nc

ncks -x -v H_sed,area,basins,ice_allowed,regions,x2D,y2D,z_bed_sd output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc

rm output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d.nc

# rename dimensions
ncrename -O -d xc,X -v xc,X -d yc,Y -v yc,Y -d time,Time100 -v time,Time100 output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc

# 1D
cdo select,name=iareafl,iareagr,lim,limnsw,tendlicalvf,tendligroundf,iareatotalNW,iareatotalNE,iareatotalSW,iareatotalSE yelmo1D.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_1d.nc
# rename dimensions
ncrename -O -d time,Time1 -v time,Time1 output/calvingmip-exp5-yelmo-awi-ucm-igeo_1d.nc

#ncks -A output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_1d.nc

# merge files
ncks -A profiles/Halbrane1D.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A profiles/Halbrane2D.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A profiles/Caprona1D.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A profiles/Caprona2D.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc
ncks -A output/calvingmip-exp5-yelmo-awi-ucm-igeo_1d.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc

cdo -setctomiss,-9999 output/calvingmip-exp5-yelmo-awi-ucm-igeo_3d-variables.nc output/calvingmip-exp5-yelmo-awi-ucm-igeo.nc
