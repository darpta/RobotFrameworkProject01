# RAPORTY I 
# WLASNA BIBLIOTEKA - utworzyc folder, w nim plik np. "MyLibrary.py"
# w pliku utworzyc klase i w niej metode, dodac znaczniki @library i @keyword
# zaimportowac biblioteke

# ${chromedriver_path}  /Users/mac_owner/Desktop/chromedriver/chromedriver.exe

*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String
Library  ../my_library/MyLibrary.py
# .. WYJSCIE WYZEJ W FOLDERACH
Resource  ../my_variables/empik_variables.robot

*** Test Cases ***
MyTestCase1
    [Tags]  group 1  tag 1
    [Documentation]  Moja dokumentacja TestCase1
    Open Browser  ${url}  Chrome  executable_path=${chromedriver_path}
    Wylosuj Date Wypisz Argument  poniedzialek
    Set Test Message  TestCase 1

#MyTestCase2
#    [Tags]  group 1  tag 2
#    [Documentation]  Moja dokumentacja TestCase2
#    Open Browser  ${url}  Chrome  executable_path=${chromedriver_path}
#    Set Test Message  TestCase 2
#
#MyTestCase3
#    [Tags]  group 2  tag 3
#    [Documentation]  Moja dokumentacja TestCase3
#    Open Browser  ${url}  Chrome  executable_path=${chromedriver_path}
#    Set Test Message  TestCase 3
#
#MyTestCase4
#    [Tags]  group 3  tag 4
#    [Documentation]  Moja dokumentacja TestCase4
#    Open Browser  ${url}  Chrome  executable_path=${chromedriver_path}
#    Set Test Message  TestCase 4