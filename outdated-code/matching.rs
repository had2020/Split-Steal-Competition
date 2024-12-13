fn run_matchmaking_system(list: &[Player], games: usize, rounds: usize) {
    let mut current_game = 0;

    for game in 1..=games {
        current_game += 1;
        println!("Ran Game Number: {}", game);

        // Who is playing
        for session in 0..current_game {
            if session + 1 < list.len() {
                let first_player = &list[session];
                let second_player = &list[session + 1];

                println!(
                    "Match: {} vs {}",
                    first_player.path().display(),
                    second_player.path().display()
                );

                // Rounds
                for round in 1..=rounds {
                    println!("Running round {}...", round);
                    game_round(first_player, second_player);
                }
            } else {
                println!("Not enough players for session {}", session);
            }
        }
    }
}
