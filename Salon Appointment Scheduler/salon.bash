#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALOON! ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #get services list:
  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  # if not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
      SELECT_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      #if service is not in the list
      if [[ -z $SELECT_SERVICE_NAME ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?"
      else
        APPOINTMENT_MENU
      fi
  fi  
  
}

APPOINTMENT_MENU() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  #if not found
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert into db
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  #get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  #set new appointment
  echo -e "What time would you like your $SELECT_SERVICE_NAME, $CUSTOMER_NAME"
  read SERVICE_TIME
  echo "$SERVICE_TIME"
  NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time,customer_id,service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID,$SERVICE_ID_SELECTED)")
  echo -e "\nI have put you down for a $SELECT_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
