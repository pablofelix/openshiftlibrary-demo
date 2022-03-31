*** Settings ***
Documentation     Demo Performance: Compare performance between oc commands and OpenShiftLibrary keywords
...   Currently getting dynamically the api version. A cache mechanism can be develop to improve performance
...   Meanwhile api version can be passed as argument to have faster keywords
Library      OperatingSystem
Library      OpenShiftLibrary

*** Test Cases ***
Test Oc commands
    ${create_project} =    Run    oc create -f test-data/project-1.yaml
    ${create_pod_1} =    Run    oc create -f test-data/service-1.yaml -n my-project-1
    ${create_pod_2} =    Run    oc create -f test-data/service-2.yaml -n my-project-1
    ${delete_pod_1} =    Run    oc delete service my-service-1 -n my-project-1
    ${delete_pod_2} =    Run    oc delete service my-service-2 -n my-project-1
    ${delete_project} =    Run    oc delete project my-project-1

Test OpenShiftLibrary Keywords
    Oc Create    kind=Project    src=test-data/project-2.yaml
    Oc Create    kind=Service    src=test-data/service-1.yaml    namespace=my-project-2
    Oc Create    kind=Service    src=test-data/service-2.yaml    namespace=my-project-2
    Oc Delete    kind=Service    name=my-service-1    namespace=my-project-2
    Oc Delete    kind=Service    name=my-service-2    namespace=my-project-2 
    Oc Delete    kind=Project    name=my-project-2

Test OpenShiftLibrary Keywords With Api Version Argument
    Oc Create    kind=Project    src=test-data/project-3.yaml    api_version=project.openshift.io/v1
    Oc Create    kind=Service    src=test-data/service-1.yaml    api_version=v1    namespace=my-project-3
    Oc Create    kind=Service    src=test-data/service-2.yaml    api_version=v1    namespace=my-project-3
    Oc Delete    kind=Service    api_version=v1    name=my-service-1    namespace=my-project-3
    Oc Delete    kind=Service    api_version=v1    name=my-service-2    namespace=my-project-3   
    Oc Delete    kind=Project    api_version=project.openshift.io/v1    name=my-project-3 



