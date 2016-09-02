#/bin/sh
if synclient -l | egrep "TouchpadOff.*= *0" ; then 
    synclient touchpadoff=1 ; 
else 
    synclient touchpadoff=0 ;
fi



