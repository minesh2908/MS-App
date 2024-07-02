## MS App Overview
MS App is a web application built with Flutter that provides a range of features, including AI chatting, QR code generation, theme changing, and temperature fetching. The app uses Gemini API for AI chat and Open Weather API for fetching current temperature.

## Features

# AI Chatting: Engage in conversations with the AI chatbot using Gemini API.
# QR Code Generation: Generate QR codes with custom colors and images.
# Theme Changing: Switch between light and dark themes.
# Temperature Fetching: Fetch current temperature using Open Weather API.
# Responsive Design: The app is fully responsive and adapts to different screen sizes for computer/PC, tablets, and mobiles.


## Technical Details
- Built with Flutter.
- Uses Gemini API for AI chat.
- Uses Open Weather API for fetching current temperature.
- Implements Bloc pattern for state management.
- Uses Dio for API calls.
- Uses Geolocator for location services.
- Uses Permission Handler for managing permissions.

## Directory Structure

lib/: Contains the application code.
  main.dart: Entry point of the application.
  pages/: Contains the different pages of the app.
    ai_chat/: AI chat page.
    qr/: QR code generation page.
    temperature/: Temperature fetching page.
  repo/: Contains the repository classes for API calls.
    chat_message_api.dart: API calls for AI chat.
    weather_api.dart: API calls for fetching current temperature.
  theme/: Contains the theme-related classes.
    theme_bloc.dart: Theme Bloc for managing theme state.
    theme_provider.dart: Theme provider for theme management.
  utils/: Contains utility classes.
    constants.dart: Constants used throughout the app.
  pubspec.yaml: Configuration file for Flutter dependencies.

## How to Run
1- Clone the repository: git clone https://github.com/your-repo/ms-app.git
2- Install dependencies: flutter pub get
3 - Run the app: flutter run

## Live Demo
The app is currently live at mineshsarawogi.online.

License
This project is licensed under the MIT License. See LICENSE for details.
