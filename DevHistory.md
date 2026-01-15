# Development History - KyozoFeed

## Project Overview
Flutter mobile application for KyozoFeed with Firebase authentication and Google Sign-In integration.

---

## Session 1: Firebase Configuration & Initial Setup (Jan 15, 2026)

### 1. Firebase Project Configuration

#### Firebase Project Details
- **Project ID**: `kyozoverse`
- **Project Number**: `1061297794599`
- **Storage Bucket**: `kyozoverse.firebasestorage.app`

#### Web Configuration
```javascript
const firebaseConfig = {
  apiKey: "AIzaSyBn0nbZ1XQsxkiD9Cefj_FTGNpK3VhTpMY",
  authDomain: "kyozoverse.firebaseapp.com",
  projectId: "kyozoverse",
  storageBucket: "kyozoverse.firebasestorage.app",
  messagingSenderId: "1061297794599",
  appId: "1:1061297794599:web:23a0dd107dc36cff44a802",
  measurementId: "G-33S7RT90CJ"
};
```

#### iOS Configuration
- **Bundle ID**: `com.kyozo.kyozoFeed`
- **App ID**: `1:1061297794599:ios:1d096be4933c197d44a802`
- **API Key**: `AIzaSyCxhuYBAHRaD62jOShsLa_zLFkienl4dlA`
- **Client ID**: `1061297794599-igjloohgbelrvpmh72pmk4cdm37pp1hl.apps.googleusercontent.com`
- **Reversed Client ID**: `com.googleusercontent.apps.1061297794599-igjloohgbelrvpmh72pmk4cdm37pp1hl`

#### Android Configuration
- **Package Name**: `com.kyozo.kyozoFeed`
- **App ID**: `1:1061297794599:android:8a651e78d1aea24f44a802`
- **API Key**: `AIzaSyCb8qVZuZX3v6dGOcbOK8XZP7mz0xVZZSs`

### 2. Firebase Options File Updates

**File**: `lib/firebase_options.dart`

Updated with correct platform-specific credentials:
- Android: Added proper `appId` and `messagingSenderId`
- iOS: Added proper `appId` and `messagingSenderId`
- macOS: Added proper `appId` and `messagingSenderId`

### 3. Firebase Configuration Files Created

#### iOS Configuration
**File**: `ios/Runner/GoogleService-Info.plist`
- Contains iOS-specific Firebase configuration
- Includes CLIENT_ID, API_KEY, GOOGLE_APP_ID, etc.

#### Android Configuration
**File**: `android/app/google-services.json`
- Contains Android-specific Firebase configuration
- Includes client info, OAuth clients, and API keys

### 4. Initial App Run
- Successfully ran app on iPhone 16 Pro simulator
- Device ID: `0451899D-EBD9-4080-9A70-5D5CD73E3BF4`
- Xcode build completed in ~11 seconds

---

## Session 2: Google Sign-In Implementation

### 1. Dependencies Added

**File**: `pubspec.yaml`
```yaml
google_sign_in: ^6.2.1
```

### 2. AuthService Updates

**File**: `lib/services/auth_service.dart`

Added methods:
- `signInWithGoogle()` - Handles Google Sign-In flow
- `signOutGoogle()` - Signs out from both Google and Firebase

### 3. AuthProvider Updates

**File**: `lib/providers/auth_provider.dart`

Added:
- `signInWithGoogle()` method with error handling
- Support for cancelled sign-in attempts

### 4. UI Updates

#### Sign-In Screen
**File**: `lib/screens/auth/sign_in_screen.dart`
- Added "Continue with Google" button
- Added OR divider
- Implemented `_signInWithGoogle()` method

#### Sign-Up Screen
**File**: `lib/screens/auth/sign_up_screen.dart`
- Added "Continue with Google" button
- Added OR divider
- Implemented `_signUpWithGoogle()` method

### 5. CocoaPods Issues Resolved

Encountered dependency conflict with `GTMSessionFetcher/Core`:
```bash
pod repo update
rm -rf Podfile.lock Pods
pod install --repo-update
```

Successfully installed pods:
- GoogleSignIn (8.0.0)
- GTMSessionFetcher (3.5.0)
- GTMAppAuth (4.1.1)
- Firebase pods (11.15.0)

### 6. Physical Device Deployment

Successfully deployed to physical iPhone:
- Device ID: `00008101-000978292690001E`
- iOS Version: 26.0.1
- Development Team: D8Q78YW2HH

---

## Session 3: Kyozo Brand Implementation

### 1. Brand Constants Created

#### Color Palette
**File**: `lib/constants/kyozo_colors.dart`

Key colors:
- Primary Purple: `#843484`
- Light Purple: `#C170CF`
- Text Primary: `#333333`
- Text Secondary: `#666666`
- Background: `#FFFFFF`
- Card Background: `#EEEEEE`

Content type colors:
- Read Mauve: `#926B7F`
- Listen Blue: `#6E94B1`
- Watch Yellow: `#F0C679`

#### Typography
**File**: `lib/constants/kyozo_text_styles.dart`

Font families:
- Display: Canicule Display
- Body: Inter
- Alternative: DM Sans

Defined styles for:
- Card titles and body text
- Input fields and labels
- Buttons
- Headings (H1, H2)
- Badges

### 2. Assets Added

#### Google Icon
**File**: `assets/images/google_icon.png`
- Downloaded from Firebase UI
- Used for Google Sign-In buttons

#### Logo
**File**: `assets/images/logo.png`
- Used in splash screen

#### App Icon
**File**: `assets/images/icon.png`
- Used for app launcher icon

### 3. UI Updates with Brand Colors

#### Main App Theme
**File**: `lib/main.dart`
- Updated seed color to `KyozoColors.primaryPurple`
- Set scaffold background to `KyozoColors.background`

#### Splash Screen
**File**: `lib/screens/splash_screen.dart`
- Changed background to `KyozoColors.primaryPurple`
- Updated to use `Image.asset` for logo.png
- Removed flutter_svg dependency for splash

#### Sign-In Screen
**File**: `lib/screens/auth/sign_in_screen.dart`
- Applied Kyozo purple to headings and buttons
- Updated text colors to use Kyozo palette
- Changed Google icon from network image to local asset

#### Sign-Up Screen
**File**: `lib/screens/auth/sign_up_screen.dart`
- Applied Kyozo purple to headings and buttons
- Updated text colors to use Kyozo palette
- Changed Google icon from network image to local asset

### 4. App Icon Generation

#### Configuration
**File**: `pubspec.yaml`
```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/icon.png"
  remove_alpha_ios: true
  background_color: "#843484"
```

#### Package Added
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1
```

#### Generation Command
```bash
dart run flutter_launcher_icons
```

Successfully generated:
- Android launcher icons (all densities)
- iOS app icons (all sizes)

---

## Technical Stack

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  firebase_core: ^3.8.1
  firebase_auth: ^5.3.3
  google_sign_in: ^6.2.1
  provider: ^6.1.2
  flutter_svg: ^2.0.10+1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  flutter_launcher_icons: ^0.13.1
```

### Project Structure
```
lib/
├── constants/
│   ├── kyozo_colors.dart
│   └── kyozo_text_styles.dart
├── providers/
│   └── auth_provider.dart
├── screens/
│   ├── auth/
│   │   ├── sign_in_screen.dart
│   │   ├── sign_up_screen.dart
│   │   └── email_verification_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   └── splash_screen.dart
├── services/
│   └── auth_service.dart
├── firebase_options.dart
├── firebase_options_pawme.dart
└── main.dart
```

---

## Known Issues & Notes

### SVG Parsing Warnings
- Some SVG assets have malformed XML (missing ">" at position 7:138)
- Does not affect app functionality
- Consider fixing or replacing problematic SVG files

### Image Loading
- Resolved network image loading error for Google icon by using local asset
- All images now load from local assets

### Xcode Debugging
- Occasionally Xcode takes longer to start debugging session
- Can be resolved by closing Xcode and re-running Flutter command
- May need to grant automation permissions in System Settings

---

## Deployment Notes

### iOS Deployment
- Requires Apple Developer account
- Development team: D8Q78YW2HH
- Automatic signing enabled
- Tested on physical iPhone (iOS 26.0.1)

### Android Deployment
- Package name configured: `com.kyozo.kyozoFeed`
- Google services configuration in place
- Ready for testing on Android devices

---

## Next Steps

### Recommended Improvements
1. Add custom fonts (Canicule Display, Inter, DM Sans)
2. Implement email verification flow improvements
3. Add user profile management
4. Implement feed functionality
5. Add error boundary and crash reporting
6. Set up CI/CD pipeline
7. Add unit and widget tests
8. Implement dark mode support
9. Add analytics tracking
10. Optimize app performance

### Testing Checklist
- [ ] Test Google Sign-In on iOS
- [ ] Test Google Sign-In on Android
- [ ] Test email/password authentication
- [ ] Test email verification flow
- [ ] Test sign-out functionality
- [ ] Verify app icon on both platforms
- [ ] Test splash screen appearance
- [ ] Verify brand colors across all screens
- [ ] Test on different screen sizes
- [ ] Performance testing

---

## Resources

### Firebase Console
- URL: https://console.firebase.google.com/project/kyozoverse

### Documentation
- Flutter: https://flutter.dev/docs
- Firebase: https://firebase.google.com/docs
- Google Sign-In: https://pub.dev/packages/google_sign_in

### Design Assets
- Logo: `assets/images/logo.png`
- App Icon: `assets/images/icon.png`
- Google Icon: `assets/images/google_icon.png`

---

## Session 4: Google Sign-In iOS Crash Fix

### Issue: Xcode Crash on Google Sign-In

**Problem**: When attempting to sign in with Google on iOS, the app crashed in Xcode at the exception handler:
```objc
} @catch (NSException *e) {
    completion(nil, [FlutterError errorWithCode:@"google_sign_in" message:e.reason details:e.name]);
    [e raise];
}
```

**Root Causes Identified**:
1. Missing URL scheme configuration in `Info.plist`
2. **GoogleService-Info.plist not added to Xcode project** (Critical!)
3. Missing explicit client ID in GoogleSignIn initialization

### Fixes Applied

#### 1. Added URL Scheme to Info.plist

**File**: `ios/Runner/Info.plist`

Added `CFBundleURLTypes` configuration:
```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>com.googleusercontent.apps.1061297794599-igjloohgbelrvpmh72pmk4cdm37pp1hl</string>
        </array>
    </dict>
</array>
```

**Note**: The URL scheme value is the `REVERSED_CLIENT_ID` from `GoogleService-Info.plist`.

#### 2. Added GoogleService-Info.plist to Xcode Project

**Problem**: The `GoogleService-Info.plist` file existed in the filesystem but was not included in the Xcode project, causing Google Sign-In to fail.

**Fix**: Added the file to Xcode project using xcodeproj gem:
```bash
ruby -e "
require 'xcodeproj'
project_path = 'ios/Runner.xcodeproj'
project = Xcodeproj::Project.open(project_path)
target = project.targets.first
file_ref = project.new_file('Runner/GoogleService-Info.plist')
target.add_resources([file_ref])
project.save
"
```

**Verification**: Check if file is in project:
```bash
grep -r "GoogleService-Info.plist" ios/Runner.xcodeproj/project.pbxproj
```

#### 3. Configured Explicit Client ID

**File**: `lib/services/auth_service.dart`

Updated GoogleSignIn initialization:
```dart
final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: '1061297794599-igjloohgbelrvpmh72pmk4cdm37pp1hl.apps.googleusercontent.com',
);
```

**Note**: This is the `CLIENT_ID` value from `GoogleService-Info.plist`.

### Steps to Test

1. Clean build: `flutter clean`
2. Rebuild app on physical device
3. Tap "Continue with Google" button
4. Should now open Google Sign-In flow without crashing

### Alternative Deployment Method

If `flutter run` encounters Xcode debugging session errors:
1. Open Xcode workspace: `open ios/Runner.xcworkspace`
2. Select your physical device in Xcode
3. Click "Product > Run" (⌘R)
4. This bypasses Flutter's debugging session and uses Xcode directly

---

*Last Updated: January 15, 2026*
