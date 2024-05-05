#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -c"

# Welcome message
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  # If argument: print argument as startup message 
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    # Main menu startup message
    echo "Welcome to My Salon, how can I help you?"
  fi

  # List of services to choose
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Get service from reading service_id
  read SERVICE_ID_SELECTED
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # If service id not found; return to main menu
  if [[ -z $SERVICE_NAME_SELECTED ]] 
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi


  # Get customer by reading phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If customer found; create new customer
  if [[ -z $CUSTOMER_NAME ]] 
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CREATE_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  fi

  # Also get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone = '$CUSTOMER_PHONE';")

  # Get time for appointment by reading, strip leading spaces
  echo -e "\nWhat time would you like your $(echo ${SERVICE_NAME_SELECTED,,} | sed -E 's/^ *|$ *//g'), $(echo $CUSTOMER_NAME | sed -E 's/^ *|$ *//g')?"
  read SERVICE_TIME

  # Insert new appointment into table appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

  # Result message and return
  if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]] 
  then
    echo -e "\nI have put you down for a $(echo ${SERVICE_NAME_SELECTED,,} | sed -E 's/^ *|$ *//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *|$ *//g')."
  fi
}



MAIN_MENU 
