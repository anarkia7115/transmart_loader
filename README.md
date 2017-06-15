# Transmart Loader

## Run Example

> ./load_clinical.sh clinical.params

## Running Scripts

* load_clinial.sh
* load_expression.sh
* load_annotation.sh

## Params Files

* clinical.params
* expression.params
* annotation.params

## Params List

* clinical.params

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
