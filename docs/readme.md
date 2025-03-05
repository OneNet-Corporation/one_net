
---

# 📜 Frontend-specific `README.md` (frontend/one_net/README.md)

```markdown
# OneNet Flutter Frontend

## 📱 About
This is the Flutter frontend for the OneNet project. It uses:
- Flutter SDK
- Provider for state management

---

## 🛠️ Prerequisites
- Flutter SDK installed ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Android Studio/Xcode installed
- Emulator or Physical Device available
- VS Code or Android Studio (recommended IDE)

---

## 📂 Folder Structure

```plaintext
lib/
|-- main.dart                        # Entry point
|-- app.dart                         # App-level config (routes, themes)
|-- config/                          # App-wide config (themes, constants, routes)
|-- screens/                         # Each screen (home, settings, etc.)
|-- widgets/                         # Reusable widgets (buttons, text fields, etc.)
|-- models/                          # Data models (User, Product, etc.)
|-- providers/                       # State management (Provider)
|-- services/                        # API calls, local storage
|-- utils/                           # Helpers and formatters
