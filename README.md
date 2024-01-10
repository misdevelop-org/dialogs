<img src="https://firebasestorage.googleapis.com/v0/b/misdevelop.appspot.com/o/handy_dialogs%2Freadme_images%2FPackages%20pub.dev%203.jpg?alt=media&token=a5a29f36-82db-4a73-9ec9-8fc0cc35250e" alt="Handy Dialogs">

## Features  
 Handy dialogs for your apps 🧚🏼‍👨🏼‍💻  
Easy & quick integration of frequently used dialogs
  
## Getting started

  Add this import line

```dart 
import 'package:dialogs/handy_dialogs.dart';
```
## Usage
#### Shows a dialog with given question and returns a confirmation bool

 ```dart 
 if(await confirmationDialog(
  context, "Do you agree?", "Agree", "Cancel"){
  //function code 
  }
   ```
  
 <img src="https://firebasestorage.googleapis.com/v0/b/misdevelop.appspot.com/o/handy_dialogs%2Freadme_images%2F22596C0F-2833-4B03-A724-574A8455F660.jpeg?alt=media&token=06e55503-cace-4fad-ade3-fab9cb0b9837" alt="Confirm Dialog" width="200" height="400">  
 
#### Displays an alert to confirm deletion then returns a bool  
      
```dart  
if(await deleteConfirmation(context)){   
//function code 
} 
```  

<img src="https://firebasestorage.googleapis.com/v0/b/misdevelop.appspot.com/o/handy_dialogs%2Freadme_images%2F3CAF7034-BE68-4C09-ABDD-521E6D96B6FC.jpeg?alt=media&token=974ce3ba-3cc6-4d54-964f-c598848a4736" alt="Delete Confirmation" width="200" height="400">      
      
#### Shows a notification dialog with given title and message      
      
```dart 
notificationDialog(context, "title", "message"); 
```  
  
<img src="https://firebasestorage.googleapis.com/v0/b/misdevelop.appspot.com/o/handy_dialogs%2Freadme_images%2FFB159562-6F05-4994-93FA-2970DDE5DA53.jpeg?alt=media&token=9f8c77ae-cf3b-4129-8ca5-c62136de638e" alt="Notification Dialog" width="200" height="400">      
      
#### Shows a flash dialog or a simple dialog with isFlash = false
      
```dart  
showText(
 context, 
 "text", 
 "subtitle",  
 backgroundColor = Colors.amber, 
 seconds = 5, 
 leading = Icon(Icons.info),
 trailing = [Icon(Icons.delete)], 
 );    
 ```  
 
 <img  src="https://firebasestorage.googleapis.com/v0/b/misdevelop.appspot.com/o/handy_dialogs%2Freadme_images%2F7F674431-AADD-4161-A6BE-0386BB54997C.jpeg?alt=media&token=dbb2e167-8ba9-4b9e-a14c-2ac2e2de1792" alt="Show Text" width="200" height="400">      
  
## Additional information      
 This package assumes corresponding permissions depending on platform