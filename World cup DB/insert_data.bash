#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")

#insert winners
cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_G OPP_G
do
  if [[ $YEAR != 'year' ]]
  then
    #get team id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
    #if not found
    if [[ -z $TEAM_ID ]]
    then
      #insert team
      echo $($PSQL "INSERT INTO teams(name) VALUES ('$WIN')")
    fi
  fi
done

#insert opponents
cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_G OPP_G
do
  if [[ $YEAR != 'year' ]]
  then
    #get team id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
    #if not found
    if [[ -z $TEAM_ID ]]
    then
      #insert team
      echo $($PSQL "INSERT INTO teams(name) VALUES ('$OPP')")
    fi
  fi
done

#insert games
cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_G OPP_G
do
  #get win id
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
  #get opp id
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP'")
  #write game
  echo $($PSQL "INSERT INTO games(winner_id, opponent_id, year, round, winner_goals, opponent_goals) VALUES($WIN_ID, $OPP_ID, $YEAR, '$ROUND', $WIN_G, $OPP_G)")
done