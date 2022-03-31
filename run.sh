#!/bin/bash
TEST_ARTIFACT_DIR="output"
TEST_CASE_FILE=demo
TEST_VARIABLES=""


while [ "$#" -gt 0 ]; do
  case $1 in
    # Override/Add global variables specified in the test variables file
    --test-variable)
      shift
      TEST_VARIABLES="${TEST_VARIABLES} --variable $1"
      shift
      ;;

    # Specify test case to run
    --test-case)
      shift
      TEST_CASE_FILE=$1
      shift
      ;;

    *)
      echo "Unknown command line switch: $1"
      exit 1
      ;;
  esac
done
currentpath=`pwd`
VENV_ROOT=${currentpath}/venv
#setup virtualenv
python3 -m venv ${VENV_ROOT}
source ${VENV_ROOT}/bin/activate

if [[ ${SKIP_PIP_INSTALL} -eq 0 ]]; then
  ${VENV_ROOT}/bin/pip install --upgrade pip
  ${VENV_ROOT}/bin/pip install -r requirements.txt
fi
#TODO: Configure the "tmp_dir" creation so that we can have a "latest" link
TEST_ARTIFACT_DIR=$(mktemp -d -p ${TEST_ARTIFACT_DIR} -t ods-ci-$(date +%Y-%m-%d-%H-%M)-XXXXXXXXXX)

#run tests
robot --pythonpath . -d ${TEST_ARTIFACT_DIR} -x xunit_test_result.xml -r test_report.html ${TEST_VARIABLES} ${TEST_CASE_FILE}

