/// A simple program that prints its own source code using the kit library
use kit::PrettyPrinter;

fn main() {
    PrettyPrinter::new().input_file(file!()).print().unwrap();
}
