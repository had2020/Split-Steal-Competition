use std::fs::read_dir;
use std::fs::remove_dir;
use std::fs::DirEntry;
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

fn game_round(){
    sh_command1("ls");
}

fn matchmaking(contestants:i128, list:Vec<DirEntry>) {
    let games: i128;
    games = contestants * 2;
    let rounds = 10;
    let mut current_game: i128 = 0;

    // sessions
    let mut first_player: &DirEntry;
    let mut second_player: &DirEntry;

    // games
    for game in 1..=games {
        current_game+=1;
        println!("Ran Game Number: {}", game);
        // who is playing
        for session in 1..current_game {
            first_player = &list[session as usize];
            let session1:i128 = session + 1_i128;
            second_player = &list[session1 as usize];
        }

        println!("{}", first_player.path().display());

        // rounds
        for round in 1..=rounds{
            game_round();
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

    let mut contestant_list: Vec<DirEntry> = Vec::new();

    println!("Entries under ../builds 👇");
    for entry in entries {
        let entry1 = entry?;
        println!("{}", entry1.path().display());
        contestant_list.push(entry1);
        contestant_count+=1;
    }

    println!("contestants: {}", contestant_count);
    matchmaking(contestant_count, contestant_list);
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
        println!("no parameter");
        sh_command1("sh no_par.sh");
        return;
    } else {
        count_bots();
        //clean_builds(); TODO in other section!
    }
}