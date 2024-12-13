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

fn calculate_max_rounds(players:usize) -> usize{
    let number_of_pairs = players * (players - 1) / 2;
    number_of_pairs
}

fn game1(player1:&String, player2:&String) {
    println!("player1: {player1} , player2: {player2}");
}

fn matching(player_list: Vec<String>) {
    let mut players = player_list;
    //let mut games_passed: i128 = 0; // for looping all players
    let player_count = players.len();
    let max_game_count = calculate_max_rounds(player_count);// * 2; // times two fixes formula?
    let mut adjustment:usize = 0;

    for game in 0..max_game_count {
        if game + 1 < player_count + adjustment{
            let current_indexing: usize = game - adjustment; // as usize
            if let Some(player1) = players.get(current_indexing) {
                let current_indexing1: usize = current_indexing + 1;
        
                if let Some(player2) = players.get(current_indexing1) {
                    //println!("Player1: {:?}, Player2: {:?}", player1, player2);
                    game1(player1, player2);
                } else {
                    println!("index out of bound player2");
                }
            } else {
                println!("index out of bound player1");
            }
        } else {
            //println!("out of players on loop");
            adjustment+=player_count;
            
            // reordering
            for player in 0..players.len() {
                let index = players[player].clone();
                players.remove(player);
                players.push(index.to_string());
                //println!("{index}");
            }
        }
    }

    // the games are over!
    //clean_builds();
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
        println!("no parameter");
        sh_command1("sh no_par.sh");
        return;
    } else {
        count_bots();
        //clean_builds(); TODO in other section!
    }
}