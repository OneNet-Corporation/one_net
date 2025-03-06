Here’s the **full `README.md` file** for your backend (`backend/server/README.md`). You can copy this directly into your project:

---

📄 `backend/server/README.md`

```markdown
# OneNet Backend (Dart Shelf)

## 📖 About
This is the **Dart Shelf Backend** for OneNet. It serves APIs consumed by the Flutter frontend.  
It uses:
- `shelf` (core server)
- `shelf_router` (for routing)

---

## 📂 Folder Structure

```plaintext
backend/
|-- bin/
|   |-- server.dart
|-- constants/
|   |-- globals.dart
|   |-- routes.dart
|-- services/
|   |-- ads/
|   |-- audio/
|   |-- chapters/
|   |-- ...
|   |-- auth_service.dart
|   |-- message_service.dart
|-- views/
|-- widgets/
|   |-- custom_material_controls.dart
|   |-- default_message.dart
|-- .env
|-- pubspec.yaml
|-- serviceAccountKey.json # Firebase Admin credentials (also ignored)
|-- README.md

```

---

# 🛠️ Setup & Run

## 1️⃣ Prerequisites
✅ Install Dart SDK - [Install Dart](https://dart.dev/get-dart)  
✅ Optional: Use VS Code with Dart extension for easy editing.

---

## 2️⃣ Install Dependencies
```bash
cd backend/server
dart pub get
```

---

## 3️⃣ Run the Backend
```bash
dart run bin/server.dart
```

✅ Server will start at:
```text
http://localhost:8080
```

---

## 🔗 Example API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/` | Health check (Welcome message) |
| GET | `/user/<id>` | Fetch user by ID (sample endpoint) |

---

## 🌐 Test API with Curl
```bash
curl http://localhost:8080/
curl http://localhost:8080/user/123
```

---

## 🚀 Summary - Quick Commands

| Task | Command |
|---|---|
| Install dependencies | `dart pub get` |
| Run server | `dart run bin/server.dart` |
| Test API | Use `curl` or Postman |

---



### 📦 Quick Commands Summary

| Task | Command |
|---|---|
| Install dependencies | `dart pub get` |
| Run server | `dart run bin/server.dart` |
| Lint | `dart analyze` |
| Format code | `dart format .` |
```

## ⚠️ Notes
- When deploying to production, bind to a real IP or host instead of `anyIPv4`.
- Add more files under `lib/` if needed (for models, services, controllers).

---

## ✅ Done! Ready to Serve.
```

---

Let me know if you want me to save this into a file and give you a **ready-to-download** file (`README.md`). 🚀