# test_project

A new Flutter project.

## Getting Started
this project use Flutter and bloc pattern to short the URL, we are using shared prefernces to save the list using encode string,

├── lib
|   ├── bloc
│   │   ├── shortenlinks_bloc.dart
|   |   ├── shortenlinks_eventdart
|   |   ├── shortenlinks_state.dart
|   ├── models
│   │   ├── shortenlink_model.dart
|   ├── Providers
│   │   ├── shorten_api_provider.dart
|   ├── Repositary
│   │   ├── shorten_api_repositary.dart
|   ├── views
│   │    └── Screens
│   │    │   ├── historly_links.dart
│   |    |   ├── intro_screen.dart
│   |    |   ├── main_screen.dart
│   |    |   ├── start_screen.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
