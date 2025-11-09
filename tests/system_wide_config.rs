use predicates::{prelude::predicate, str::PredicateStrExt};

mod utils;
use utils::command::kit_with_config;

// This test is ignored, as it needs a special system wide config put into place.
// In order to run this tests, use `cargo test --test system_wide_config -- --ignored`
#[test]
#[ignore]
fn use_systemwide_config() {
    kit_with_config()
        .arg("test.txt")
        .assert()
        .success()
        .stdout(predicate::eq("dummy-pager-from-system-config\n").normalize());
}

// This test is ignored, as it needs a special system wide config put into place
// In order to run this tests, use `cargo test --test system_wide_config -- --ignored`
#[test]
#[ignore]
fn config_overrides_system_config() {
    kit_with_config()
        .env("KIT_CONFIG_PATH", "kit.conf")
        .arg("test.txt")
        .assert()
        .success()
        .stdout(predicate::eq("dummy-pager-from-config\n").normalize());
}
