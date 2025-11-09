use std::{env, fs, path::PathBuf};

use crate::util::render_template;

/// Generate manpage and shell completions for the kit application.
pub fn gen_man_and_comp() -> anyhow::Result<()> {
    println!("cargo:rerun-if-changed=assets/manual/");
    println!("cargo:rerun-if-changed=assets/completions/");

    println!("cargo:rerun-if-env-changed=PROJECT_NAME");
    println!("cargo:rerun-if-env-changed=PROJECT_EXECUTABLE");
    println!("cargo:rerun-if-env-changed=CARGO_PKG_VERSION");
    println!("cargo:rerun-if-env-changed=KIT_ASSETS_GEN_DIR");

    // Read environment variables.
    let project_name = env::var("PROJECT_NAME").unwrap_or("kit".into());
    let executable_name = env::var("PROJECT_EXECUTABLE").unwrap_or(project_name.clone());
    let executable_name_uppercase = executable_name.to_uppercase();
    let project_version = env::var("CARGO_PKG_VERSION")?;

    let variables = [
        ("PROJECT_NAME", project_name),
        ("PROJECT_EXECUTABLE", executable_name),
        ("PROJECT_EXECUTABLE_UPPERCASE", executable_name_uppercase),
        ("PROJECT_VERSION", project_version),
    ]
    .into_iter()
    .collect();

    let Some(out_dir) = env::var_os("KIT_ASSETS_GEN_DIR")
        .or_else(|| env::var_os("OUT_DIR"))
        .map(PathBuf::from)
    else {
        anyhow::bail!("KIT_ASSETS_GEN_DIR or OUT_DIR should be set for build.rs");
    };

    fs::create_dir_all(out_dir.join("assets/manual")).unwrap();
    fs::create_dir_all(out_dir.join("assets/completions")).unwrap();

    render_template(
        &variables,
        "assets/manual/kit.1.in",
        out_dir.join("assets/manual/kit.1"),
    )?;
    render_template(
        &variables,
        "assets/completions/kit.bash.in",
        out_dir.join("assets/completions/kit.bash"),
    )?;
    render_template(
        &variables,
        "assets/completions/kit.fish.in",
        out_dir.join("assets/completions/kit.fish"),
    )?;
    render_template(
        &variables,
        "assets/completions/_kit.ps1.in",
        out_dir.join("assets/completions/_kit.ps1"),
    )?;
    render_template(
        &variables,
        "assets/completions/kit.zsh.in",
        out_dir.join("assets/completions/kit.zsh"),
    )?;

    println!(
        "cargo:rustc-env=KIT_GENERATED_COMPLETION_BASH={}",
        out_dir.join("assets/completions/kit.bash").display()
    );
    println!(
        "cargo:rustc-env=KIT_GENERATED_COMPLETION_FISH={}",
        out_dir.join("assets/completions/kit.fish").display()
    );
    println!(
        "cargo:rustc-env=KIT_GENERATED_COMPLETION_PS1={}",
        out_dir.join("assets/completions/_kit.ps1").display()
    );
    println!(
        "cargo:rustc-env=KIT_GENERATED_COMPLETION_ZSH={}",
        out_dir.join("assets/completions/kit.zsh").display()
    );

    Ok(())
}
