# The Compare weather app

![image](readme_assets\image1.jpeg)

The Flutter Weather App is an open source project built using the Flutter framework. It provides users with real-time weather information for any location in the world. The main features of the app include comparing today's weather to yesterday, location-based weather information, and hourly and daily forecasts.

## Installation Instructions

To run the code of the Flutter Weather App, follow these steps:

1. Make sure you have Flutter 3.10 installed. If not, refer to the official Flutter documentation for installation instructions.
2. Install an IDE such as Android Studio.
3. Clone the project repository from GitHub.
4. Open the project in Android Studio or your preferred IDE.
5. Install the necessary dependencies by running the following command:
   ```
   flutter pub get
   ```
6. Obtain an API key for Geoapify API. You can sign up for a free account on the Geoapify website to get the API key.
7. Run the app using the following command, replacing `YOURAPIKEYHERE` with your actual Geoapify API key:
   ```
   flutter run --dart-define geoapifyApiKey=YOURAPIKEYHERE
   ```
   This command will launch the app on your connected device or emulator.

Alternatively, you can use the deployed version of the app:
- Web app: [https://flutter-weather-app.web.app](https://flutter-weather-app.web.app) 
- Google play: [https://play.google.com/store/apps/details?id=com.lailanabil.the_weather_app](https://play.google.com/store/apps/details?id=com.lailanabil.the_weather_app).


## Bug Reporting and Feature Requests

If you encounter any bugs or have any feature requests, you can create an issue in the project's GitHub repository or contact the developer directly through [my Twitter account](https://twitter.com/laila_nabil_/).





To include the packages used, the architecture based on Reso Coder's clean architecture, and the use of icons from the Flaticon website in your README, you can add the following sections:

## Packages Used

The app utilizes several packages to enhance its functionality. These packages include:

| Package | Description |
|---------|-------------|
| [http](https://pub.dev/packages/http) | A composable, Future-based library for making HTTP requests in Flutter. |
| [scrollable_positioned_list](https://pub.dev/packages/scrollable_positioned_list) | A Flutter package that provides a scrollable positioned list, where the position of each item can be controlled. |
| [auto_size_text](https://pub.dev/packages/auto_size_text) | Flutter widget that automatically resizes text to fit perfectly within its bounds. |
| [carousel_slider](https://pub.dev/packages/carousel_slider) | A carousel slider widget for Flutter. |
| [geolocator](https://pub.dev/packages/geolocator) | A Flutter geolocation plugin for Android, iOS, and the web. |
| [flutter_mapbox_autocomplete](https://pub.dev/packages/flutter_mapbox_autocomplete) | A Flutter package that provides an autocomplete search box using the Mapbox Geocoding API. |
| [easy_localization](https://pub.dev/packages/easy_localization) | A Flutter package for easy localization of your app. |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | Flutter plugin for reading and writing simple key-value pairs. |
| [dartz](https://pub.dev/packages/dartz) | A library for building applications in a functional programming style. |
| [equatable](https://pub.dev/packages/equatable) | A Dart package that helps to implement equality without needing to explicitly override == and hashCode. |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | Flutter package that helps implement the BLoC (Business Logic Component) design pattern. |
| [get_it](https://pub.dev/packages/get_it) | A simple service locator for Dart and Flutter projects. |
| [firebase_analytics](https://pub.dev/packages/firebase_analytics) | Flutter plugin for Google Analytics for Firebase. |
| [firebase_core](https://pub.dev/packages/firebase_core) | Flutter plugin for Firebase Core, enabling connecting to multiple Firebase apps. |
| [url_launcher](https://pub.dev/packages/url_launcher) | Flutter plugin for launching a URL in the mobile platform's default browser. |
| [meta_seo](https://pub.dev/packages/meta_seo) | A Flutter package for managing SEO metadata in your app. |
| [timezone](https://pub.dev/packages/timezone) | A Flutter package that provides time zone information and conversions. |
| [mocktail](https://pub.dev/packages/mocktail) | A Dart package for mocking dependencies in unit tests. |
| [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) | A Flutter package for generating native splash screens. |
| [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) | A package that generates Flutter launcher icons. |
| [change_app_package_name](https://pub.dev/packages/change_app_package_name) | A Flutter package for changing the package name of an Android app. |


## Architecture

The app follows Reso Coder's clean architecture, which provides a structured approach to organizing code and separating concerns. This architecture promotes scalability, maintainability, and testability. To learn more about Reso Coder's clean architecture, you can refer to the following resource: [ResoCoder/flutter-tdd-clean-architecture-course](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

## Icons

The app utilizes icons from the [Flaticon](https://www.flaticon.com) website

## Changelog

### 1.0.3

#### Bug Fixes
- Fixed getting current location.
- Fixed caching current location.
- Fixed location searching.

#### Improvements
- Improved Today Details to only show next hours.
### 1.0.2
- First release