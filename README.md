# KyozoFeed

A Flutter app with Firebase authentication featuring email verification, splash screen, and bottom navigation.

## Features

- **Splash Screen**: Beautiful splash screen with logo displayed on app launch
- **Firebase Authentication**: 
  - Email/Password sign up and sign in
  - Email verification with manual confirmation button
  - Tracks email verification status
- **Bottom Navigation**: 
  - Feed screen
  - Events screen
  - Calendar screen
  - Settings screen (with sign out functionality)
- **State Management**: Provider pattern for authentication state

## Firebase Configuration

This app is connected to the Firebase project: `pawme-be065`

The Firebase configuration is already set up in `lib/firebase_options.dart`.

## Prerequisites

- Flutter SDK (3.38.1 or later)
- Dart SDK (3.10.0 or later)
- Firebase project with Authentication enabled
- Email/Password authentication method enabled in Firebase Console

## Setup Instructions

1. **Clone or navigate to the project directory**:
   ```bash
   cd /Users/ashokjaiswal/CascadeProjects/kyozo_feed
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Enable Email/Password Authentication in Firebase**:
   - Go to Firebase Console (https://console.firebase.google.com/)
   - Select the `pawme-be065` project
   - Navigate to Authentication > Sign-in method
   - Enable Email/Password authentication

4. **Run the app**:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                          # App entry point with AuthWrapper
├── firebase_options.dart              # Firebase configuration
├── providers/
│   └── auth_provider.dart            # Authentication state management
├── services/
│   └── auth_service.dart             # Firebase auth service
├── screens/
│   ├── splash_screen.dart            # Splash screen with logo
│   ├── auth/
│   │   ├── sign_in_screen.dart       # Sign in screen
│   │   ├── sign_up_screen.dart       # Sign up screen
│   │   └── email_verification_screen.dart  # Email verification screen
│   └── home/
│       ├── home_screen.dart          # Main screen with bottom navigation
│       ├── feed_screen.dart          # Feed placeholder
│       ├── events_screen.dart        # Events placeholder
│       ├── calendar_screen.dart      # Calendar placeholder
│       └── settings_screen.dart      # Settings with user info
└── assets/
    └── images/
        └── logo.svg                   # App logo
```

## App Flow

1. **Splash Screen** (2 seconds) → Shows KyozoFeed logo
2. **Authentication Check**:
   - If not logged in → Sign In/Sign Up screens
   - If logged in but email not verified → Email Verification screen
   - If logged in and email verified → Home screen with bottom navigation
3. **Email Verification**: 
   - User signs up → Verification email sent automatically
   - User clicks "I Confirmed the Link" button
   - App checks verification status before proceeding

## Screens

### Authentication Screens
- **Sign In**: Email and password login
- **Sign Up**: Create account with email and password
- **Email Verification**: Manual confirmation with "I Confirmed the Link" button

### Main App Screens
- **Feed**: Placeholder for feed content
- **Events**: Placeholder for events
- **Calendar**: Placeholder for calendar
- **Settings**: User account info and sign out option

## Dependencies

- `firebase_core`: ^3.8.1
- `firebase_auth`: ^5.3.3
- `provider`: ^6.1.2
- `flutter_svg`: ^2.0.10+1

## Notes

- The app uses Material 3 design
- Primary color: #6366F1 (Indigo)
- Email verification is required before accessing the main app
- Users can resend verification emails if needed
