*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://automationexercise.com
${BROWSER}    Chrome
${NAME}    Test User
${EMAIL}    testuser@example.com
${SUBJECT}    Test Subject
${MESSAGE}    This is a test message.
${FILE_PATH}    C:/Users/yodsa/Documents/testfile.txt

*** Test Cases ***
Contact Us Form Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    AutomationExercise    timeout=20s

    Click Link    Contact us
    Sleep    3s
    Wait Until Element Is Visible    xpath=//h2[translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='get in touch']    timeout=20s

    Input Text    name=name    ${NAME}
    Input Text    name=email    ${EMAIL}
    Input Text    name=subject    ${SUBJECT}
    Input Text    name=message    ${MESSAGE}
    Choose File    name=upload_file    ${FILE_PATH}

    # เลื่อนหน้าจอไปที่ปุ่มก่อนกด
    Scroll Element Into View    xpath=//input[@type='submit']
    Sleep    2s
    Wait Until Element Is Enabled    xpath=//input[@type='submit']    timeout=10s
    Click Button    xpath=//input[@type='submit']

    Handle Alert    accept
    Wait Until Page Contains    Success! Your details have been submitted successfully.    timeout=10s

    Click Link    Home
    Wait Until Page Contains    AutomationExercise    timeout=10s

    Close Browser