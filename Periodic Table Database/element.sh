#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    if [[ -z $ELEMENT ]]
    then
      echo "I could not find that element in the database."
    else
      echo $ELEMENT | while read AN BAR NAME BAR SYM BAR TYPE BAR AM BAR MP BAR BP BAR
      do
        echo "The element with atomic number $AN is $NAME ($SYM). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
      done
    fi
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
    if [[ -z $ELEMENT ]]
    then
      echo "I could not find that element in the database."
    else  
      echo $ELEMENT | while read AN BAR NAME BAR SYM BAR TYPE BAR AM BAR MP BAR BP BAR
      do
        echo "The element with atomic number $AN is $NAME ($SYM). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
      done
    fi
  else
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
    if [[ -z $ELEMENT ]]
    then
      echo "I could not find that element in the database."
    else  
      echo $ELEMENT | while read AN BAR NAME BAR SYM BAR TYPE BAR AM BAR MP BAR BP BAR
      do
        echo "The element with atomic number $AN is $NAME ($SYM). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
      done
    fi  
  fi
fi
