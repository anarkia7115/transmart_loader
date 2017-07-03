#!/bin/bash

source kettle.params

# default kettle param
DATA_SOURCE="P"
EMBEDDED_GENE_TABLE="N"
LOAD_TYPE="I"

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
#ANNOTATION_TITLE="Agilent-014850 Whole Human Genome Microarray 4x44K G4112F (Probe Name Version)"
#DATA_LOCATION="/home/transmart/datasets/EtriksGSE43696/annotation"
#SOURCE_FILENAME="GPL6480.txt"
#GPL_ID="GPL6480"
#PROBE_COL=2
#GENE_SYMBOL_COL=3
#GENE_ID_COL=4
#ORGANISM_COL=5
## header?
#SKIP_ROWS=0

################## user input end ##################

echo "start kettle..."

# kettle job
ANNOTATION_JOB='load_annotation.kjb'

$KITCHEN -norep=Y                                               \
         -file=$KETTLE_JOBS_PSQL/$ANNOTATION_JOB                  \
	 -level=Debug \
         -log=logs/load_annotation_data_$(date +"%Y%m%d%H%M").log \
	 -param:DATA_SOURCE="$DATA_SOURCE" \
	 -param:EMBEDDED_GENE_TABLE="$EMBEDDED_GENE_TABLE" \
	 -param:LOAD_TYPE="$LOAD_TYPE" \
	 -param:ANNOTATION_TITLE="$ANNOTATION_TITLE" \
	 -param:DATA_LOCATION="$DATA_LOCATION" \
	 -param:SOURCE_FILENAME="$SOURCE_FILENAME" \
	 -param:GPL_ID="$GPL_ID" \
	 -param:PROBE_COL="$PROBE_COL" \
	 -param:GENE_SYMBOL_COL="$GENE_SYMBOL_COL" \
	 -param:GENE_ID_COL="$GENE_ID_COL" \
	 -param:ORGANISM_COL="$ORGANISM_COL" \
	 -param:SKIP_ROWS="$SKIP_ROWS"
