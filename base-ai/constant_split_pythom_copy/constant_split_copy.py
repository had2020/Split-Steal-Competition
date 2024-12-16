import random

def first_hand():
    """Generates a random number (0 or 1) and prints it."""
    num = random.randint(0, 1)
    print(num)

def understand_response():
    """Reads user input and returns a boolean based on the input."""
    enemy_move = input()
    return enemy_move == "0"

def turn(split):
    """Prints the next move based on the split value."""
    next_move = "1" if split else "0"
    print(next_move)
    game_loop()

def game_loop():
    """Starts a new game loop by reading the enemy's move and calling the 'turn' function."""
    enemy_move = understand_response()
    turn(enemy_move)

first_hand()
game_loop()