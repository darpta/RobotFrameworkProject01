*** Settings ***
Library  Collections

*** Variables ***
@{my_list}  1  2  3  3  5

*** Test Cases ***
Collections - List
#odnosimy sie do listy wiec jest @{}
    FOR  ${name}  IN  @{my_list}
        log  ${name}
    END

    Append To List  ${my_list}  6  wyraz
    Log List  ${my_list}
    
    @{my_list}  Remove Duplicates  ${my_list}
    Log List  ${my_list}
    
    Remove From List  ${my_list}  1
    Log List  ${my_list}

    Remove Values From List  ${my_list}  2  3
    Log List  ${my_list}

    Append To List  ${my_list}  7
    Log List  ${my_list}

    List Should Contain Value  ${my_list}  7