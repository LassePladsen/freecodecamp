#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


# If no argument; print help message and return
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."

else
  # If argument is a number: attempt to get argument as atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_INFO=$($PSQL "SELECT * FROM elements FULL JOIN properties USING (atomic_number) WHERE atomic_number = $1;")
  
  else
    # If not a number: first attempt to get info from argument as atomic name
    ATOMIC_INFO=$($PSQL "SELECT * FROM elements FULL JOIN properties USING (atomic_number) WHERE name = '$1';")

      # If not found; attempt to get info from argument as atomic symbol
    if [[ -z $ATOMIC_INFO ]] 
    then
      ATOMIC_INFO=$($PSQL "SELECT * FROM elements FULL JOIN properties USING (atomic_number) WHERE symbol = '$1';")
    fi
  fi

  # If found: echo the info and quit.
  if [[ -n $ATOMIC_INFO ]]
  then
    # Process into separate variables
    IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID <<< $ATOMIC_INFO

    # Get type from type_id
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
    
    # If all info and type name found: echo info
    if [[ -n $TYPE ]]
    then
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    fi
    
  else
    # If empty, was never found: Echo warning
    echo "I could not find that element in the database."
  fi
fi