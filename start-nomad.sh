#!/bin/bash

set -eu
set -o pipefail

# spawn agent if specified
if [[ $1 == "agent" ]]; then
	# spawn the agent 
	nomad agent --dev &
fi

# TODO: current issues
# No nodes were eligible for evaluation
# No nodes are available in datacenter us-east-1
# spawn jobs if specified
if [[ $1 == "jobs" ]]; then
	# spawn the jobs
	job_repo="nomad-jobs"

	for job in $(ls $job_repo); do
		nomad run $job_repo/$job &
	done
fi
