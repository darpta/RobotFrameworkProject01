*** Settings ***
Library  SeleniumLibrary
# wykonanie na poczatku testu
Test Setup  Open Wikipedia
# wykonanie na koncu testu
Test Teardown  Close Browser
# zbiorczy plik z ustawieniami
Resource  ../my_keywords/wikipedia_keywords.robot
Resource  ../my_variables/wikipedia_variables.robot

*** Test Cases ***
MyFirstTest
    [Documentation]  My first test
    Log In Wikipedia  ${wikipedia_login}  ${wikipedia_password}

MySecondTest
    [Documentation]  My second test - incorrect password
    Incorrect Log In Wikipedia  RobotTests


# Run Keyword And Ignore Error - ostroznie mozna przegapic bledy