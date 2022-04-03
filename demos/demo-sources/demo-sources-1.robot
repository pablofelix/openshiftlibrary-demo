*** Settings ***
Documentation     Demo Sources Part 1: Explore the different ways to pass objects' 
...    definitions to generic keywords

Library      OpenShiftLibrary

*** Test Cases ***
Test Src Argument String Represents Path. Pass Namespace As Argument
    Oc Create    kind=Project    src=demos/demo-sources/test-data/project-1.yaml    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src=demos/demo-sources/test-data/secret-1.yaml    api_version=v1    namespace=my-project-1
    Oc Delete    kind=Secret     src=demos/demo-sources/test-data/secret-1.yaml    api_version=v1    namespace=my-project-1 
    Oc Delete    kind=Project    src=demos/demo-sources/test-data/project-1.yaml    api_version=project.openshift.io/v1

Test Src Argument String Represents Path. Pass Namespace In File
    Oc Create    kind=Project    src=demos/demo-sources/test-data/project-2.yaml    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src=demos/demo-sources/test-data/secret-2.yaml    api_version=v1 
    Oc Delete    kind=Secret     src=demos/demo-sources/test-data/secret-2.yaml    api_version=v1 
    Oc Delete    kind=Project    src=demos/demo-sources/test-data/project-2.yaml    api_version=project.openshift.io/v1

