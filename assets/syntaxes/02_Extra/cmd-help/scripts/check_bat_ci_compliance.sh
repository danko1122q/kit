#!/usr/bin/env bash

theirs=https://raw.githubusercontent.com/sharkdp/kit/refs/heads/master/tests/syntax-tests/highlighted/cmd-help/test.cmd-help
ours=tests/highlighted/kit-short-0.22.1.txt
theirs_copy=/tmp/kit-regression-test.cmd-help
ours_basename=$(basename $ours)

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 9

# Fetch regression test from `kit`
curl --location --output $theirs_copy $theirs &> /dev/null
curl_exit_status=$?
if [ $curl_exit_status -ne 0 ]; then
    echo "could not fetch the kit regression test, curl failed with code $curl_exit_status."
    exit 1
fi

# check compliance with our regression test in kit CI
if ! diff ../$ours $theirs_copy; then
    cat <<EOF
::warning file=$ours,title=Would fail kit CI::\
The highlight changes to $ours_basename would fail CI in the kit project. For more details, see: \
https://github.com/victor-gp/cmd-help-sublime-syntax/wiki/How-to-manually-bump-cmd%E2%80%90help-version-in-kit%27s-submodules
EOF
    exit 1
else
    echo "ok: $ours matches the version for kit CI"
fi
