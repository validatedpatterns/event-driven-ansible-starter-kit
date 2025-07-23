#!/bin/bash

epoch_now=$(date +%s)
job_name="immediate-aap-config-$epoch_now"

job_id=$(oc -n aap-config create job $job_name --from=cronjob/agof-config-job | sed -e s/created//)

if [ "$1" = "tail" ]; then
    echo "Waiting for pod to start"
    sleep 5
    oc logs -f -n aap-config $job_id
fi
