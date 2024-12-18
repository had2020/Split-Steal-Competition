use std::fs::read_dir;
use std::fs::remove_dir;
use std::fs::DirEntry;
use std::process::{Command, Stdio};
use std::io::{Write, BufRead, BufReader};
use std::env;

use std::fs; // filesystem

fn gamething() -> std::io::Result<()> { // TODO Replace bash code ("x"_runner) with rust!
    // Start a new shell session
    let mut child = Command::new("sh")
        .stdin(Stdio::piped())  // Allow input to the shell
        .stdout(Stdio::piped()) // Capture output from the shell
        .stderr(Stdio::piped()) // Capture errors from the shell
        .spawn()
        .expect("Failed to spawn shell");

    let mut stdin = child.stdin.take().expect("Failed to open stdin");
    let stdout = child.stdout.take().expect("Failed to open stdout");

    // Write commands to the shell
    writeln!(stdin, "echo Hello, World!")?;
    writeln!(stdin, "ls")?;
    writeln!(stdin, "pwd")?;
    writeln!(stdin, "exit")?; // Exit the shell when done

    // Read and print the output
    let reader = BufReader::new(stdout);
    for line in reader.lines() {
        println!("{}", line?);
    }

    // Wait for the shell to exit
    let status = child.wait()?;
    println!("Shell exited with status: {}", status);

    Ok(())
}

// required kernal of type unix | windows is not supported, change commands to fix.
fn sh_command1(command:&str) {
    let output = Command::new("sh")
    .arg("-c")
    .arg(command)
    .output()
    .expect("Failed to execute command");

    println!("{}", String::from_utf8_lossy(&output.stdout));
}

fn calculate_max_rounds(players:usize) -> usize{
    let number_of_pairs = players * (players - 1) / 2;
    number_of_pairs
}

fn game(player1:&String, player2:&String, gameid:usize) {
    if gameid == 1 { // only for debug
        println!("game_id: {gameid}");
        //println!("player1: {player1} , player2: {player2}"); //TODO game running 
        //let command = format!("sh match.sh {} {} {}", player1, player2, 2); // 3rd argument == rounds
        //sh_command1(&command);
        gamething();
    }
}

fn matching(player_list: Vec<String>) {
    let players = player_list;
    let player_count = players.len();

    let mut gameid:usize = 0;
    for i in 0..player_count {
        for j in (i + 1)..player_count {
            gameid+=1;
            game(&players[i], &players[j], gameid);
        }
    }
}

fn count_bots() -> std::io::Result<()> {
    let path = "../builds";

    if !std::path::Path::new(path).exists() {
        println!("Path '{}' does not exist!", path);
        return Ok(()); //exit gracefully
    }

    let entries = fs::read_dir(path)?;
    let mut contestant_count: i128 = 0_i128;

    //let mut contestant_list: Vec<DirEntry> = Vec::new();
    let mut contestant_list: Vec<String> = Vec::new();

    println!("Entries under ../builds 👇");
    for entry in entries {
        let entry1 = entry?;
        println!("{}", entry1.path().display());
        contestant_list.push(entry1.path().display().to_string());
        contestant_count+=1;
    }

    println!("contestants 🤖: {}", contestant_count);
    matching(contestant_list);
    Ok(())
}

fn clean_builds() {
    sh_command1("sh clean.sh");
    println!("Builds cleaned 🧹");
}

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 { // no parameter
        //sh_command1("sh gather.sh");
        //println!("start by running gather.sh with root access");
        //println!("no parameter");
        sh_command1("sh no_par.sh");
        return;
    } else {
        count_bots();
        //clean_builds(); TODO in other section!
    }
}