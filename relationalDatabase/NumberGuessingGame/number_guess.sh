#!/bin/bash

# Get username
echo "Enter your username:"
read USERNAME

# Attempt to get user from databse
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"
USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME'")

# If not found: insert into database
if [[ -z $USER_INFO ]] 
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")

  # Get new info
  USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME'")
  
fi

# Welcome message with info
IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< $USER_INFO

# If best is none (havent played, should only be when you interrupt the program)
if [[ -z $BEST_GAME ]]
then
  BEST_GAME="N/A"
fi

echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# Begin the guessing game
echo -e "\nGuess the secret number between 1 and 1000:"
RANDOM_NUMBER=$(($RANDOM % 1001))

# Guessing loop
GUESSES=0
while true
do
  # Get guess
  read GUESS
  ((GUESSES++))
  
  # If not an integer, try again
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    ((GUESSES--))  # This does not count as guess
    continue
  fi

  if (( GUESS < RANDOM_NUMBER )) # Guess was too low
  then
    echo "It's higher than that, guess again:"

  elif (( GUESS > RANDOM_NUMBER ))  # Guess too high
  then
    echo "It's lower than that, guess again:"

  else  # Guess is correct!
    echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    break
  fi
done 

# Update user stats
if [[ $BEST_GAME == 'N/A' || -z $BEST_GAME ]]   # If had no record: set this game as best game
then
  BEST_GAME=$GUESSES

elif (( GUESSES < BEST_GAME))  # If user beat their record: set new best game
then
  BEST_GAME=$GUESSES
fi

# Update database
UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = $((GAMES_PLAYED + 1)), best_game = $BEST_GAME WHERE user_id = $USER_ID")
