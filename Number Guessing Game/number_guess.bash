#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

#generate random number
RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER

#player's name
echo "Enter your username:"
read USERNAME

#query username
USER=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
#if not found
if [[ -z $USER ]]
then
  #insert new user
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  #get user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  #welcome message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  #go to game
  echo "Guess the secret number between 1 and 1000:"
else
  #get user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  #query games played
  GAMES_PLAY=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  #query best game
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  #welcome message
  echo "Welcome back, $USERNAME! You have played $(echo $GAMES_PLAY | sed -r 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -r 's/^ *| *$//g') guesses."
  #go to game
  echo "Guess the secret number between 1 and 1000:"
fi
#guessing times
i=0

GAME() {
read GUESS
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"
  GAME
elif [[ $GUESS -gt $RANDOM_NUMBER ]]
then
  echo "It's higher than that, guess again:"
  ((i=i+1))
  GAME
elif [[ $GUESS -lt $RANDOM_NUMBER ]]
then
  echo "It's lower than that, guess again:"
  ((i=i+1))
  GAME
else
  ((i=i+1))
  echo "You guessed it in $i tries. The secret number was $RANDOM_NUMBER. Nice job!"
  #write in db
  GAME_DATA=$($PSQL "INSERT INTO games(user_id,guesses,secret_number) VALUES ($USER_ID,$i,$RANDOM_NUMBER)")
fi
}

GAME