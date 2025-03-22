# Newsly - Flutter News App

A Flutter-based news application that allows users to register, select their interests, and view personalized news articles from the News API.

## Features

- **Splash Screen with Delay**: Displays a branded splash screen with a 2-second delay before navigating to the main app.
- **User Registration**: Sign up with name, email, and password, including email verification.
- **Verify Email Address**: After registration, users receive a verification email and are guided through the verification process.
  - Sends a verification email to the user's email address.
  - Displays a verification screen (`VarifyEmailScreen`) to prompt the user to verify their email.
  - Periodically checks the verification status using `VarifyEmailCubit`.
  - Redirects to a success screen (`SuccessfullVerifiedPage`) upon successful verification.
- **Password Validation**: Real-time password validation with visual feedback.
- **Interest Selection**: Toggle interests to personalize news categories.
- **News Feed**: Display news articles based on user-selected categories.

## Setup Instructions

Follow these steps to set up and run the project locally:

### Prerequisites

- Flutter SDK (version 3.7.0)
- Dart SDK (version 3.7.0 or later)
- Android Studio / Xcode for emulators
- A valid News API key from [newsapi.org](https://newsapi.org)

### Installation

1. Clone the repository:
  
   git clone https://github.com/yourusername/newslt.git
   cd newslt
2. Install dependencies:
    flutter pub get
3. Create a .env file in the root directory with your API key:
  API_KEY=your_news_api_key_here

4. Run the app:
  flutter run

# Newslt - Project Structure
newslt/
├── android/                  # Android-specific files
├── ios/                      # iOS-specific files
├── lib/                      # Main Dart code
│   ├── config/               # Configuration files (e.g., routes)
│   │   └── routes.dart
│   ├── core/                 # Core utilities and extensions
│   │   ├── extentions/       # Custom extensions
│   │   │   └── int_extentions.dart
│   │   ├── utils/            # Utility functions and constants
│   │   │   ├── app_styles.dart
│   │   │   ├── assets.dart
│   │   │   ├── bloc_observer.dart
│   │   │   ├── cache_helper.dart
│   │   │   ├── common_helper.dart
│   │   │   ├── constants.dart
│   │   │   └── screen_size.dart
│   │   └── data/ models/           # Data models
│   │   │    └── data_model.dart
│   │   │   │   ├── assets.dart
│   │   │   │   ├── interest_category_model.dart
│   │   │   │   └── user_model.dart
│   ├── presentations/        # UI and business logic
│   │   ├── cubits/           # Cubit files for state management
│   │   │   ├── auth/         # Authentication-related cubits
│   │   │   │   ├── create_user/
│   │   │   │   │   ├── create_user_cubit.dart  # Cubit for user registration
│   │   │   │   │   └── create_user_state.dart  # States for user registration
│   │   │   │   ├── password_cases/
│   │   │   │   │   ├── password_cases_cubit.dart  # Cubit for password validation
│   │   │   │   │   └── password_cases_state.dart  # States for password validation
│   │   │   │   └── varify_email/
│   │   │   │       ├── varify_email_cubit.dart  # Cubit for email verification
│   │   │   │       └── varify_email_state.dart  # States for email verification
│   │   │   ├── get_news/
│   │   │   │   ├── get_news_cubit.dart  # Cubit for fetching news data
│   │   │   │   └── get_news_state.dart  # States for news fetching
│   │   │   └── toggle_interests/
│   │   │       ├── toggle_interests_cubit.dart  # Cubit for toggling user interests
│   │   │       └── toggle_interests_state.dart  # States for toggling interests
│   │   ├── pages/            # Screen widgets
│   │   │   ├── home_screen.dart  # Home screen displaying news and category tabs
│   │   │   ├── sign_up_screen.dart  # Sign-up screen for user registration
│   │   │   ├── successfull_verified_page.dart  # Screen shown after successful email verification
│   │   │   ├── user_interests_screen.dart  # Screen for selecting user interests
│   │   │   └── varify_email_screen.dart  # Screen for email verification
│   │   └── widgets/          # Reusable UI widgets
│   │       ├── category_card.dart  # Widget for displaying category cards
│   │       ├── category_taps.dart  # Widget for displaying category tabs
│   │       ├── custom_app_bar.dart  # Custom app bar widget
│   │       ├── custom_button.dart  # Custom button widget
│   │       ├── custom_grid_view.dart  # Custom grid view widget
│   │       ├── custom_text_form_field.dart  # Custom text form field widget
│   │       ├── headline_txt.dart  # Widget for headline text
│   │       ├── news_card.dart  # Widget for displaying news cards
│   │       ├── subtitle_txt.dart  # Widget for subtitle text
│   │       └── user_interests_view_model.dart  # View model for user interests
│   ├── firebase_options.dart  # Firebase configuration options
│   └── main.dart             # Entry point of the app
├── pubspec.yaml              # Dependencies and project metadata
└── README.md                 # Project documentation

