#!/bin/bash

source kettle.params
LOG_BASE=2

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

# check source cd
if [ -z "$SOURCE_CD" ]
then
  SOURCE_CD="STD"
fi

## data
#DATA_LOCATION="/home/transmart/datasets/EtriksGSE43696/expression"
#DATA_FILE_PREFIX="ExpRawData"
#MAP_FILENAME="GSE43696_sample_subject_mapping.txt"
#
## security
#SECURITY_REQUIRED="N"
#
## job_detail
#STUDY_ID="GSE43696_ETRIKS"
#TOP_NODE="\\eTRIKS Asthma\\Milosevic(2013) GSE43696"
#SOURCE_CD="GEO"

################## user input end ##################

echo "start kettle..."

# kettle job
EXPRESSION_JOB='load_gene_expression_data.kjb'
#CLINICAL_JOB='increment_clinical_data.kjb'

$KITCHEN -norep=Y                                          \
  -file=$KETTLE_JOBS_PSQL/$EXPRESSION_JOB		   \
  -log=logs/load_expression_data_$(date +"%Y%m%d%H%M").log \
  -level=Debug \
  -param:DATA_FILE_PREFIX="$DATA_FILE_PREFIX"              \
  -param:DATA_LOCATION="$DATA_LOCATION"                    \
  -param:DATA_TYPE="$DATA_TYPE"                            \
  -param:FilePivot_LOCATION="${KETTLE_JOBS_PSQL}/.."       \
  -param:LOAD_TYPE=I                                       \
  -param:LOG_BASE="$LOG_BASE"                              \
  -param:MAP_FILENAME="$MAP_FILENAME"                      \
  -param:SAMPLE_REMAP_FILENAME=NOSAMPLEREMAP               \
  -param:SAMPLE_SUFFIX=.rma-Signal                         \
  -param:SECURITY_REQUIRED="$SECURITY_REQUIRED"            \
  -param:SORT_DIR=/tmp                                     \
  -param:SOURCE_CD="${SOURCE_CD}"                          \
  -param:STUDY_ID="$STUDY_ID"                              \
  -param:TOP_NODE="$TOP_NODE"
