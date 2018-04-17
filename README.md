Name: Grant Lindberg
Class: CS 458: Mobile Application Development
Date: 04/23/18

Project: APOD
Description: Fetches the Astronomy Picture of the Day over HTTPS using NASA's API. This version uses my own personal API key, although it may be replaced with the demo key or one's own API key for the purposes of testing.

How to use: When the app is launched, it will fetch the picture for the current day. The user will be able to touch the "Select Date" button on the toolbar to migrate to a new view to select a date. The user can touch "Back" on the navigation bar to return to the picture of the day or the user can select a new date via the date picker. The user must touch the "Update Date" item for the app to fetch data for the new date. If the app is unable to fetch data, decode the data, or if the picture of the day is a video, the app is supposed to show a pop-up indicating the failure, although for some reason that feature broke recently for reasons unknown. So currently if there is a failure, the user will be redirected to the main view, and the previous picture will remain displayed.

NOTE: This app is built for iOS 11.3.
