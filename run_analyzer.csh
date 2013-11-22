#!/bin/csh

echo "fit jobs" | mail -s "lauching the job ${1}" hbrun@cern.ch
set LOCALDIR = `pwd`
setenv WORKINGDIR /afs/cern.ch/user/h/hbrun/CMSSW_6_2_1_L2seeding/src
setenv SCRAM_ARCH slc5_amd64_gcc472
#setenv CONF_FILE runRECO_$1.py
setenv LOCAL_PATH hugues/L2seedsAnalyzer/python/fullProd
setenv OUTDIR /afs/cern.ch/work/h/hbrun/seedL2studiesTrees/ 
cd $WORKINGDIR
cmsenv
cd $LOCAL_PATH 
cp ${1}/${1}.py $LOCALDIR
cd $LOCALDIR
ls 
cmsRun ${1}.py

echo "bon ben c finin : on list le directory now ! " 
ls 
sleep 120
cp  /tmp/hbrun/tree_${1}.root $OUTDIR

