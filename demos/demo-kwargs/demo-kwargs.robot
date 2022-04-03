*** Settings ***
Documentation     Demo Kwargs: Explore other options that can be passed as kwargs

Library      OpenShiftLibrary

*** Test Cases ***
Test Pass Dry Run As Kwargs 
    [Documentation]    Dry Run allows to preview the object to create
    ...    without really submitting it to the cluster 
    ...    In this demo we use the Oc Create keyword with dry_run Argument
    ...    Then we use Oc Get and we get Not Found error because the secret
    ...    wasn't created, it was just a preview   
    Oc Create    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: project-2}}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src={apiVersion: v1, kind: Secret, metadata: {name: secret-2}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1    namespace=project-2    dry_run=All
    Oc Get    kind=Secret     name=project-2    api_version=v1    namespace=project-2 
    Oc Delete    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: project-2}}    api_version=project.openshift.io/v1

