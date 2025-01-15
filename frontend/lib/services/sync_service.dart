// frontend/
// ├── android/
// ├── ios/
// ├── linux/
// ├── macos/
// ├── windows/
// ├── build/
// ├── .dart_tool/
// ├── .idea/
// ├── node_modules/
// ├── public/
// ├── src/
// ├── lib/
// │   ├── ai/
// │   │   ├── tensorflow_model.dart            # TensorFlow Lite integration for offline AI.
// │   │   ├── model_manager.dart              # Manages loading and inference of AI models.
// │   │   ├── nlp_utils.dart                  # Natural Language Processing utilities.
// │   │   └── feedback_generator.dart         # Personalized feedback based on AI inference.
// │   │
// │   ├── database/
// │   │   ├── database_helper.dart            # Local database setup and query handling.
// │   │   └── data_sync_repository.dart       # Handles syncing local data with the server.
// │   │
// │   ├── models/
// │   │   ├── lesson.dart                     # Model for lessons.
// │   │   ├── user_progress.dart              # Model for tracking user progress.
// │   │   ├── achievement.dart                # Model for gamification elements.
// │   │   ├── user_profile.dart               # Model for user profile data.
// │   │   └── settings.dart                   # Model for user preferences and settings.
// │   │
// │   ├── screens/
// │   │   ├── home_screen.dart                # Main screen for the app.
// │   │   ├── lesson_screen.dart              # Displays lesson details and interactions.
// │   │   ├── progress_screen.dart            # Shows user progress and analytics.
// │   │   ├── offline_content_screen.dart     # Manage downloadable offline content.
// │   │   ├── settings_screen.dart            # Adjust app settings and preferences.
// │   │   └── login_screen.dart               # User authentication screen.
// │   │
// │   ├── services/
// │   │   ├── api_service.dart                # Handles communication with the backend API.
// │   │   ├── sync_service.dart               # Background sync between local and remote.
// │   │   ├── connectivity_service.dart       # Handles network status and offline detection.
// │   │   ├── local_storage_service.dart      # Reads/writes local storage (e.g., SharedPreferences).
// │   │   └── notification_service.dart       # Push notifications and offline alerts.
// │   │
// │   ├── utils/
// │   │   ├── offline_manager.dart            # Manages offline mode transitions.
// │   │   ├── offline_storage.dart            # Helper for caching and retrieving offline content.
// │   │   ├── constants.dart                  # App-wide constants (e.g., API URLs, keys).
// │   │   ├── theme.dart                      # App theme and styles.
// │   │   └── helpers.dart                    # Utility functions used across the app.
// │   │
// │   ├── widgets/
// │   │   ├── offline_mode_widget.dart        # Widget to notify users of offline mode.
// │   │   ├── progress_chart.dart             # Custom chart for user progress.
// │   │   ├── lesson_card.dart                # Reusable card widget for displaying lessons.
// │   │   ├── reward_badge.dart               # Badge widget for gamification.
// │   │   └── accessibility_tools.dart        # Widgets for accessibility features (e.g., text-to-speech).
// │   │
// │   └── main.dart                           # Entry point of the app.
// │
// ├── test/
// │   ├── widget_test.dart                    # Widget testing for core functionalities.
// │
// ├── web/
// ├── .flutter-plugins/
// ├── .flutter-plugins-dependencies/
// ├── .gitignore
// ├── .metadata
// ├── ai_learning_app.iml
// ├── analysis_options.yaml                   # Linter rules and static analysis.
// ├── devtools_options.yaml
// ├── package.json                            # Node.js package dependencies.
// ├── pubspec.lock                            # Dart package lockfile.
// ├── pubspec.yaml                            # Dart package dependencies.
// ├── README.md                               # Project documentation.
// └── yarn.lock                               # Yarn package lockfile.
