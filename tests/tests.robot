
*** Settings ***
Documentation   The Tests Robot
Resource        ../keywords/keywords.robot
Test Teardown   Close Browser


*** Test Cases ***
Test login with correct credentials
    Open a website
    Log in
    Run Keyword And Continue On Failure    Verify the username    maria
 