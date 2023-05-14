*** Settings ***
Documentation   The Tests Robot
Resource        ../keywords/keywords.robot
Test Teardown   Close Browser
Test Template   Test the login form with data


*** Variables ***
${VALID USER}        maria
${VALID PASSWORD}    thoushallnotpass


*** Keywords ***
Test the login form with data
    [Arguments]    ${username}    ${password}    ${expected}
    Open a website
    Login with credentials    ${username}    ${password}
    Run Keyword And Continue On Failure    Page Should Contain    ${expected}


*** Test Cases ***
Valid case to try                 ${VALID USER}    ${VALID PASSWORD}    First name
Invalid User Name                 invalid          ${VALID PASSWORD}    Invalid username or password
Invalid Password                  ${VALID USER}    invalid              Invalid username or password
Invalid User Name and Password    invalid          invalid              Invalid username or password
Empty User Name                   ${EMPTY}         ${VALID PASSWORD}    Invalid username or password
Empty Password                    ${VALID USER}    ${EMPTY}             Invalid username or password
Empty User Name and Password      ${EMPTY}         ${EMPTY}             Invalid username or password
