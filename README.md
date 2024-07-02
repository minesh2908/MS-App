MS App
Project Documentation for MS App
Project Overview
MS App is a Flutter application designed to enable users to chat with AI using the Gemini API, along with multiple features such as QR code generation, theme changer, and current weather detection. The app incorporates the Bloc pattern for state management.

Table of Contents
Getting Started
Project Structure
State Management
Theme Management
API Integration
Features
Dependencies
How to Run
Live Demo
Getting Started
To get started with MS App, clone the repository and ensure you have Flutter installed on your machine. Follow the steps below to set up the project:

bash

Open In Editor
Edit
Run
Copy code
git clone https://github.com/your-repo/ms_app.git
cd ms_app
flutter pub get
Ensure you have the necessary environment setup by following the Flutter installation guide: Flutter Install

Project Structure

Open In Editor
Edit
Copy code
ms_app/
├── lib/
│   ├── main.dart
│   ├── pages/
│   │   ├── ai_chat/
│   │   │   └── ui/
│   │   │       └── ai_chat.dart
│   │   ├── dashboard/
│   │   │   └── ui/
│   │   │       └── dashboard.dart
│   │   ├── developer/
│   │   │   └── ui/
│   │   │       └── developer.dart
│   │   ├── helper/
│   │   │   └── ui/
│   │   │       └── helper.dart
│   │   └── qr/
│   │       └── ui/
│   │           └── qr_code_generation.dart
│   ├── theme/
│   │   ├── bloc/
│   │   │   └── theme_bloc.dart
│   │   └── theme/
│   │       └── theme.dart
└── pubspec.yaml
Description of Key Files and Directories
main.dart: Entry point of the application.
pages/: Contains all the UI pages and their respective implementations.
theme/: Contains theme-related files for managing light and dark themes.
State Management
The application uses the Bloc pattern for state management. The Bloc instances are provided at the root level of the application using BlocProvider.

Example: ThemeBloc
dart

Open In Editor
Edit
Copy code
BlocProvider<ThemeBloc>(
  create: (context) => ThemeBloc(),
),
Events are dispatched to fetch and manage the state of the theme.

Theme Management
Themes are managed using the ThemeBloc class, which extends Bloc. The current theme mode is fetched and updated using the ThemeBloc.

Example: Applying Theme
dart

Open In Editor
Edit
Copy code
return MaterialApp(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: state,
  home: const MyDashboard(),
);
API Integration
APIs are integrated to fetch data for AI chat functionality. The Gemini API is used for AI chat.

Features
AI Chat: Chat with AI using the Gemini API.
QR Code Generation: Generate QR codes with custom text or URLs.
Theme Changer: Switch between light and dark themes.
Current Weather Detection: Get the current weather for your location.
Dependencies
Key dependencies used in the project:

flutter_bloc: State management using Bloc pattern.
flutter: Flutter SDK for building the application.
Refer to pubspec.yaml for the complete list of dependencies.

How to Run
Ensure all dependencies are installed:
bash

Open In Editor
Edit
Run
Copy code
flutter pub get
Run the application:
bash

Open In Editor
Edit
Run
Copy code
flutter run
This will launch the app on the connected device or emulator.

Live Demo
You can try out the app at mineshsarawogi.online.
