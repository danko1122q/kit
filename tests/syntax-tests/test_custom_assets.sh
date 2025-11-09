#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

### ENVIRONMENT

KIT_CONFIG_DIR=$(mktemp -d)
export KIT_CONFIG_DIR

KIT_CACHE_PATH=$(mktemp -d)
export KIT_CACHE_PATH

echo "
KIT_CONFIG_DIR = ${KIT_CONFIG_DIR}
KIT_CACHE_PATH = ${KIT_CACHE_PATH}
"

### HELPER VARS

custom_syntax_args=(
    "--language=KitTestCustomAssets"
    "tests/syntax-tests/source/KitTestCustomAssets/NoColorsUnlessCustomAssetsAreUsed.kittestcustomassets"
)

integrated_syntax_args=(
    "--language=Rust"
    "examples/simple.rs"
)

### HELPER FUNCTIONS

echo_step() {
    echo -e "\n== $1 =="
}

fail_test() {
    echo -e "FAIL: $1"
    exit 1
}

### TEST STEPS

echo_step "TEST: Make sure 'KitTestCustomAssets' is not part of integrated syntaxes"
kit -f "${custom_syntax_args[@]}" &&
    fail_test "EXPECTED: 'unknown syntax' error ACTUAL: no error occurred"

echo_step "PREPARE: Install custom syntax 'KitTestCustomAssets'"
custom_syntaxes_dir="$(kit --config-dir)/syntaxes"
mkdir -p "${custom_syntaxes_dir}"
cp -v "tests/syntax-tests/KitTestCustomAssets.sublime-syntax" \
    "${custom_syntaxes_dir}/KitTestCustomAssets.sublime-syntax"

echo_step "PREPARE: Build custom assets to enable 'KitTestCustomAssets' syntax"
kit cache --build

echo_step "TEST: 'KitTestCustomAssets' is a known syntax"
kit -f "${custom_syntax_args[@]}" ||
    fail_test "EXPECTED: syntax highlighting to work ACTUAL: there was an error"

echo_step "TEST: The 'Rust' syntax is still available"
kit -f "${integrated_syntax_args[@]}" ||
    fail_test "EXPECTED: syntax highlighting still works with integrated assets ACTUAL: there was an error"

echo_step "TEST: 'KitTestCustomAssets' is an unknown syntax with --no-custom-assets"
kit -f --no-custom-assets "${custom_syntax_args[@]}" &&
    fail_test "EXPECTED: 'unknown syntax' error because of --no-custom-assets ACTUAL: no error occurred"

echo_step "TEST: 'kit cache --clear' removes all files"
kit cache --clear
remaining_files=$(ls -A "${KIT_CACHE_PATH}")
[ -z "${remaining_files}" ] ||
    fail_test "EXPECTED: no files remain ACTUAL: some files remain:\n${remaining_files}"

echo_step "CLEAN"
rm -rv "${KIT_CONFIG_DIR}" "${KIT_CACHE_PATH}"
