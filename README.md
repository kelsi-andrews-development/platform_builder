<!-- 
Flutter package that automatically chooses the correct widgets for Android and IOS platforms.
The goal of this package is to provide widgets that use one set of parameters to build different 
widgets since Android and IOS widgets do not maintain consistency between each other. Another goal 
is to eliminate duplicate code and simplify platform identification while maintaining platform 
design consistency.

This is a starter README.md file. More will be added in future updates.

## Features

Supported Widgets (Android Support/IOS Support):
* PlatformApp (MaterialApp/CupertinoApp)
* PlatformAppBar (AppBar/CupertinoNavigationBar)
* PlatformButton (ElevatedButton/CupertinoButton)
* PlatformCircularProgressIndicator (CircularProgressIndicator/CupertinoActivityIndicator)
* PlatformForm (Form/CupertinoFormSection)
* PlatformFormField (TextFormField/CupertinoTextFormFieldRow)
* PlatformScaffold (Scaffold/CupertinoPageScaffold)
* PlatformSingleChildScrollView (Scrollbar>SingleChildScrollView/CupertinoScrollbar>SingleChildScrollView)

Will add links to each widget on future updates

## Getting started

Import the package and call any widget

## Usage

```dart
PlatformApp(
    title: "App Title",
    materialThemeData: {themeData},
    initialRoute: "/home"
    },
  );
```

Will add longer examples to /example folder in future updates

## Additional information

The Github repo can be found at [https://github.com/kelsi-andrews-development/platform_builder] 
I'm not entirely sure the best practices for this step, will look into rather soon.
Feel free to send an email to kelsi.andrews.development@gmail.com with issues, comments, and/or suggestions.
More information will be added relatively soon, but feel free to send an email in the meantime.
