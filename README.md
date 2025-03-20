# Tickets - Flutter Mobile Application

## Description
This project involves the development of a multi-screen mobile application using the Flutter framework. The app simulates real-world data interactions and demonstrates proficiency in state management and dynamic UI design. It was developed as part of a task for **Gain Solutions Ltd** for the position of **Mobile App Developer - Flutter**.

## Features
### 1. **Ticket Screen**
- Displays a list of tickets.
- Includes a filter button in the top-right corner to navigate to the **Filter Screen**.

### 2. **Filter Screen**
- Dynamically displays filter options based on simulated API data.
- Adapts the UI to accommodate varying numbers of filter options (e.g., 3 fields, 5 fields, etc.).

### 3. **Contact Screen**
- Implements a search functionality to allow users to search for contacts.
- Displays search results based on simulated API data.

### 4. **Profile Screen**
- Displays basic user profile information, including:
  - Name
  - Email
  - Profile Picture

## Tech Stack
- **Flutter**: 3.29.1
- **Dart**: 3.7.0
- **State Management**: Bloc

## Installation
### Prerequisites
Before running the project, ensure you have the following installed:
- **Flutter SDK** (Version 3.29.1 or higher)
- **Dart** (Version 3.7.0 or higher)
- **Android Studio** or **VS Code** (Recommended IDEs)

### Setup
1. **Clone the repository**:
   ```bash
   git clone https://github.com/soton371/tickets.git
   cd tickets
   flutter pub get
   flutter run
