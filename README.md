# Weather App – iOS Project 🌤

## Overview 
This iOS application displays real-time weather forecasts for multiple cities using the OpenWeatherMap API.
The app is fully implemented in Swift (UIKit) following the MVVM architecture, and it supports both online and offline modes.


https://github.com/user-attachments/assets/9227972b-ebb9-4487-82ad-392e8cc9ae26


## Features

- 🌆 **City List:** Displays predefined cities with current temperatures  
- 🔍 **Search:** Find weather by typing a city name in the search bar  
- 📄 **City Details:**  
  - Shows temperature, min/max, wind speed, and humidity  
  - Weather condition icon for each city  
- 🔄 **Refresh Button:** Reload data instantly  
- 📶 **Network Handling:** Detects internet connection and switches to offline mode automatically  
- 💾 **Offline Mode:** Loads saved data from Core Data when no internet is available  
- ⚙️ **Core Data Integration:** Each forecast stored in a custom `WeatherEntity`  
- 🌐 **API Calls:** Uses `URLSession` to fetch weather city data from OpenWeatherMap  
- ⚡ **Parallel Requests:** Uses `DispatchGroup` to fetch multiple cities simultaneously
- 📱 **Orientation Support:** All screens are fully responsive and adapt to both portrait and landscape modes  
- 🌙 **Dark Mode:** Full support for iOS Dark Mode using custom Color Sets and adaptive system colors
- 🧭 **Navigation:** Includes Back button navigation between screens  
- 💡 **Clean UI:** UIKit-based design with loading spinner  
- 🖼️ **Custom App Icon:** Polished and consistent branding

## Architecture & Technologies

###  Architecture 
The app follows the **MVVM (Model–View–ViewModel)** design pattern, ensuring a clean separation between the UI and business logic.

- **Model** – represents the weather data structure (`WeatherModel`)
- **ViewModel** – manages logic for fetching, saving, and preparing data for display
- **View (Controller)** – updates the UI reactively based on the ViewModel’s data

This structure makes the code modular, testable, and easy to maintain.

---

### ☁ Networking ️
- Implemented using **URLSession** to perform REST API calls to [OpenWeatherMap](https://openweathermap.org/)
- Multiple cities’ data is fetched in parallel using **DispatchGroup**
- Results are parsed and updated on the main thread for a smooth user experience

---

### 💾 Local Storage  
- Weather data is persisted using **Core Data**, stored in the `WeatherEntity`
- **Core Data** was chosen instead of `UserDefaults` for reliable and structured offline storage
- When offline, the app automatically loads the last saved forecasts from Core Data

---

### 🌐 Network Monitoring  
- A custom **NetworkMonitor** class tracks connectivity in real-time
- If there is no internet connection:
  - An alert message is displayed to the user
  - The app loads data directly from Core Data to ensure offline access

---

### Technical Decisions
| Aspect | Choice | Reason |
|--------|---------|--------|
| Architecture | **MVVM** | Keeps logic modular and the UI independent |
| Local Storage | **Core Data** | Better structure and persistence than UserDefaults |
| Networking | **URLSession** | Native and lightweight API for network requests |
| Parallel Fetch | **DispatchGroup** | Ensures all cities load together before updating UI |
| Offline Mode | **Core Data + NetworkMonitor** | Provides a seamless offline experience |

## Development Workflow

Throughout the development process, the project was managed using Git and a clear branching strategy:

- **Main branch (`main`)** – kept stable and production-ready at all times  
- **Feature branches** – used for developing specific functionalities such as:
  - `dev`
  - `feature/api`
  - `feature/city-weather-details`
  - `feature/table-view-weather`
  - `feature/offline-mode`
- Each feature was developed, tested, and committed separately
- After all features were completed and verified, a **Pull Request** was created and merged into **`dev`**
- Once the project reached the final submission stage, the `dev` branch was **merged into `main`**

This approach ensured clean version control, easy testing, and a stable final build.

##  Installation

Just clone the repository and run it - no extra setup required.

```bash
git clone https://github.com/YourUsername/Weather-App.git
cd Weather-App
open WeatherApp.xcodeproj
```

# Screen Shots
# Light Mode
<img src="https://github.com/user-attachments/assets/71357685-9b67-47cc-990d-ce3d7429f2f1" alt="WelcomeController" width="20%" height="20%">
<img src="https://github.com/user-attachments/assets/83629cc7-7733-493b-9a2c-d38f55484c0a" alt="WelcomeController" width="20%" height="20%">

# Dark Mode
<img src="https://github.com/user-attachments/assets/edfc8e0c-3d5c-45b0-90fc-b39695c10187" alt="WelcomeController" width="35%" height="35%">
<img src="https://github.com/user-attachments/assets/49ce4e50-4e52-4e17-a920-20d1e725f6d8" alt="WelcomeController" width="35%" height="35%">

# Offline Mode alert
<img src="https://github.com/user-attachments/assets/08a24fec-e914-4c4a-a37a-92f06d53988e" alt="WelcomeController" width="20%" height="20%">

# Core Data
<img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/96ff931e-a59a-42cc-bd99-a611ed9267af" />



