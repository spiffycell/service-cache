#!/bin/bash

set -eu
set -o pipefail

# spawn agent if specified
if [[ $1 == "agent" ]]; then
	# spawn the agent 
	nomad agent --dev &
fi

# spawn jobs if specified
if [[ $1 == "jobs" ]]; then
	# spawn the jobs
	job_repo="nomad-jobs"

	for job in $(ls $job_repo); do
		nomad run $job_repo/$job &
	done
fi
