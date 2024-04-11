*** Variables ***
@{my_list}  Adam  Rafal  Ewa  Joanna

*** Test Cases ***
For Loop
    # wersja deklaracji listy w test case (widoczna tylko dla tego test case)
    #@{my_list}  Create List  Adam  Rafal  Ewa  Joanna
    FOR  ${name}  IN  @{my_list}
        log  ${name}
    END

While Loop
    ${index}  Set Variable  10
    
    WHILE  ${index} > 0
        log  ${index}
        ${index}  Evaluate  ${index} - 1
    END

