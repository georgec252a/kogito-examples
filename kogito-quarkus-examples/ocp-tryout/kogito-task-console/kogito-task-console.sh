#!/bin/bash

action=$1

if [ "${action}" == "uninstall" ]; then
  echo "*** uninstalling task console"
  oc delete all,configmap --selector app=kogito-task-console -n $(getProjectName)

elif [ "${action}" == "install" ]; then
  echo "*** installing task console"
<<<<<<< HEAD
  oc new-app quay.io/kiegroup/kogito-task-console:1.36
=======
  oc new-app quay.io/kiegroup/kogito-task-console:1.35
>>>>>>> 67c18c06d7b1aec544b5686f57f0e857ecea6a66
  waitForPod kogito-task-console
  oc patch deployment kogito-task-console --patch "$(cat deployment-patch.yaml)" -n $(getProjectName) $(dryRun)
  waitForPod kogito-task-console
  oc expose service/kogito-task-console -n $(getProjectName) $(dryRun)
else
  echo "*** no such action: $action"
fi