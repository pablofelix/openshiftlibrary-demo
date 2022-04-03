*** Settings ***
Documentation     Demo Sources Part 4: Explore the different ways to pass objects' 
...    definitions to generic keywords

Library      OpenShiftLibrary

*** Variable ***
${PROJECT_JSON}    SEPARATOR=\n
...                {
...                ${SPACE * 1}"apiVersion": "project.openshift.io/v1",
...                ${SPACE * 1}"kind": "Project",
...                ${SPACE * 1}"metadata": {
...                ${SPACE * 2}"name": "my-project-11"
...                ${SPACE * 1}}
...                }

${SECRET_JSON}     SEPARATOR=\n
...                {
...                ${SPACE * 1}"apiVersion": "v1",
...                ${SPACE * 1}"kind": "Secret",
...                ${SPACE * 1}"metadata": {
...                ${SPACE * 2}"name": "my-secret-11",
...                ${SPACE * 2}"namespace": "my-project-11"
...                ${SPACE * 1}},
...                ${SPACE * 1}"stringData": {
...                ${SPACE * 2}"KEY": "foo-bar"
...                ${SPACE * 1}},
...                ${SPACE * 1}"type": "Opaque"
...                }                

*** Test Cases ***
Test Src Argument String Json Format From Multiline Environment Variable
    Oc Create    kind=Project    src=${PROJECT_JSON}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src=${SECRET_JSON}     api_version=v1
    Oc Delete    kind=Secret     src=${SECRET_JSON}     api_version=v1
    Oc Delete    kind=Project    src=${PROJECT_JSON}    api_version=project.openshift.io/v1

Test Src Argument String Json Format From Multiline Local Variable
    ${project_yaml} =    Catenate    SEPARATOR=\n
    ...    {
    ...    ${SPACE * 1}"apiVersion": "project.openshift.io/v1",
    ...    ${SPACE * 1}"kind": "Project",
    ...    ${SPACE * 1}"metadata": {
    ...    ${SPACE * 2}"name": "my-project-12"
    ...    ${SPACE * 1}}
    ...    }
    ${secret_yaml} =    Catenate    SEPARATOR=\n
    ...    {
    ...    ${SPACE * 1}"apiVersion": "v1",
    ...    ${SPACE * 1}"kind": "Secret",
    ...    ${SPACE * 1}"metadata": {
    ...    ${SPACE * 2}"name": "my-secret-12",
    ...    ${SPACE * 2}"namespace": "my-project-12"
    ...    ${SPACE * 1}},
    ...    ${SPACE * 1}"stringData": {
    ...    ${SPACE * 2}"KEY": "foo-bar"
    ...    ${SPACE * 1}},
    ...    ${SPACE * 1}"type": "Opaque"
    ...    }                
   
    Oc Create    kind=Project    src=${project_yaml}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src=${SECRET_YAML}     api_version=v1
    Oc Delete    kind=Secret     src=${SECRET_YAML}     api_version=v1
    Oc Delete    kind=Project    src=${project_yaml}    api_version=project.openshift.io/v1