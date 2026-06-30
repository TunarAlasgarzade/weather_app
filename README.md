# Weather App 🌤️

This project is a 7-day weather application built with Flutter, specifically created as a practical project to learn and master the Flutter framework and Dart programming language.

## 🚀 How It Works
- **Location Based:** The app fetches the user's current city automatically using GPS coordinates.
- **Dynamic API requests:** It sends the city name to CollectAPI to get the latest 7-day weather forecast.
- **Secure Architecture:** The API key is kept completely out of the codebase for security.

## 🛠️ Tech Stack & Packages
- **Flutter & Dart**
- **Dio** (For HTTP requests)
- **Geolocator & Geocoding** (For location services)

## 💻 How to Run Locally

To run the app on your local machine, you must provide your CollectAPI key via the terminal:

```bash
flutter run --dart-define=COLLECT_API_KEY="YOUR_API_KEY_HERE"