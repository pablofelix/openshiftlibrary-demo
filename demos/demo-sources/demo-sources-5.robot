*** Settings ***
Documentation     Demo Sources Part 5: Explore the different ways to pass objects' 
...    definitions to generic keywords

Library      OpenShiftLibrary

*** Test Cases ***
Test Src Argument String Partial Yaml Just Custom Fields
    Oc Create    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: project-1}}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src={metadata: {name: secret-1}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1    namespace=project-1
    Oc Delete    kind=Secret     src={apiVersion: v1, kind: Secret, metadata: {name: secret-1}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1    namespace=project-1 
    Oc Delete    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: project-1}}    api_version=project.openshift.io/v1