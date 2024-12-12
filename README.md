


# Objective

Create a flutter app to load user's current location on map with and without device location feature.

## Installation

To execute this project you must have:

```bash
  Flutter version 3.22.3
  Emulador/Device IOS or Android
```

## How does the app behave?

When you open the app, it will immediately try to ask for permission to search your current location. If granted, the app will show the map with an indicator that would be your current position.

If you decline permission, the app will call the https://ip-api.com/docs/api:json API and display the location closest to you.

## Offline mode

If the app runs in offline mode it will ask for the device's location, if granted it will create the marker with its current position on the map but the map itself will not be shown as it needs internet to download the layers.

If you refuse to allow GPS access the first time, the app will show an error screen as it tried to make an API call, after which you will have a try again button, if you tap it it will ask for permission again.

This app has not been used to check whether the network is active or not, as in any case the map will not be displayed if it is in airplane mode.


## Screenshots

![Screenrecorder-2024-12-13-01-05-01-448-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/c51b14f8-fadf-4b16-842d-faf8fbd0cf6f)


