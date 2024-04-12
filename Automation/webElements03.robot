# ZWRACANIE WARTOSCI Z NAPISANYCH KEYWORDOW ORAZ ZAKRES ZMIENNYCH

*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String
Resource  ../my_keywords/empik_keywords.robot
Resource  ../my_variables/empik_variables.robot


*** Test Cases ***
Test
    Open Browser  ${google_url}  Chrome  executable_path=c:/chromedriver/chromedriver.exe
    Click Button  id:W0wltc
    ${google_title}  Get Title

    Execute Javascript  window.open('')
    Switch Window  title=undefined
    Go To  ${wikipedia_url}
    Sleep  2
    # przypisujemy zwracany element ${first} do zmiennej ${my_first_element}
    ${my_first_element}  RETURN_FIRST_ELEMENT  main-page-portals  •
    # zmienna ${my_first_element} jest widoczna tylko w tym test case
    log  ${my_first_element}
    # przypisujemy ${my_first_element} jako zmienna globalna i jest widoczna w innych test cases
    Set Global Variable  ${my_first_element}

Test2
    # korzystamy ze zmiennej globalnej
    log  ${my_first_element}
