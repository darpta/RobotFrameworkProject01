*** Settings ***
Library  SeleniumLibrary
# wykonanie na poczatku testu
Test Setup  Open Wikipedia
# wykonanie na koncu testu
Test Teardown  Close Browser
# zbiorczy plik z ustawieniami
Resource  resource.robot

*** Variables ***
${project_path}  C:/Users/Dario/PycharmProjects/RobotFrameworkProject01/screeny
${error_message}  Podany login lub hasło są nieprawidłowe. Spróbuj jeszcze raz.

*** Keywords ***
Open Wikipedia
    Open Browser  https://pl.wikipedia.org  Chrome  executable_path=c:/chromedriver/chromedriver.exe

Log In Wikipedia
    [Arguments]  ${login}  ${password}
    #Open Browser  https://pl.wikipedia.org  Chrome  executable_path=c:/chromedriver/chromedriver.exe
    #otwiera browser z TestSetup
    Click Element  id:pt-login-2
    ${my_value}=  Get Text  id:wpName1
    Should Be Empty   ${my_value}
    Checkbox Should Not Be Selected  name:wpRemember
    Input Text  id:wpName1  ${login}
    Input Password  id:wpPassword1  ${password}
    Select Checkbox  name:wpRemember
    Click Button  id:wpLoginAttempt

Incorrect Log In Wikipedia
    [Documentation]  Check the error message - incorrect password
    [Arguments]  ${login}
    #Open Browser  https://pl.wikipedia.org  Chrome  executable_path=c:/chromedriver/chromedriver.exe
    Click Element  id:pt-login-2
    ${my_value}=  Get Text  id:wpName1
    Should Be Empty   ${my_value}
    Checkbox Should Not Be Selected  name:wpRemember
    Input Text  id:wpName1  ${login}
    Input Password  id:wpPassword1  123123
    Select Checkbox  name:wpRemember
    Click Button  id:wpLoginAttempt
    Wait Until Element Is Visible  class:cdx-message__content  timeout=7
    ${my_error_message}  Get Text  class:cdx-message__content
    Should Be Equal As Strings  ${my_error_message}  ${error_message}

*** Test Cases ***
MyFirstTest
    [Documentation]  My first test
    Log In Wikipedia  ${wikipedia_login}  ${wikipedia_password}
    #Search Wikipedia  Adam Małysz
    Capture Page Screenshot  ${project_path}/screenshot.png


MySecondTest
    [Documentation]  My second test - incorrect password
    #Incorrect Log In Wikipedia  RobotTests
    #Search Wikipedia  Gladiator
    Capture Page Screenshot  ${project_path}/screenshot2.png

# Run Keyword And Ignore Error - ostroznie mozna przegapic bledy