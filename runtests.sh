#!/bin/bash

nohup /usr/local/test_lib/nist/run_nist_tests.sh &
nohup /usr/local/test_lib/testu01/rap_testu01 &

wait

# When ready, run also final report script