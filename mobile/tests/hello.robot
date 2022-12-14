*** Settings ***
Documentation        Exemplo Robot + Appium

Library    AppiumLibrary

*** Test Cases ***
Deve abrir o app SmartBit
    Open Application    http://localhost:4723/wd/hub
    ...                 alias=SmartBit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Simulator
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true          