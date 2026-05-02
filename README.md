# Uni Demo

Uni Demo is a sanitized, portfolio-ready Qt/QML mobile app that showcases the shape of Uni without exposing private backend code, Firebase configuration, product strategy, user records, or local development paths.

This repository is intentionally built as a clean demo, not as a copy of the production app. It mirrors the public-facing structure of Uni: Media, Learn, Compose, Discover, and Profile.

## Tech Stack

- Qt 6 / QML
- C++17
- `QAbstractListModel` exposed to QML
- `Q_INVOKABLE` methods for UI actions
- Signals and slots for mock authentication and upload progress
- CMake

## Features Demonstrated

- Mock sign-in and sign-out flow
- Media feed powered by a C++ `QAbstractListModel`
- Mixed feed delegates for video-style, photo-style, and text posts
- Like and bookmark mutations from QML into C++
- Compose screen with simulated upload progress
- Learn and Discover surfaces that reflect Uni's core navigation
- Profile screen with local mock profile data
- Portable CMake setup without hardcoded SDK or user paths

## What Was Intentionally Removed

- Firebase configuration files and project identifiers
- Firebase Auth, Firestore, and Storage calls
- Google services JSON files
- Generated build folders and Qt Creator user files
- Vendored SDK binaries
- Local machine paths
- Private course, creator, education, and messaging depth
- Large local demo videos

## Why Mock Services

Recruiters should be able to inspect the architecture without needing access to private infrastructure. The app keeps the C++ to QML integration points visible while replacing production services with deterministic local mocks:

- `MockAuthService` handles demo login state.
- `MockUploadService` simulates upload progress using a `QTimer`.
- `MediaFeedModel` provides in-memory feed data and mutations.
- `ProfileModel` exposes local profile data.

## Setup

Install Qt 6.5 or newer with the Quick and Multimedia modules.

Configure and build:

```powershell
cmake -S . -B build
cmake --build build
```

For Android, configure with your local Qt Android kit or Qt Creator. This project does not hardcode Android SDK or NDK paths.

## Public Repo Checklist

Before publishing, run `git status --short` and a secret scan such as Gitleaks. The scan should return no private keys, Firebase config, or local absolute paths.
