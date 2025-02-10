# Dynamic UI Integration - Flutter Application

This Flutter application dynamically renders UI components based on an API response. It uses *
*Dependency Injection (GetIt)**, **Dio for API integration**, and **Bloc for state management**. The
app fetches data from an API and dynamically arranges UI components (e.g., banners, categories,
products) based on the response.

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Running the Project](#running-the-project)
- [Testing](#testing)
- [Dependencies](#dependencies)
- [Assumptions](#assumptions)
- [Contributing](#contributing)

## Features

- **Dynamic UI Rendering**: Renders UI components (banners, categories, products) based on the API
  response.
- **State Management**: Uses Bloc to manage API data and UI updates.
- **Dependency Injection**: Uses GetIt to manage dependencies like Dio and ApiService.
- **Error Handling**: Displays error messages for network issues or invalid API responses.
- **Responsive Design**: Ensures the UI works seamlessly across different screen sizes.

## Project Structure

```
lib/
├── api/
│   ├── api_service.dart                    # Handles API requests using Dio
│   ├── service_locator.dart                # Dependency injection setup
│   └── models/
│       ├── homepage_response.dart          # Model for the API response
│       ├── viewtype_list.dart              # Model for viewtype list
│       └── theme_colors.dart               # Model for theme colors
├── bloc/
│   ├── homepage_bloc.dart                  # Bloc for managing homepage state
│   ├── homepage_event.dart                 # Events for the homepage Bloc
│   ├── homepage_state.dart                 # States for the homepage Bloc
├── screens/
│   └── homepage_screen.dart                # Main screen for rendering dynamic UI
├── theme/
│   └── global_theme.dart                   # Manage screen bg, text,etc colors
├── widgets/
│   ├── banner_widget.dart                  # Widget for rendering banners
│   ├── category_widget.dart                # Widget for rendering categories
│   ├── category_item_widget.dart           # Reusable Widget for categori
│   ├── product_widget.dart                 # Widget for rendering products
│   ├── product_item_widget.dart            # Reusable Widget for product
│   └── error_widget.dart                   # Widget for displaying errors
└── main.dart                               # Entry point of the application

test/
└── bloc/
    ├── homepage_bloc_test.dart             # Test cases for HomepageBloc
    └── mock_api_service.dart               # Mock ApiService for testing
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Ashishmakwana941/dynamic-ui-flutter.git
cd dynamic-ui-flutter
```

### 2. Install Dependencies

```bash
flutter pub get
```

## Running the Project

To run the project, use the following command:

```bash
flutter run
```

### Supported Platforms

- Android
- iOS
- Web
- Desktop (Windows, macOS, Linux)

## Testing

### Run Tests

```bash
flutter test
```

### Test Cases

- **Initial State**: Verifies that the initial state of the `HomepageBloc` is `HomepageInitial`.
- **Successful API Call**: Verifies that the `HomepageBloc`
  emits `[HomepageLoading, HomepageLoaded]` when the API call succeeds.
- **API Call Fails**: Verifies that the `HomepageBloc` emits `[HomepageLoading, HomepageError]` when
  the API call fails.
- **Empty API Response**: Verifies that the `HomepageBloc` handles an empty API response gracefully.

## Dependencies

### Main Dependencies

- `flutter_bloc`: For state management.
- `dio`: For making HTTP requests.
- `get_it`: For dependency injection.
- `equatable`: For equality comparisons in Bloc states.
- `carousel_slider`: For rendering banner sliders.

### Dev Dependencies

- `flutter_test`: For writing and running tests.
- `bloc_test`: For testing Bloc state transitions.
- `mockito`: For mocking dependencies in tests.

## Assumptions

- **API Response Structure**:
    - The API response contains a `viewtype` field to determine the widget type (e.g., banners,
      categories, products).
- **Error Handling**:
    - The app displays an error message if the API call fails or returns invalid data.
- **Dynamic UI**:
    - The app dynamically renders UI components based on the API response.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

