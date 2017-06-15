# Transmart Loader

## Run Example

```shell
./load_clinical.sh clinical.params
```

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
    | Field Name | Meaning |
    | - | - |
    | **DATA_LOCATION**   | Location of clinical data folder. |
    | **COLUMN_MAP_FILE** | Map file. |
    | **STUDY_ID**        | Study id. |
    | **TOP_NODE**        | Top node. <br> (TOP_NODE=\\\TOP_NODE_PREFIX\\\STUDY_NAME) |
    | **SECURITY_REQUIRED**     | Is private? |
    | **WORD_MAP_FILE**         | Word map file. |
    | **RECORD_EXCLUSION_FILE** | Record exclusion file. |

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
    | Field Name | Meaning |
    | - | - |
    | **DATA_LOCATION**   | Location of clinical data folder. |
    | **DATA_FILE_PREFIX** | Prefix of data file. |
    | **MAP_FILENAME** | Map file name. |
    | **STUDY_ID**        | Study id. |
    | **TOP_NODE**        | Top node. <br> (TOP_NODE=\\\TOP_NODE_PREFIX\\\STUDY_NAME) |
    | **SOURCE_CD** | Source to include. <br> Corresponding to SOURCE_CD filed in map file. <br> Default value: STD |
    | **SECURITY_REQUIRED**     | Is private? |

### annotation.params
    ``` shell
    ```
