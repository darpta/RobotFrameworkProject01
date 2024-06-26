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
    Search Wikipedia  Adam Małysz
    Capture Page Screenshot  ${project_path}/screenshot.png


MySecondTest
    [Documentation]  My second test - incorrect password
    Search Wikipedia  Gladiator
    Capture Page Screenshot  ${project_path}/screenshot2.png

# Run Keyword And Ignore Error - ostroznie mozna przegapic bledy