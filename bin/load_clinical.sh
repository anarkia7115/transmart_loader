#!/bin/bash

source kettle.params

################## user input start ##################

if [ ! $# -eq 1 ]
then
  echo "please specify param file"
  exit 1
fi

PARAMS_FILE="$1"
if [ -e $PARAMS_FILE ]
then
  echo "loadding params from $PARAMS_FILE..."
  source $PARAMS_FILE
else
  echo "$PARAMS_FILE not exists"
  exit 1
fi

## data
#DATA_LOCATION="/home/transmart/datasets/EtriksGSE43696/clinical"
#COLUMN_MAP_FILE="GSE43696_Clinical_mapping.txt"
#
## security
#SECURITY_REQUIRED="N"
#
## job_detail
#STUDY_ID="GSE43696_ETRIKS"
#TOP_NODE="\\eTRIKS Asthma\\Milosevic(2013) GSE43696"
#
## not using
#WORD_MAP_FILE=x
#RECORD_EXCLUSION_FILE=x

################## user input end ##################

echo "start kettle..."

# kettle job
CLINICAL_JOB='create_clinical_data.kjb'
#CLINICAL_JOB='increment_clinical_data.kjb'

$KITCHEN -norep=Y                                               \
         -file=$KETTLE_JOBS_PSQL/$CLINICAL_JOB                  \
         -log=logs/load_clinical_data_$(date +"%Y%m%d%H%M").log \
         -param:COLUMN_MAP_FILE="$COLUMN_MAP_FILE"              \
         -param:DATA_LOCATION="$DATA_LOCATION"                  \
         -param:LOAD_TYPE=I                                     \
         -param:SECURITY_REQUIRED="$SECURITY_REQUIRED"          \
         -param:SORT_DIR=/tmp                                   \
         -param:STUDY_ID="$STUDY_ID"                            \
         -param:TOP_NODE="$TOP_NODE"                             \
         -param:WORD_MAP_FILE="$WORD_MAP_FILE"                  \
         -param:RECORD_EXCLUSION_FILE="$RECORD_EXCLUSION_FILE"
         #-param:SQLLDR_PATH=/spin/pg/master/bin/psql \
