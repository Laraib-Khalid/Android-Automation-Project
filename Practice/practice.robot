*** Settings ***
Library    AppiumLibrary
Library    TouchKeywords.py
#Library     SwipeLibrary.py

*** Test Cases ***
Long Press Using Mobile Gesture
    Long Press Element    xpath=//android.view.ViewGroup[@content-desc="Sarah Thompson, ENT, Alpha Hospital, 1/2, 2025-06-03, B"]/android.view.ViewGroup[8]/android.view.ViewGroup
#    Tap Element     xpath=//android.view.ViewGroup[@content-desc="Sarah Thompson, ENT, Alpha Hospital, 1/2, 2025-06-03, B"]/android.view.ViewGroup[8]/android.view.ViewGroup
#
#    Tap At Coordinates    2289    448

#    Swipe Left      304     72      1952     1464
#    Sleep    10s
#    Swipe Right     304     72      1952     1464
#    Sleep    10s

#    Swipe Left By 100 Percent      1000     700     400     0

#    Swipe From    1575    800    1130    800
#    Swipe Popup     1428    709    1280    0


#     Swipe From 1428 709 To 1280 0
#    Swipe From    1575    800    1130    800
    Sleep    10s
#    Click Text    Add New
##    Swipe Right
#    Sleep    10s
