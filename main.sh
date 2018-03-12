#!/bin/sh


function validate_parameter(){
if [[ -z ${KBC_PARAMETER_OUTFILENAME} ]]; then
    echo "Must set parameter 'outfilename'"
    exit 1
fi
}

function concat_all(){
    find ${KBC_DATADIR%/}/in/tables/ -type f | xargs cat > ${KBC_DATADIR%/}/out/tables/${KBC_PARAMETER_OUTFILENAME}
}

validate_parameter && concat_all
