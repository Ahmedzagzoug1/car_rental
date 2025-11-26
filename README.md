# car_rental application

An application used to help people to rent cars.

## Getting Started

## Folder Structure

---



```bash
lib/
├── core/
│   └── resources/               # Shared assets, constants, etc.
│   └── shared_widgets/
│   └── services/
│   └── router/
│   └── theme/ 
│
├── features/                    # Feature-based structure
│   ├── booking/
│   │   ├── data/               # Booking data models
│   │   ├── domain/          # ViewModels or business logic
│   │   └── presentation/                # UI Screens for booking
│   │
│   ├── car_details/             # Car detail feature
│   │   ├── model/               # Car detail  models
│   │   ├── model_view/          # ViewModels or business logic
│   │   └── view/                # UI Screens for Car detail 
│   │
│   ├── driver_information/      # Driver details input/view
│   │   ├── model/               # Driver details data models
│   │   ├── model_view/          # ViewModels or business logic
│   │   └── view/                # UI Screens for Driver details
│   │
│   ├── home/                    # Home screen
│   │   ├── model/               # Home data models
│   │   ├── model_view/          # ViewModels or business logic
│   │   └── view/                # UI Screens for Home
│   │
│   ├── host_car/                # Host car listing feature
│   │   ├── model/               # Host data models
│   │   ├── model_view/          # ViewModels or business logic
│   │   └── view/                # UI Screens for Host
│   │
│   └── payment_process/         # Payment logic and UI
│       ├── model/               # Payment data models
│       ├── model_view/          # ViewModels or business logic
│       └── view/                # UI Screens for Payment
│   
│
└── main.dart                    # App entry point


