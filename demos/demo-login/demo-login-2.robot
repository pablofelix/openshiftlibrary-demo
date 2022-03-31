*** Settings ***
Documentation     Demo Login Part 2
Resource     demos/resources/users.resource
Resource     demos/resources/clusters.resource
Library      OpenShiftLibrary


*** Test Cases ***
Test Login When Logged To Cluster Using Oc Login Keyword In Previous Test Suite
    [Documentation]    Scenario 4: Execute test when logged in to cluster using Oc Login
    ...    in previous test suite. The login remains the same until you use Oc Login again
    ${result} =    Oc Get    kind=Node    api_version=v1 
    Log    ${result[0]['metadata']['annotations']['machine.openshift.io/machine']}

