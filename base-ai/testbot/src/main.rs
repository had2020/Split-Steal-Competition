use std::io::{self, Write};
use rand::prelude::*;
use text_io::read;

// split = 0, steal 1

fn first_hand() {
    let mut rng = rand::thread_rng();
    let num: u8 = rng.gen_range(0..=1); // generates a random u8 between 0 and 1
    println!("{num}");
}

fn understand_response() -> bool {
    print!("Enter your move (0 for Split, 1 for Steal): ");
    io::stdout().flush().unwrap(); // Ensure the prompt is printed before reading input
    let enemy_move: String = read!();
    enemy_move == "0"
}

fn turn(split: bool) {
    let next_move = if split { "1" } else { "0" };
    println!("Next move: {next_move}");
}

fn main() {
    first_hand();
    let enemy_move = understand_response();
    turn(enemy_move);
}
