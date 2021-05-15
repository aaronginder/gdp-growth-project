#!/bin/bash

# Functions
function _setprojectenv() {
    echo Checking GCP_PROJECT environment variable...
    if [[ -z $GCP_PROJECT ]]; then
        echo Insert GCP Project ...
        read GCP_PROJECT
        export GCP_PROJECT=$GCP_PROJECT
        echo Set GCP_PROJECT to $GCP_PROJECT
    else
        echo GCP_PROJECT already set to $GCP_PROJECT
    fi

    echo Checking gcloud SDK configurations...
    if [[ $(gcloud config get-value project) != $GCP_PROJECT  ]]; then
        gcloud config set project $GCP_PROJECT
    fi
}

function _setdatasetenv() {
    if [[ -z $GCP_DATASET ]]; then
        export GCP_DATASET="gdp_country_growth"
        echo Set GCP_DATASET to $GCP_DATASET
    fi
}

function _createbqdataset() {
    echo Creating $GCP_PROJECT.$GCP_DATASET
    if [[ -z $(gcloud alpha bq datasets list --filter $GCP_DATASET --format='value(ID)') ]]; then
        gcloud alpha bq datasets create $GCP_DATASET \
            --description 'Dataset that collects GDP annual growth by country and joins population data to calculate the GDP per person'
    else
        echo Do not need to create dataset... Already exists
    fi
}

function _loaddatatobq() {
    dbt seed --project-dir . --profiles-dir .
}

function setenv() {
    _setprojectenv
    _setdatasetenv
    _createbqdataset
    _loaddatatobq
}

# Execute script
setenv