use std::fs::read_dir;
use std::process::Command; // terimal commands
use std::env;

use std::fs; // filesystem

// required kernal of type unix | windows is not supported, change commands to fix.
fn sh_command1(command:&str) {
    let output = Command::new("sh")
    .arg("-c")
    .arg(command)
    .output()
    .expect("Failed to execute command");

    println!("{}", String::from_utf8_lossy(&output.stdout));
}

fn count_bots() {
    println!("Bot Count: ")
    read_dir("/builds")
}

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 { // no parameter
        sh_command1("sh compile.sh");
        return;
    } else {
        count_bots();
    }
}