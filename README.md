# Wordle in the Terminal

This is a terminal-based version of the popular game Wordle.
I built this for fun, coded with my hands before the vibe code apocalypse.
I tried to keep it clean.

## How to Play

1. Run the `wordle.rb` file from your terminal.
2. Guess a five-letter word. The game will indicate which letters are correct and in the correct position (green), correct but in the wrong position (yellow), or not in the word at all (white).
3. You have 6 attempts to guess the word.

## Installation

1. Clone this repository:
   `git clone https://github.com/your-username/Wordle-in-the-Terminal.git`
2. Navigate to the project directory:
   `cd Wordle-in-the-Terminal`
3. Install the required gems (if you don't have `bundler` installed, run `gem install bundler` first):
   `bundle install`

## Usage

To start a new game with a random word:
`ruby wordle.rb`

To start a new game with a specific word (for testing or playing with a friend):
`ruby wordle.rb [your_five_letter_word]`

## Project Structure

- `wordle.rb`: The main game logic.
- `lexicon.rb`: Handles word selection and validation using `words.txt`.
- `words.txt`: A list of valid five-letter words.
- `Gemfile`: Lists the Ruby gems required for the project (`colorize`).

## Contributing

Feel free to fork this repository and submit pull requests.
