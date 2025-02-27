- [Fundamentos Plus Mobile](#fundamentos-plus-mobile)
  - [Demo](#demo)
  - [Features](#features)
  - [Running Locally](#running-locally)
    - [Requirements](#requirements)
    - [Steps to Run](#steps-to-run)
  - [Deployment](#deployment)
  - [Technologies Used](#technologies-used)
  - [Tests](#tests)
    - [Android Compatibility](#android-compatibility)
  - [Contributing](#contributing)
  - [Authors](#authors)
  - [License](#license)

[Português Brasil](./README-pt_br.md)

# Fundamentos Plus Mobile

**Fundamentos Plus Mobile** is the mobile version of the [Fundamentos Plus](https://github.com/JoaoEmanuell/fundamentos-plus-web) project.

Developed with Flutter, the app works entirely offline, allowing users to access lessons from the first execution.

## Demo

<video src="./docs/video.mp4" width="1280" height="720" controls></video>

## Features

- 100% offline operation.
- Automatic lesson updates.
- Light and dark modes.
- PDF downloads.
- Lesson progress tracking.

## Running Locally

### Requirements

```bash
Flutter >= 3.30.0-1.0.pre.220
Dart >= 3.8.0
Android SDK >= 34.0.0
```

### Steps to Run

Clone the repository:

```bash
git clone https://github.com/JoaoEmanuell/fundamentos-plus-mobile
```

Navigate to the project directory:

```bash
cd fundamentos-plus-mobile
```

Run the application:

```bash
flutter run
```

## Deployment

To deploy this project, follow the instructions for generating the signing key available [here](https://docs.flutter.dev/deployment/android#create-an-upload-keystore).

After setting up the key, generate the APK with the following command:

```bash
flutter build apk
```

## Technologies Used

- Flutter
- Dart
- Material Design

## Tests

To run automated tests, use the following command:

```bash
flutter test --coverage
```

For more details on tests, see the documentation available [here](./docs/TESTS_DETAILS.md).

### Android Compatibility

Version | Status            | Type         
:--:    | :--:              | :--:         
**15**  | ❌ *Not tested*  |
**14**  | ✅ **Completed**  | **Physical**
**13**  | ✅ **Completed**  | **Emulator**
**12**  | ✅ **Completed**  | **Emulator**
**11**  | ✅ **Completed**  | **Physical**
**10**  | ✅ **Completed**  | **Emulator**
**9.0** | ✅ **Completed**  | **Emulator**
**8.0** | ✅ **Completed**  | **Emulator**
**7.0** | ✅ **Completed**  | **Emulator**
**6.0** | 🟨 **Partially tested** | **Emulator**
**5.1** | 🟨 **Partially tested** | **Emulator**
**5.0** | ✅ **Completed**  | **Emulator**

## Contributing

Contributions are always welcome! 

You can contribute by suggesting new features, reporting bugs, or opening pull requests with improvements.

## Authors

- [@JoaoEmanuell](https://www.github.com/JoaoEmanuell)

## License

This project is licensed under the [MIT](https://github.com/JoaoEmanuell/dmyrn/blob/master/LICENSE) license.
