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
