
# 🚗 Car Rental App – Flutter (Clean Architecture)

A complete car rental application built with **Flutter** following the **Clean Architecture** structure.  
The project integrates Firebase, state management with Bloc, offline storage, maps, and more.

---

### Packages Used

### 🔹 UI & UX
| Package | Version | Description |
|--------|---------|-------------|
| flutter_screenutil | ^5.9.3 | Handles responsive UI for all screen sizes |
| smooth_page_indicator | ^1.2.1 | Page indicators for onboarding and sliders |
| cached_network_image | ^3.4.1 | Caches network images for better performance |

---

### Maps & Location
| Package | Version | Description |
|--------|---------|-------------|
| flutter_map | ^7.0.2 | Map rendering using OpenStreetMap |
| geolocator | ^14.0.2 | Get device location & manage permissions |
| geocoding | ^4.0.0 | Convert coordinates ↔ addresses |

---

### Connectivity & Device
| Package | Version | Description |
|--------|---------|-------------|
| connectivity_plus | ^6.1.4 | Check network connection status |
| url_launcher | ^6.3.1 | Open URLs, WhatsApp, Maps, Browser |

---

### Firebase Services
| Package | Version | Description |
|--------|---------|-------------|
| firebase_core | ^3.15.2 | Firebase initialization |
| cloud_firestore | ^5.6.12 | Cloud Firestore database |
| firebase_auth | ^5.7.0 | Firebase Authentication |

---

### State Management & Architecture
| Package | Version | Description |
|--------|---------|-------------|
| flutter_bloc | ^9.1.1 | Bloc/Cubit state management |
| hydrated_bloc | ^10.1.1 | Persist Bloc state locally |
| get_it | ^8.2.0 | Service Locator for dependency injection |
| equatable | ^2.0.7 | Makes object comparison easy |
| dartz | ^0.10.1 | Functional programming helpers (Either, Option) |

---

### Local Storage
| Package | Version | Description |
|--------|---------|-------------|
| hive | ^2.2.3 | Fast local storage |
| hive_flutter | ^1.1.0 | Flutter adapter for Hive |
| flutter_secure_storage | ^9.2.2 | Secure token & credentials storage |

---

### Utilities
| Package | Version | Description |
|--------|---------|-------------|
| intl | ^0.20.2 | Date/number formatting |
| path_provider | ^2.1.5 | Access device directories |
| freezed | ^2.5.7 | Generate immutable classes & union types |

---

---

##  Project Architecture – Clean Architecture




## Folder Structure

---



```bash
lib/
├── core/
│   ├── errors/                 # Exceptions + Failure classes
│   ├── usecases/              # Base UseCase classes
│   ├── utils/                 # Helpers, formatters, etc.
│   ├── services/              # Shared services (Firebase, API, etc.)
│   ├── theme/                 # Theme & styles
│   ├── router/                # App routing
│   ├── resources/             # Colors, images, fonts, strings
│   └── shared_widgets/        # Common reusable widgets
│
├── features/
│   ├── booking/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── datasources/       # Remote/local data sources
│   │   │   └── repositories_impl/ # Implementation of repository
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── cubit/             # or bloc/viewmodel
│   │       └── pages/             # Screens
│   │
│   ├── car_details/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── driver_information/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── home/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── host_car/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── payment_process/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── main.dart


👨‍💻 Developer
Ahmed Elsaghier
Flutter Developer | Native Android (Java)
📧 Email: zagzougprograming@gmail.com

📌 Notes
This project follows:

Clean Architecture

SOLID Principles

Firebase Integration

Bloc State Management

Offline Capability with Hive & Hydrated Bloc

Designed for scalability, maintainability, and high performance.


