# 📝 Todo App
A clean and modern **Todo App** built using **Flutter**, following **Clean Architecture**, **Hive** for local offline storage, **Provider** for state management, and a structured **Dependency Injection** setup.

This project is perfect for learning scalable architecture and building production-ready apps.

---

<p align="center">
  <img src="assets/app_banner.png" width="600" />
</p>

---

## 🎥 Demo Video  
👉 Coming soon…

<p align="center">
  <a href="https://www.youtube.com/watch?v=VIDEO_ID">
    <img src="https://img.youtube.com/vi/VIDEO_ID/0.jpg" width="500" />
  </a>
</p>


---

## ⭐ Features

- ➕ Add new tasks
- ✔ Mark tasks as completed
- ✏ Edit existing tasks
- ❌ Delete tasks
- 💾 Offline storage using Hive
- 📦 Clean and scalable architecture
- 🔌 Dependency injection (GetIt)
- 🟢 Provider state management
- ⚡ Smooth UI experience

---

## 🏗 Clean Architecture Overview

```
lib/
│
├── core/
│   ├── application/
│   │   └── token_service.dart
│   └── domain/
│       └── interfaces/
│           └── interface_cache_repository.dart
│
├── features/
│   └── todo/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── task_local_datasource.dart
│       │   ├── models/
│       │   │   └── task_model.dart
│       │   └── repository/
│       │       └── task_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── task_entity.dart
│       │   └── usecases/
│       │       ├── add_task_usecase.dart
│       │       ├── delete_task_usecase.dart
│       │       ├── get_tasks_usecase.dart
│       │       └── update_task_usecase.dart
│       └── presentation/
│           ├── providers/
│           │   └── provider_task.dart
│           ├── screens/
│           │   └── todo_list_screen.dart
│           └── widgets/
│               ├── add_task_bottomsheet.dart
│               └── task_card.dart
│
├── di_container.dart
├── my_app.dart
└── main.dart

```

---

## 🔧 Tech Stack

| Layer | Technology |
|------|------------|
| UI | Flutter, Material 3 |
| State Management | Provider |
| Networking | Dio |
| API | Open Library API |
| Architecture | Clean, modular |

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/sntanju/Todo_App.git
cd Todo_App
```

## 2️⃣ Install Dependencies
```sh
flutter pub get
```

## 3️⃣ Generate Hive Adapters
```sh
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4️⃣ Run the App
```sh
flutter run
```



