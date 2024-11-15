use std::io::Split;

use rand::prelude::*;
use text_io::read;

// split = 0, steal 1

fn random_turn() {
    let mut rng = rand::thread_rng();
    let num: u8 = rng.gen_range(0..1); // generates a random u8 between 0 and 1
    println!("{num}");
    fake_listen();
}

fn fake_listen() {
    let input: String = read!();
    random_turn();
}

fn main() {
    random_turn();
}