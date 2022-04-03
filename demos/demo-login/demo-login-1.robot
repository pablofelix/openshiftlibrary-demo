*** Settings ***
Documentation     Demo Login Part 1
Resource     demos/resources/users.resource
Resource     demos/resources/clusters.resource
Library      OpenShiftLibrary


*** Test Cases ***
Test Login To Cluster Locally
    [Documentation]    Scenario 1: Execute test when logged in to cluster locally
    ${result} =    Oc Get    kind=Node    api_version=v1 
    Log    ${result[0]['metadata']['annotations']['machine.openshift.io/machine']}

Test Login To Cluster With Oc Login Keyword
    [Documentation]    Scenario 2: Execute test login to cluster using Oc Login Keyword
    ...     This doesn't affect local login
    Oc Login  host=${cluster1}  username=${user1}  password=${password1}
    ${result} =    Oc Get    kind=Node    api_version=v1
    Log    ${result[0]['metadata']['annotations']['machine.openshift.io/machine']}


Test Login To Cluster With Oc Login Keyword In Previous Test
    [Documentation]    Scenario 3: Execute test after login to cluster using Oc Login Keyword in
    ...    previous test. The login remains the same.
    ${result} =    Oc Get    kind=Node    api_version=v1 
    Log    ${result[0]['metadata']['annotations']['machine.openshift.io/machine']}
