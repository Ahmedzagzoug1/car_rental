# 🚗 Car Rental App (Flutter)

##  Project Overview
A **personal Flutter project** built using **Clean Architecture** and **Cubit (Bloc)** state management.  
The application simulates a full car rental flow, focusing on architecture quality, state management, and scalable feature-based structure.

This project demonstrates strong understanding of **Flutter architecture**, **role-based logic**, and **real-world app flows**, while keeping the payment layer mocked (UI only).

---

##  Architecture
The project follows **Clean Architecture** with a clear separation of concerns:

Presentation → Domain → Data

```yaml


### Architecture Highlights
- Feature-based structure
- Cubit used across all features
- Repository pattern
- Dependency Injection
- Scalable and test-ready design

---

## Features Structure
Each feature is implemented independently with its own layers:

lib/
 ├── myapp/
 │
 ├── core/
 │   ├── error/
 │   │   └── exceptions & failures
 │   │
 │   ├── network/
 │   │   └── network info & connectivity handling
 │   │
 │   ├── observer/
 │   │   └── Bloc/Cubit observers
 │   │
 │   ├── resources/
 │   │   └── assets, colors, styles, constants
 │   │
 │   ├── routes/
 │   │   └── app routing & navigation
 │   │
 │   ├── services/
 │   │   └──  services like service locators
 │   │
 │   ├── shared_components/
 │   │   └── reusable widgets
 │   │
 │   └── utils/
 │       └── helpers & utilities
 │
 ├── features/
 │   ├── auth/
 │   │   ├── presentation/
 │   │   │   ├── cubit/
 │   │   │   └── pages & widgets
 │   │   ├── domain/
 │   │   │   ├── entities/
 │   │   │   ├── usecases/
 │   │   │   └── repositories/
 │   │   └── data/
 │   │       ├── models/
 │   │       ├── datasources/
 │   │       └── repositories/
 │   │
 │   ├── home/

 │   ├── booking/
 │   ├── payment/
 │   ├── approval/
 │   └── host/
 │
 └── main.dart
```

---

---

## 🚀 Installation & Setup

Follow these steps to get the project up and running on your local machine.

### 📋 Prerequisites
* **Flutter SDK:** Latest Stable Version.
* **Firebase Account:** To set up the backend services.

### 🛠 Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ahmedzagzoug1/car_rental
2. Navigate to the project directory:

   ```bash
   cd your-repo-name
3.Install dependencies:
  ```bash
  flutter pub get
```
4.Firebase Setup:

Go to Firebase Console.

Create a new project for the app.

Add an Android app and download google-services.json to android/app/.

Add an iOS app and download GoogleService-Info.plist to ios/Runner/.

Enable Authentication (Email/Password) and Cloud Firestore in the console.

5.Run the application:


   ```bash
   flutter run
   ```



## Implemented Features 
 

---

##  Authentication
 
Email & password authentication


User approval flow integrated with booking logic

---

##  Home
 Home
Browse available cars

View car details


---

##  Booking
Create booking requests

Booking flow connected to approval feature

---

##  Payment
Payment feature implemented as Mock / UI only

Used to demonstrate complete booking-to-payment flow

No real payment gateway integrated

---

##  Approval
Admin approval required before booking

Approval logic handled as a standalone feature

Integrated with booking state

---

##  Host
Any user can become a host using a role field in Firebase

---

## Tech Stack
 Tech Stack
Core
Flutter

Dart

State Management
Cubit (flutter_bloc)

equatable

Backend
Firebase Authentication

Cloud Firestore

Location & Maps
geolocator

geocoding

flutter_map

Local Storage
hive

hive_flutter

flutter_secure_storage

Utilities
get_it (Dependency Injection)

dartz

connectivity_plus

intl

http

Media & Permissions
image_picker


permission_handler

---

## Developer Role
Flutter Developer (Clean Architecture & Bloc)
Solo Developer

Designed and implemented the full architecture

Built all features independently

Managed state, navigation, and data flow

Applied clean code and scalable patterns

Add unit test package like hive_test , firebase test and mockito

---

## Future Improvements
The following enhancements are planned to further improve the project:

✅ Add Integration & widget testing

🧑‍💼 Complete and extend Host features

⚙️ Set up CI/CD pipeline

💬 Add in-app chat functionality

🔔 Implement push notifications

🚀 Apply general performance and UX improvements

