# PORZADKOWANIE KODU
# keywords i variables w oddzielnych plikach w folderach

*** Settings ***
Library  SeleniumLibrary
Test Setup  Open Wikipedia
# dla pewnosci mozna podac sciezke: Test Setup  wikipedia_keywords.Open Wikipedia
Test Teardown  Close Browser
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

MyThirdTest
    [Documentation]  My second test - incorrect password
    Incorrect Log In Wikipedia  RobotTests
    Capture Page Screenshot  ${project_path}/screenshot3.png