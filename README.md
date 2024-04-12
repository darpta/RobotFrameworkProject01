

## Commands
 
- run test - one file  
  `robot .\Automation\sekcja501.robot`
- run tests with tag 1  
  `robot --include "tag 1" .`
- run one specified test  
  `robot -t "MyTestCase1" .`
- run all tests - one after one  
  `robot .`
- run all tests in the same time (pabot)  
  `pabot .`
- run all tests with tag 1 in the same time (pabot)  
  `pabot --include "tag 1" .`
- robot help  
  `robot --help`

## pabot for parallel testing

- install pabot (https://pabot.org/)  
  `pip install -U robotframework-pabot`  
  or install Interpreter in PyCharm

## API testing - RequestsLibrary

- install RequestsLibrary  
  `pip install robotframework-requests`