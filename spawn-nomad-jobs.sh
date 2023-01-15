#!/bin/bash

set -eu
set -o pipefail

job_repo="nomad-jobs"

for job in $(ls $job_repo); do
	nomad run $job_repo/$job
done
