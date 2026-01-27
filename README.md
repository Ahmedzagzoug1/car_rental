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

## Implemented Features 
 

---

##  Authentication
 
Email & password authentication

OTP verification required before payment

User approval flow integrated with booking logic

---

##  Home
 Home
Browse available cars

View car details

Location-based data display

---

##  Booking
Create booking requests

Booking requires admin approval before confirmation

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

Hosts can add cars to the platform

Role-based logic handled through backend data

---

## Tech Stack
 Tech Stack
Core
Flutter

Dart

State Management
Cubit (flutter_bloc)

equatable

hydrated_bloc

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

google_ml_kit

permission_handler

---

## Developer Role
Flutter Developer (Clean Architecture & Bloc)
Solo Developer

Designed and implemented the full architecture

Built all features independently

Managed state, navigation, and data flow

Applied clean code and scalable patterns

---

## Future Improvements
The following enhancements are planned to further improve the project:

✅ Add unit & widget testing

🧑‍💼 Complete and extend Host features

⚙️ Set up CI/CD pipeline

💬 Add in-app chat functionality

🔔 Implement push notifications

🚀 Apply general performance and UX improvements

