# Transmart Loader

## How To

1. Download/Create clinical data, 
put _data file_ and _map file_ 
on a server location where you can find.
2. Change and save _clinical.params_ file. 
(Parameters definition list in _Params List_ section)
3. Load clinical data.
```shell
./load_clinical.sh clinical.params
```
4. Check if gpl is already in tranSMART
```shell
./check_gpl.sh
```
5. If gpl already in the list, skip next 3 steps.
6. (Optional) Download annotation file from 
[transmart dataset](http://library.transmartfoundation.org/datasets/)
7. (Optional) Change and save _annoataion.params_ file.
8. (Optional) Load annotation data.
```shell
./load_annotation.sh annotation.params
```
9. Change and save _expression.params_ file
10. Load expression data.
```shell
./load_expression.sh expression.params
```
Done!


## Running Scripts

* load_clinial.sh
* load_expression.sh
* load_annotation.sh

## Params Files

* clinical.params
* expression.params
* annotation.params

## Params List

### clinical.params
```shell
# data  
DATA_LOCATION="/home/transmart/datasets/RanchoGSE4698/clinical"  
COLUMN_MAP_FILE="Acute_Lymphoblastic_Leukemia_Kirschner_Schwabe_GSE4698_Mapping_File.txt"  

# info  
STUDY_ID="GSE4698"  
TOP_NODE="\\Public Studies\\Acute Lymphoblastic Leukemia_Kirschner_Schwabe_GSE4698"  

# security  
SECURITY_REQUIRED="N"  

# not using  
WORD_MAP_FILE=x  
RECORD_EXCLUSION_FILE=x  
```
| Field Name            | Meaning                                                   |
| --------------------- | --------------------------------------------------------- |
| DATA_LOCATION         | Location of clinical data folder.                         |
| COLUMN_MAP_FILE       | Map file.                                                 |
| STUDY_ID              | Study id.                                                 |
| TOP_NODE              | Top node. <br> (TOP_NODE=\\\TOP_NODE_PREFIX\\\STUDY_NAME) |
| SECURITY_REQUIRED     | Is private?                                               |
| WORD_MAP_FILE         | Word map file.                                            |
| RECORD_EXCLUSION_FILE | Record exclusion file.                                    |

### expression.params
```shell
# data
DATA_LOCATION="/home/transmart/datasets/RanchoGSE4698/expression"
DATA_FILE_PREFIX="Acute_Lymphoblastic_Leukemia_Kirschner_Schwabe_GSE4698_Gene_Expression_Data"
MAP_FILENAME=\
"Acute_Lymphoblastic_Leukemia_"\
"Kirschner_Schwabe_GSE4698_"\
"Subject_Sample_Mapping_File.txt"\

# info
STUDY_ID="GSE4698"
TOP_NODE="\\Public Studies\\Acute Lymphoblastic Leukemia_Kirschner_Schwabe_GSE4698"
SOURCE_CD=""

# security
SECURITY_REQUIRED="N"

```
| Field Name 		| Meaning |
| --- 			| --- |
| DATA_LOCATION   	| Location of clinical data folder. |
| DATA_FILE_PREFIX 	| Prefix of data file. |
| MAP_FILENAME 		| Map file name. |
| STUDY_ID        	| Study id. |
| TOP_NODE        	| Top node. <br> (TOP_NODE=\\\TOP_NODE_PREFIX\\\STUDY_NAME) |
| SOURCE_CD 		| Source to include. <br> Corresponding to SOURCE_CD filed in map file. <br> Default value: STD |
| SECURITY_REQUIRED  	| Is private? |

### annotation.params
``` shell
# data
DATA_LOCATION="/home/transmart/datasets/EtriksGSE43696/annotation"
SOURCE_FILENAME="GPL6480.txt"

# info
ANNOTATION_TITLE="Agilent-014850 Whole Human Genome Microarray 4x44K G4112F (Probe Name Version)"
GPL_ID="GPL6480"

# col numbers
PROBE_COL=2
GENE_SYMBOL_COL=3
GENE_ID_COL=4
ORGANISM_COL=5

# header?
SKIP_ROWS=0

```
| Field Name 	   | Meaning |
| --- 		   | --- |
| DATA_LOCATION    | Location of annotation data folder. |
| SOURCE_FILENAME  | Data file name. |
| ANNOTATION_TITLE | Title. (copy from xz) |
| GPL_ID 	   | GPL id. |
| PROBE_COL 	   | Column index of the probe ID. |
| GENE_SYMBOL_COL  | Column index of the gene symbol. |
| GENE_ID_COL 	   | Column index of the gene ID. |
| ORGANISM_COL 	   | Column index of the organism. |
| SKIP_ROWS 	   | Number of rows to skip. <br>Note: This script does not assume a header row is present. <br>If a header row exists, this should be set to one. |
