fn matching(player_list: Vec<String>) {
    let mut games_passed: i128 = 0; // for looping all players
    let player_count = player_list.len();
    let max_game_count = calculate_max_rounds(player_count);

    for game in 0..max_game_count {
        if game + 1 < player_count {
            let current_indexing: usize = game; // as usize
            let player1 = &player_list[current_indexing];
            let current_indexing1: usize = current_indexing + 1;
            let player2 = &player_list[current_indexing1];
        } 
    }
}
