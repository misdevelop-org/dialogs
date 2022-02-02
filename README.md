
## Features

Easy & handy dialogs for your apps logic 🧚🏼‍👨🏼‍💻

## Getting started

Add this import line

```dart
import 'package:dialogs/handy_dialogs.dart';
```

## Usage

Shows a dialog with given question and returns a confirmation bool

```dart
if(await confirmationDialog(context, "message", "confirmText", "cancelText")){
//function code
}
```

Displays an alert to confirm deletion \n
Shows a dialog and returns a bool

```dart
if(await deleteConfirmation(context)){
//function code
}
```

Shows a notification dialog with given title and message

```dart
notificationDialog(buildContext, "title", "message");
```

Shows a flash dialog or a simple dialog with @isFlash = false \n
You can customize background color, leading, trailing, onTap function and duration of dialog 

```dart
showText( context, "text", "subtitle", 
    backgroundColor = Colors.amber,
    seconds = 5,
    leading = Icon(Icons.info),
    trailing = [Icon(Icons.delete)],
  );
```

## Additional information

This package assumes corresponding permissions depending on platform
