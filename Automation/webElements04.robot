# RADIOBUTTONY ORAZ SELECTY

*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String
Resource  ../my_variables/empik_variables.robot

*** Test Cases ***
MyTestCase
    Open Browser  ${url}  Chrome  executable_path=${chromedriver_path}
    Maximize Browser Window
    
    Select Radio Button  radiooptions  Male
    Radio Button Should Be Set To  radiooptions  Male
    Sleep  3
    Select Radio Button  radiooptions  FeMale
    Radio Button Should Be Set To  radiooptions  FeMale
    Sleep  3

    Select From List By Value  id:Skills  Android
    List Selection Should Be  id:Skills  Android
    Sleep  3

    Select From List By Index  id:Skills  4
    List Selection Should Be  id:Skills  Android
    Sleep  3