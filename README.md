# FitLife

FitLife is a Flutter fitness-centre app for exploring workout programs, trainers, membership plans, and a sample user profile. It uses Material 3 and is structured for Android, iOS, web, and Windows development.

## Features

- Home dashboard with featured programs and trainers.
- Program catalogue with category filtering and program detail pages.
- Trainer catalogue and trainer detail pages.
- Membership plan browsing and local plan selection.
- Profile screen backed by in-memory state.
- Bottom navigation that preserves each section's navigation state.

## Requirements

- Flutter SDK installed and available on `PATH`.
- A supported Flutter target such as Chrome, Android, iOS, or Windows.
- For Windows desktop development, the Windows desktop toolchain must be installed. Windows may also require Developer Mode for plugin symlinks.

Check the local Flutter installation with:

```sh
flutter doctor
```

## Setup

From the project root, fetch dependencies:

```sh
flutter pub get
```

## Run

Run on Chrome:

```sh
flutter run -d chrome
```

Run on Windows:

```sh
flutter run -d windows
```

List available targets with `flutter devices`. The app uses remote Unsplash image URLs for sample program and trainer imagery, so those images require an internet connection.

## Tests and Analysis

Run the test suite and static analyzer from the project root:

```sh
flutter test
flutter analyze
```

The current regression test checks that the Riverpod providers expose the sample programs, trainers, and memberships, including bounded featured lists.

## Project Structure

```text
lib/
	data/         Sample fitness data
	models/       Program, trainer, membership, and profile models
	providers/    Riverpod state and data providers
	router/       GoRouter routes and bottom navigation shell
	screens/      Home, programs, trainers, membership, and profile screens
	theme/        Material 3 light and dark themes
	widgets/      Reusable program, trainer, membership, and section widgets
assets/images/  Bundled image assets
test/           Flutter tests
web/            Web application shell and manifest
windows/        Windows desktop runner
```

## Data and Scope

The app is currently a frontend prototype. Programs, trainers, memberships, and the initial profile are supplied by `MockData`; there is no remote API, authentication, payment processing, or persistent storage. Profile edits and membership selection live in app state and are not saved across app restarts. Membership prices and schedules are sample content, not a live booking or billing service.
