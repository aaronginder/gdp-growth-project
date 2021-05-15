#!/bin/bash

# Functions
_setprojectenv() {
    if [[ -z $GCP_PROJECT ]]; then
        echo Insert GCP Project ...
        read GCP_PROJECT
        export GCP_PROJECT to $GCP_PROJECT
        echo Set GCP_PROJECT=$GCP_PROJECT
    fi

    if [[ $(gcloud config get-value project) != $GCP_PROJECT  ]]; then
        gcloud config set project $GCP_PROJECT
    fi
}

_setdatasetenv() {
    if [[ -z $GCP_DATASET ]]; then
        export GCP_DATASET="gdp_country_growth"
        echo Set GCP_DATASET to $GCP_DATASET
    fi
}

_createbqdataset() {
    if [[ -z $(gcloud alpha bq datasets list --filter $GCP_DATASET --format='value(ID)') ]]; then
        gcloud alpha bq datasets create $GCP_DATASET \
            --description 'Dataset that collects GDP annual growth by country and joins population data to calculate the GDP per person'
    fi
}

_loadtobq() {
    bq load \
    --autodetect \
    --source_format=CSV \
    "$GCP_DATASET.T1_gdp_annual_growth" \
    ./data/T1_gdp_annual_growth.csv
}

setenv() {
    _setprojectenv
    _setdatasetenv
    _createbqdataset
    # _loadtobq
}

# Execute script
setenv