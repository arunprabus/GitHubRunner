#!/bin/bash

ORGANIZATION=arunprabus/SampleCalc
ACCESS_TOKEN=YourAuthToken

cd /home/docker/actions-runner

./config.sh --url https://github.com/arunprabus/SampleCalc --token YourGitRunnerToken

cleanup() {
    echo "Removing runner..."
    ./config.sh --url https://github.com/arunprabus/SampleCalc --token YourGitRunnerToken
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!