# MyFlutterStudiesApp - README V0.1.0
__Build status__
_//**TODO**_

__Tests coverage :__
_//**TODO**_

Welcome on my development repository showcasing MyFlutterStudiesApp !!

You will find here a [Flutter] application in which I will put some relevant source code written through tutorials or personal experiments !!

####### TODO list:
* [ ] Codemagic badges :rocket:
* [ ] Tests coverage :bar_chart:
* [ ] Gifs of the app :mag_right:
* [ ] Structure of the app so readers may find stuff without launching app :open_file_folder:

*Feel free to look inside this repository to see how this framework is awesome !*
## Getting Started

This README will guide you through the setup and deployment of this application on a virtual device (or physical if you have one).
##### Prerequisites

What things you need to install and how to install them

* First you will need a copy of this repository: either use "Download" feature on [this][Github root] page, or use Git CLI if you have installed it on your computer:
    * `git clone https://github.com/RcDevRIL/MyFlutterStudies.git`

* Now you need to have the Flutter SDK to use CLI and run the app on device. Please refer to [Flutter "get started"] guide.


If you went through all the steps on [flutter.dev][Flutter "get started"] you should have your favorite editor with plugins installed to connect to your device easily.
## Run app on device

Before wanting to launch the app, make sure to get the packages we chose to [build][Built_With] our app. To do so, you must run these commands:

* `flutter pub upgrade`
* `flutter pub get`

Now you can consider building and running the app :upside_down_face:

To start build-install-run process, execute this command:

`flutter run`

This will install the app on the connected device and run it. 

_If you have a real device, just plug it to the computer using your USB cable. The Flutter plugin should notice the device and will automatically add it on the list._

To start building the release .apk file, consider using this command:

`flutter build apk --release --split-per-abi`

This command will output several apks in the `/build/app/outputs/apk/release/` folder of your local repository. Choose the one that better fits your device architecture. 
## Run Unit Tests

_This paragraph explain how to trigger tests written in the **[test]** folder of this repository._

To start unit tests, execute this command:

`flutter test`

This will trigger the execution of tests. Results will be printed on your console in the end.
You may also use your IDE integrated test report tool. Depending on the IDE, you should see the results pretty easily.

## Run Integration Tests

_This paragraph explain how to trigger tests written in the **[test_driver]** folder of this repository._

To start automated integration tests, make sure you have a connected Android device and execute this command:

`flutter drive --target=test_driver/main_test.dart`

This will trigger the execution of the automated integration tests. It will launch the app on debug mode and execute implemented actions. This tool is great to enable stable integration of new releases :rocket:

But right now, the tests implemented are for demonstration purposes.

## Built With

_Direct Dependencies:_
* [Flutter] - The Google framework based on Dart used to build this app
* [provider] - The package used for handling state and logic of the app
* [provider_architecture] - The package used to implement a clean app architecture
* [flutter_modular] - The package used to implement a clean app architecture
* [http] - The package used for making HTTP requests
* [json_serializable] - The packaged used to ease json (de)serialization
* [get_it] - The packaged used to implement simple DI (Dependency Injection)

_Development/Test Dependencies:_
* [flutter_test] - The Flutter library used to implement unit tests
* [flutter_driver] - The Flutter library used to implement automated integration tests

## Contributing

To contribute please email me...or hit that PR button!! :rocket: :smile:

## Authors

* **Romain** - *Main Author* - [RcDevRIL]

See also the list of [contributors] who participated in this project.

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE.md] file for details

## Disclaimer
This app was developped under **Web** platform, I may check for other platforms later if app maturity demands it, but anyway it should work without changes! :+1:

[Flutter "get started"]: https://flutter.dev/get-started/
[Flutter]: https://github.com/flutter/flutter
[Github root]: https://github.com/RcDevRIL/MyFlutterStudies/
[Built_With]: https://github.com/RcDevRIL/MyFlutterStudies/tree/master#built-with
[test]: https://github.com/RcDevRIL/MyFlutterStudies/tree/master/test
[test_driver]: https://github.com/RcDevRIL/MyFlutterStudies/tree/master/test_driver
[Flutter]: https://github.com/flutter/flutter/
[provider]: https://pub.dev/packages/provider
[provider_architecture]: https://pub.dev/packages/provider_architecture
[flutter_modular]: https://pub.dev/packages/flutter_modular
[http]: https://pub.dev/packages/http
[get_it]: https://pub.dev/packages/get_it
[json_serializable]: https://pub.dev/packages/json_serializable
[flutter_test]: https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html
[flutter_driver]: https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html
[RcDevRIL]: https://github.com/RcDevRIL
[contributors]: https://github.com/RcDevRIL/MyFlutterStudies/contributors
[LICENSE.md]: https://github.com/RcDevRIL/MyFlutterStudies/blob/master/LICENSE
