
*** Settings ***
Documentation   The Tasks Robot
Resource        ../keywords/keywords.robot
Task Teardown   Close Browser


*** Tasks ***
#Download the latest Excel file and override the existing one
    #Download the excel file

Insert the sales data for the week and export it as a PDF
    Open a website
    Log in
    Fill The Form Using The Data From The Excel File
    Collect the results                # Screenshot of the results
    Export The Table As A PDF          # PDF with the results

Print an end message
    Log    That robot ran successfully
