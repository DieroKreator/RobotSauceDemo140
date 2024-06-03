# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command
 
*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application
 
*** Test Cases ***
Selecionar Mochila
    Open Application    http://ondemand.us-west-1.saucelabs.com:80/wd/hub    platformName=Android    appium:platformVersion=9.0    appium:deviceName=Samsung Galaxy S9 FHD GoogleAPI Emulator    appium:deviceOrientation=portrait    appium:app=storage:filename=mda-2.0.1-22.apk    appium:appPackage=com.saucelabs.mydemoapp.android    appium:appActivity=com.saucelabs.mydemoapp.android.view.activities.SplashActivity    browserName=    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    sauce:options=[object Object]    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}
    ${el1} =    Set Variable     xpath=//android.widget.ImageView[@content-desc="Sauce Labs Backpack"]
    Click Element    ${el1}
    @{finger} =    Create List    ${514}    ${1846}
    @{positions} =    Create List    ${finger}
    Tap With Positions    ${100}    ${positions}
    Swipe    ${470}    ${1876}    ${457}    ${1624}
    ${el2} =    Set Variable     xpath=//android.widget.Button[@content-desc="Tap to add product to cart"]
    Click Element    ${el2}
    ${el3} =    Set Variable     xpath=//android.widget.RelativeLayout[@content-desc="Displays number of items in your cart"]/android.widget.ImageView
    Click Element    ${el3}
    ${el4} =    Set Variable     xpath=//android.widget.TextView[@resource-id="com.saucelabs.mydemoapp.android:id/titleTV"]
    Click Element    ${el4}
    ${el5} =    Set Variable     id=com.saucelabs.mydemoapp.android:id/priceTV
    Click Element    ${el5}