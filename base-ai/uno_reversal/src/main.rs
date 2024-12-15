use std::io::Split;

use rand::prelude::*;
use text_io::read;

// split = 0, steal 1

fn first_hand() {
    /* // Basic IO
    println!("first Y/N:");
    let input: String = read!();
    println!("entered: {}", input.trim()); 
    */
    let mut rng = rand::thread_rng();
    let num: u8 = rng.gen_range(0..1); // generates a random u8 between 0 and 1
    println!("{num}")
}

fn understand_response() -> bool {
    let enemy_move: String = read!();
    let mut split: bool;
    if enemy_move == "0" {
        split = true;
    } else {
        split = false
    }
    split
}

fn turn(split:bool){
    let mut next_move: &str;
    if split {
        next_move = "1";
    } else {
        next_move = "0";
    }

    println!("{next_move}");

    game_loop();
}

fn game_loop() {
    let enemy_move = understand_response();
    turn(enemy_move);
}

fn main() {
    first_hand();
    game_loop();
}
