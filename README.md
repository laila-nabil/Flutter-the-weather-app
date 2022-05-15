

# The weather app

A new Flutter application.

## SETUP

### web setup

#### a) using FVM

##### first time setup
1. fvm use stable in windows powershell as admin    2. a .fvm folder is added with shortcut
    3. get full path of shortcut and add to project as flutter path instead of original path
    4. fvm flutter config --enable-web in terminal/windows powershell as admin
    5. fvm flutter create .
    6. fvm flutter run -d chrome/edge
    7. firebase init hosting
    8. build/web, single web page, not overwrite
    9. firebase deploy --only hosting
10. fvm flutter build web --dart-define api_key=key
##### run on web
fvm flutter run -d edge --dart-define api_key=key
##### reupload
fvm flutter build web --dart-define api_key=keyfirebase deploy --only hosting  *or*   firebase deploy --only hosting:flutter-weather-app
#### b) using Flutter version with web support
##### first time setup
1. flutter config --enable-web in terminal/windows powershell as admin    2. flutter create .
    3. flutter run -d chrome/edge
    4. firebase init hosting
    5. build/web, single web page, not overwrite
    6. firebase deploy --only hosting
7. flutter build web --dart-define api_key=key
##### run on web
flutter run -d edge --dart-define api_key=key
##### reupload
flutter build web --dart-define api_key=keyfirebase deploy --only hosting  *or*   firebase deploy --only hosting:flutter-weather-app
### general notes

- to add arguments but to android studio

> from main.dart menu > edit configuration > which is better than terminal for web


### TODO list
- [x] adjust UI: responsiveness
- [x] add settings screen
- [x] in settings screen: change city by location search with autocomplete
- [x] in settings screen: change language + localization
- [x] is timing correct or not?==>correct since  DateTime.fromMillisecondsSinceEpoch returns in local time
- [x] max &min sometimes disappear==> fixed
- [x] maybe make all weather one class or use inheritance
- [x] add shimmer instead of loading circle
- [x]  splash screen
- [x] icon
- [ ] Refactoring
    - [ ] Basic refactoring
        - [ ] use lib/domain/resources
            - [x] assets
            - [ ] colors
            - [ ] design parameters
            - [ ] text styles
        - [ ] Riverpod instead of provider
        - [ ] fix TODOs in WeatherProvider
        - [ ] splash screen instead of shimmer
    - [ ] full refactoring
        - [ ] UI from online designs
        - [ ] refactor WeatherProvider
- [ ] Next steps
    - [ ]  in settings screen: add multiple cities
    - [ ]  in settings screen: add multiple cities + locally store them
    - [ ] in settings screen: change unit
    - [ ] padding fixed but everything else is not
    - [ ] is history correct?!
    - [ ] Tests
    - [ ] on play store
    test 1
    test 2