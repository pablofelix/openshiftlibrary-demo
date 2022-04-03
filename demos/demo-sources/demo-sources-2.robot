*** Settings ***
Documentation     Demo Sources Part 2: Explore the different ways to pass objects' 
...    definitions to generic keywords

Library      OpenShiftLibrary

*** Test Cases ***
Test Src Argument String Oneline Yaml Format. Pass Namespace As Argument
    Oc Create    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: my-project-5}}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src={apiVersion: v1, kind: Secret, metadata: {name: my-secret-5}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1    namespace=my-project-5
    Oc Delete    kind=Secret     src={apiVersion: v1, kind: Secret, metadata: {name: my-secret-5}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1    namespace=my-project-5 
    Oc Delete    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: my-project-5}}    api_version=project.openshift.io/v1

Test Src Argument String Oneline Yaml Format. Pass Namespace In String
    Oc Create    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: my-project-6}}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src={apiVersion: v1, kind: Secret, metadata: {name: my-secret-6, namespace: my-project-6}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1  
    Oc Delete    kind=Secret     src={apiVersion: v1, kind: Secret, metadata: {name: my-secret-6, namespace: my-project-6}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1  
    Oc Delete    kind=Project    src={apiVersion: project.openshift.io/v1, kind: Project, metadata: {name: my-project-6}}    api_version=project.openshift.io/v1

Test Src Argument String Oneline Json Format. Pass Namespace As Argument
    Oc Create    kind=Project    src={"apiVersion": "project.openshift.io/v1", "kind": "Project", "metadata": {"name": "my-project-7"}}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src={"apiVersion": "v1", "kind": "Secret", "metadata": {"name": "my-secret-7"}, "stringData": {"KEY": "foo-bar"}, "type": "Opaque"}    api_version=v1    namespace=my-project-7
    Oc Delete    kind=Secret     src={"apiVersion": "v1", "kind": "Secret", "metadata": {"name": "my-secret-7"}, "stringData": {"KEY": "foo-bar"}, "type": "Opaque"}    api_version=v1    namespace=my-project-7
    Oc Delete    kind=Project    src={"apiVersion": "project.openshift.io/v1", "kind": "Project", "metadata": {"name": "my-project-7"}}    api_version=project.openshift.io/v1

Test Src Argument String Oneline Json Format. Pass Namespace In String
    Oc Create    kind=Project    src={"apiVersion": "project.openshift.io/v1", "kind": "Project", "metadata": {"name": "my-project-8"}}    api_version=project.openshift.io/v1
    Oc Create    kind=Secret     src={"apiVersion": "v1", "kind": "Secret", "metadata": {"name": "my-secret-8", "namespace": "my-project-8"}, "stringData": {"KEY": "foo-bar"}, type: Opaque}    api_version=v1  
    Oc Delete    kind=Secret     src={"apiVersion": "v1", "kind": "Secret", "metadata": {"name": "my-secret-8", "namespace": "my-project-8"}, stringData: {KEY: foo-bar}, type: Opaque}    api_version=v1   
    Oc Delete    kind=Project    src={"apiVersion": "project.openshift.io/v1", "kind": "Project", "metadata": {"name": "my-project-8"}}    api_version=project.openshift.io/v1
