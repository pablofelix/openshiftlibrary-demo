*** Settings ***
Documentation     Demo Sources Part 3: Explore the different ways to pass objects' 
...    definitions to generic keywords

Library      OpenShiftLibrary

*** Variable ***
${PROJECT_YAML}    SEPARATOR=\n
...                apiVersion: project.openshift.io/v1
...                kind: Project
...                metadata:
...                ${SPACE * 2}name: my-project-9

${SECRET_YAML}     SEPARATOR=\n
...                apiVersion: v1
...                kind: Secret
...                metadata:
...                ${SPACE * 2}name: my-secret-9
...                ${SPACE * 2}namespace: my-project-9
...                stringData:
...                ${SPACE * 2}KEY: foo-bar
...                type: Opaque                

*** Test Cases ***
Test Src Argument String Yaml Format From Multiline Environment Variable
    Oc Create    kind=Project    src=${PROJECT_YAML}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src=${SECRET_YAML}     api_version=v1
    Oc Delete    kind=Secret     src=${SECRET_YAML}     api_version=v1
    Oc Delete    kind=Project    src=${PROJECT_YAML}    api_version=project.openshift.io/v1

Test Src Argument String Yaml Format From Multiline Local Variable
    ${project_yaml} =    Catenate    SEPARATOR=\n
    ...    apiVersion: project.openshift.io/v1
    ...    kind: Project
    ...    metadata:
    ...    ${SPACE * 2}name: my-project-10
    ${secret_yaml} =    Catenate    SEPARATOR=\n
    ...    apiVersion: v1
    ...    kind: Secret
    ...    metadata:
    ...    ${SPACE * 2}name: my-secret-10
    ...    ${SPACE * 2}namespace: my-project-10
    ...    stringData:
    ...    ${SPACE * 2}KEY: foo-bar
    ...    type: Opaque    
    Oc Create    kind=Project    src=${project_yaml}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src=${SECRET_YAML}     api_version=v1
    Oc Delete    kind=Secret     src=${SECRET_YAML}     api_version=v1
    Oc Delete    kind=Project    src=${project_yaml}    api_version=project.openshift.io/v1