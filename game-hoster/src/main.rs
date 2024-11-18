
// for other terimal apps to interact with this code, as well as commands for browsing filesystem.
use std::io::{BufReader, BufWriter, BufRead, Write};
use std::process::{Command, Stdio};

// for filesystem logic
use std::fs;

// required kernal of type unix | windows is not supported, change commands to fix.
// required tools to compile code, rustc, g++, and rustpython
fn gather_bots() -> std::io::Result<()> {

    /* 
    Command::new("ls")
    .current_dir("/bin")
    .spawn()
    .expect("ls command failed to start");
    */
    let base_ai_path = "/Users/hadrian/Developer/Github Repos/Split-Steal-Competition/base-ai";
    for entry in fs::read_dir(base_ai_path)? {
        let entry = entry?;
        println!("{:?}", entry);
        for child in fs::read_dir(entry.path())? {
            let child = child?;
            println!("{:?}", child);
        }
    }
    Ok(())
}

// 0 = split, 1 = steal
fn main() {
    println!("setting up games");
    gather_bots();
}