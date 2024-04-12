# PRZELACZANIE SIE MIEDZY KARTAMI ORAZ BIBLIOTEKA STRING

*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String
#Resource  ../my_keywords/empik_keywords.robot
Resource  ../my_variables/empik_variables.robot

*** Test Cases ***
Test
    Open Browser  ${google_url}  Chrome  executable_path=c:/chromedriver/chromedriver.exe
    Click Button  id:W0wltc
    ${google_title}  Get Title
    log  ${google_title}

    # otwieranie nowej karty w przegladarce
    Execute Javascript  window.open('')

    # przejscie do nowej karty
    Switch Window  title=undefined

    # otwarcie strony w nowej karcie
    Go To  ${wikipedia_url}
    Sleep  2

    ${elements}  Get Text  id:main-page-portals
    log  ${elements}

    # inicjujemy nowa liste i przypisujemy jej wartosci po podziale Stringa
    @{elements_list}  Split String  ${elements}  •
    Log List  ${elements_list}
    ${first}  Get From List  ${elements_list}  0
    log  ${first}

    # wracamy na karte google.com
    Switch Window  title=${google_title}
    Sleep  2
