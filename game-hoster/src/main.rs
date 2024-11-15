
// for other terimal apps to interact with this code, as well as commands for browsing filesystem.
use std::io::{BufReader, BufWriter, BufRead, Write};
use std::process::{Command, Stdio};

// for filesystem logic
use std::fs;

fn game_loop() {
    // Create a new process
    let mut child = Command::new("path/to/your/exe")
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .spawn()
        .expect("Failed to spawn process");

    // Get handles to stdin and stdout
    let mut stdin = child.stdin.take().expect("Failed to get stdin");
    let mut stdout = child.stdout.take().expect("Failed to get stdout");

    // Create buffered reader and writer
    let mut reader = BufReader::new(stdout);
    let mut writer = BufWriter::new(stdin);

    // Read line from stdout
    let mut line = String::new();
    reader.read_line(&mut line).expect("Failed to read line");
    println!("Output: {}", line.trim());

    // Write line to stdin
    writer.write_all(b"input\n").expect("Failed to write to stdin");
    writer.flush().expect("Failed to flush stdin");

    // Continuously read and write
    loop {
        line.clear();
        reader.read_line(&mut line).expect("Failed to read line");
        println!("Output: {}", line.trim());

        // Check if the process has finished
        if line.is_empty() {
            break;
        }

        // Write next input
        print!("Enter input: ");
        let mut input = String::new();
        std::io::stdin().read_line(&mut input).expect("Failed to read input");
        writer.write_all(input.as_bytes()).expect("Failed to write to stdin");
        writer.flush().expect("Failed to flush stdin");
    }
}

// required kernal of type unix | windows is not supported, change commands to fix.
// required tools to compile code, rustc, g++, and rustpython
fn gather_bots() {

    /* 
    Command::new("ls")
    .current_dir("/bin")
    .spawn()
    .expect("ls command failed to start");
    */

    let base_ai_path = "/Users/hadrian/Developer/Github Repos/Split-Steal-Competition/base-ai";
    let paths = fs::read_dir("{base_ai_path}").unwrap();
    for path in paths {
        println!("{:?}", path);
        let child_path = path;
        let childs_child_paths = fs::read_dir("{child_path}").unwrap();
    }
}

// 0 = split, 1 = steal
fn main() {
    println!("setting up games");
    gather_bots();
}