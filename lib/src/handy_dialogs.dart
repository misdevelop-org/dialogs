import 'dart:math';

import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sound_library/sound_library.dart';

import 'buttons.dart';

///Delete confirmation
///Shows a dialog and returns a bool
Future<bool?> deleteConfirmation(BuildContext context) async {
  TextStyle text = const TextStyle(
    fontSize: 23,
    color: Colors.white,
  );

  return (await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text("Confirm delete?"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blueGrey,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextButton(
                  child: Text(
                    "Cancel",
                    style: text,
                  ),
                  onPressed: () {
                    SoundPlayer.i.play(Sounds.click);
                    Navigator.of(context).pop(false);
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.red[800],
              child: TextButton(
                  child: Text(
                    "Delete",
                    style: text,
                  ),
                  onPressed: () {
                    SoundPlayer.i.play(Sounds.trash);
                    Navigator.of(context).pop(true);
                  }),
            ),
          )
        ],
      );
    },
  ));
}

///Dialog for confirmation
///Shows a dialog with given question and returns a confirmation bool
Future<bool> confirmationDialog(BuildContext context, String message,
    String confirmText, String cancelText) async {
  bool? res = await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(message),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        children: <Widget>[
          FittedBox(
            child: ConfirmDenyButtons(
                confirm: () {
                  Navigator.of(context).pop(true);
                },
                deny: () {
                  Navigator.of(context).pop(false);
                },
                denyText: cancelText,
                confirmText: confirmText),
          ),
        ],
      );
    },
  );
  return res ?? false;
}

///Notification dialog
///Shows a notification dialog with given title and message
notificationDialog(BuildContext buildContext, String title, String message,
    {Function? onTap, String? path, Color? backgroundColor}) async {
  try {
    if (kDebugMode) {
      print(path);
    }
    showFlash(
      context: buildContext,
      duration: const Duration(seconds: 5),
      builder: (context, controller) {
        return Flash(
          onTap: () {
            try {
              onTap!();
            } catch (err) {
              if (kDebugMode) {
                print(err);
              }
            }
          },
          backgroundColor: backgroundColor ?? Colors.blue[800],
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
            content: Text(
              message,
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
        );
      },
    );
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
    return showDialog<bool>(
      context: buildContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(title),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.blueGrey[600], fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blue[800],
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Colors.green[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        if (onTap != null) onTap();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Go",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

///Information dialog
///Shows a flash dialog or a simple dialog with @isFlash = false
Future<void> showText(BuildContext context, String text, String subtitle,
    {Color? backgroundColor,
    int seconds = 5,
    Widget? leading,
    List<Widget>? trailing,
    Function? onTap,
    bool isNotification = false,
    bool isFlash = true}) async {
  try {
    if (isFlash) {
      showFlash(
        context: context,
        duration: Duration(seconds: seconds),
        transitionDuration: Duration(seconds: isNotification ? 2 : 1),
        builder: (context, controller) {
          double width = 400;
          return Flash(
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.elasticInOut,
            barrierDismissible: true,
            backgroundColor: backgroundColor ?? Colors.lightGreen[900],
            controller: controller,
            behavior: FlashBehavior.floating,
            position: FlashPosition.bottom,
            boxShadows: kElevationToShadow[4],
            onTap: () {
              if (onTap != null) onTap();
            },
            borderWidth: isNotification ? 3 : 1,
            borderColor: isNotification
                ? Colors.white
                : backgroundColor ?? Colors.blue[800],
            borderRadius: BorderRadius.circular(isNotification ? 25 : 10),
            margin: const EdgeInsets.all(15),
            horizontalDismissDirection: HorizontalDismissDirection.horizontal,
            child: SizedBox(
              width: min(width, MediaQuery.of(context).size.width),
              child: FlashBar(
                shouldIconPulse: false,
                icon: SizedBox(height: 30, width: 30, child: leading),
                actions: trailing,
                title: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                content: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
          );
        },
      );
    } else {
      showDialog<bool>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.green[900], fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  subtitle,
                  style: TextStyle(color: Colors.brown[900], fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}
