*** Settings ***
Documentation     Demo Commands: Robot Framework swallows errors when executing commands directly
...  The keyword succeeds executing a command but we can't be sure if the command succeeds 
...  or fails. Can incur in False negative errors or Error type II. 
Library      OperatingSystem
Library      OpenShiftLibrary

*** Test Cases ***
Test Run Command That Succeeds
    ${result} =    Run    ls

Test Run Command That Fails
    ${result} =    Run    cat hello.py

Test Run Command That Succeeds And Return Status
    ${result} =    Run Keyword And Return Status    Run    ls

Test Run Command That Fails And Return Status
    ${result} =    Run Keyword And Return Status   Run    cat hello.py

Test Run Oc Command That Fails
    ${result} =    Run    oc create -f demos/demo-commands/test-data/service.yaml

Test OpenShiftLibrary Keyword That Fails
    Oc Apply    kind=Service    src=demos/demo-commands/test-data/service.yaml    api_version=v1
    
Test OpenShiftLibrary Keyword That Fails And Return Status
    ${result} =    Run Keyword And Return Status    Oc Apply    kind=Service    src=test-data/service.yaml    api_version=v1


