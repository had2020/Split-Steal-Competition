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