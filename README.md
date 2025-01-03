# MyContacts - Flutter Contact Management App

A modern contact management application built with Flutter using clean architecture principles and feature-based modular structure.

## Project Architecture

The project follows a modular architecture with the following structure:

mycontacts/
├── module/
│ ├── core/ # Core functionality, shared utilities
│ ├── packages/ # Shared packages
│ └── uikit/ # Reusable UI components
│
├── feature/
│ ├── auth/ # Authentication feature
│ ├── dashboard/ # Main dashboard feature
│ ├── welcome/ # Welcome/onboarding feature
│ └── profile/ # User profile feature

## Features

- 📱 Contact Management
- 🔐 User Authentication
- 🔄 Real-time Synchronization
- 📊 Dashboard Overview
- 👤 User Profile Management
- 🌐 Firebase Integration
- 📨 Push Notifications

## Tech Stack

- **State Management**: Flutter Bloc
- **Dependency Injection**: GetIt
- **Navigation**: Go Router
- **Network**: Dio
- **Local Storage**: Hive, Shared Preferences
- **Backend Integration**: Firebase - RestApi
- **Architecture**: Clean Architecture with Feature-first Modular Approach

## Getting Started

### Prerequisites

- Flutter SDK (^3.6.0)
- Dart SDK (^3.5.4)
- Firebase project setup

### Prerequisites

- Flutter SDK (^3.6.0)
- Dart SDK (^3.5.4)
- Firebase project setup

### Installation

1. Clone the repository:
bash
git clone https://github.com/yourusername/mycontacts.git

2. Install dependencies:

bash
flutter pub get


3. Setup Firebase:
- Add your `google-services.json` for Android
- Add your `GoogleService-Info.plist` for iOS

4. Run the app:

bash
flutter run

## Project Structure

### Modules

- **Core**: Contains shared utilities, theme configurations, and base classes
- **UIKit**: Reusable UI components and widgets
- **Packages**: Common packages used across features

### Features

Each feature is a self-contained module with its own:
- Business Logic
- Presentation Layer
- Data Layer
- Domain Layer

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Technical Details

### API Configuration

// API Endpoints
const String LOGIN_PATH = "/auth/login";
const String REGISTER_PATH = "/auth/register";
const String CONTACTS_PATH = "/contacts";
const String PROFILE_PATH = "/user/profile";


### State Management

The application uses BLoC pattern with Cubit for state management:

## Features

### Authentication
- Login with email/password
- Register new account
- Password recovery
- Social media login (Google, Apple)

### Contact Management
- View all contacts
- Add new contact
- Edit existing contact
- Delete contact
- Search contacts
- Contact categories

### Profile
- View profile
- Edit profile information
- Change password
- Notification settings

yaml
dependencies:
flutter_bloc: ^8.1.6
dio: ^5.7.0
get_it: ^8.0.3
shared_preferences: ^2.3.3
hive: ^2.2.3
equatable: ^2.0.7
go_router: ^14.6.2
json_serializable: ^6.3.1

## Environment Setup

1. Create `.env` file in project root:

env
API_BASE_URL=https://api.dev.mycontacts.com/v1
FIREBASE_PROJECT_ID=your-project-id

# Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

@aea91

Project Link: [https://github.com/yourusername/mycontacts](https://github.com/yourusername/mycontacts)
