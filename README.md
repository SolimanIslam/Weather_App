Weather App
This Flutter application allows you to get the weather for a specific city by entering its name. It uses a REST API for networking and requests your location permission to provide weather information for your current location.

Features:

Enter a city name to get its weather information.
Get weather information for your current location.
Display current temperature, weather description, and other relevant data.
Uses a loading spinner while fetching weather data.

Dependencies:

geolocator: ^9.0.2
http: ^0.13.6
flutter_spinkit: ^5.2.0
Getting started:


The application will request permission to access your location. This is used to provide weather information for your current location. You can grant or deny this permission.

API:

The application uses a REST API for weather data. You will need to configure the API key in the code.
