#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Empty database
($PSQL "TRUNCATE TABLE games, teams;")


# Loop over lines in games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
  # Skip first header line
  if [[ $YEAR == "year" ]]; then 
    continue
  fi

  # Insert winner into table teams, if it doesn't already exist:
  WINNER_ID=$($PSQL "SELECT team_id FROM teams where name = '$WINNER';")
  if [[ -z $WINNER_ID ]]; then
    WINNER_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER');")"
    WINNER_ID=$($PSQL "SELECT team_id FROM teams where name = '$WINNER';")

    # Print insertion
    if [[ $WINNER_RESULT == "INSERT 0 1" ]]; then
      echo -e "\nInserted name into table teams: $WINNER"
    fi
  fi

  # Insert opponent into table teams, if it doesn't already exist:
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams where name = '$OPPONENT';")
  if [[ -z $OPPONENT_ID ]]; then
    OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT');")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams where name = '$OPPONENT';")

    # Print insertion
    if [[ $OPPONENT_RESULT == "INSERT 0 1" ]]; then
      echo -e "\nInserted name into table teams: $OPPONENT"
    fi
  fi

  # Add this game into table games
  GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES ($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID);")

  # Print insertion
    if [[ $GAME_RESULT == "INSERT 0 1" ]]; then
      echo -e "\nInserted game into table games: $YEAR, $ROUND, $WINNER ($WINNER_ID), $OPPONENT ($OPPONENT_ID), $WINNER_GOALS, $OPPONENT_GOALS"
    fi


done