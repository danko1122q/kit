#[macro_export]
macro_rules! kit_warning {
    ($($arg:tt)*) => ({
        use nu_ansi_term::Color::Yellow;
        eprintln!("{}: {}", Yellow.paint("[kit warning]"), format!($($arg)*));
    })
}
