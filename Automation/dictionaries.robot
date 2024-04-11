*** Settings ***
Library  Collections

#*** Variables ***
#&{person}  name=Jan  age=30  city=Warszawa

*** Test Cases ***
Collections - Dictionary
    ${person}  Create Dictionary  name=Jan  age=30  city=Warszawa
    Log Dictionary  ${person}
    
    ${person_name}  Get From Dictionary  ${person}  name
    Log  ${person_name}
    
    ${car}  Set Variable  Audi
    Set To Dictionary  ${person}  hobby=football  car=${car}
    Log Dictionary  ${person}

    # USUWANIE ELEMENTOW Z
    #uzycie funkcji pop do usuniecia elementu o kluczu "city" z dictionary. Wartosc zostanie przypisana do zmiennej "popped_item"
    ${popped_item}  Pop From Dictionary  ${person}  city
    log  Element o kluczu "city" zostal usuniety z dictionary. Jego wartosc to: ${popped_item}
    Log Dictionary  ${person}

    #uzycie funkcji remove do usuniecia elementu o kluczu "hobby" z dictionary. Funkcja niczego nie zwraca
    Remove From Dictionary  ${person}  hobby
    log  Element o kluczu "hobby" zostal usuniety z dictionary.
    Log Dictionary  ${person}