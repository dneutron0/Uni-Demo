# Uni Demo

Uni Demo mirrors the Uni UI structure and navigation flow while replacing private backend services with deterministic local mocks.

The QML hierarchy intentionally follows Uni: `Main.qml`, `Auth/`, `Core/`, `Shared/`, tab navigation, stack views, overlays, delegates, compose flow, chat, and creator dashboard are kept in the same shape. Demo-specific work belongs in the C++ data/service layer.

## Mock Layer

- `AuthenticationServices/MockAuthService` is represented through the QML-facing `AuthManager` singleton.
- `MediaServices/MockUploadService` backs the QML-facing `UploadManager` singleton.
- `MediaServices/MediaFeedModel` provides in-memory feed data with the same roles used by Uni QML.
- `UserServices/ProfileModel` and `UserServices/UserManager` provide local profile/user data.

## Build

Install Qt 6.5 or newer with Quick and Multimedia, then configure and build:

```powershell
cmake -S . -B build
cmake --build build
```

No private config files, vendored backend SDKs, generated user files, or local absolute development paths are required.
