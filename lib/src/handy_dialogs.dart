import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sound_library/sound_library.dart';

TextStyle text = const TextStyle(
  fontSize: 23,
  color: Colors.white,
);

///Delete confirmation dialog
///Shows a dialog with cancel and delete buttons and returns a confirmation bool
Future<bool> deleteConfirmation(
  BuildContext context, {
  bool enableSound = true,
  String? message,
  Widget? denyMessage,
  Widget? confirmMessage,
  Color? denyButtonColor,
  Color? confirmButtonColor,
  AsyncCallback? onPressedDeny,
  AsyncCallback? onPressedConfirm,
}) async {
  return await showDialog<bool>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(message ?? "Confirm delete?"),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: denyButtonColor ?? Colors.blueGrey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: denyMessage ??
                      TextButton(
                          child: Text(
                            "Cancel",
                            style: text,
                          ),
                          onPressed: onPressedDeny ??
                              () {
                                if (enableSound) SoundPlayer.play(Sounds.click);
                                Navigator.of(context).pop(false);
                              }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: confirmButtonColor ?? Colors.red[800],
                  child: TextButton(
                      child: confirmMessage ??
                          Text(
                            "Delete",
                            style: text,
                          ),
                      onPressed: onPressedConfirm ??
                          () {
                            if (enableSound) SoundPlayer.play(Sounds.deleted);
                            Navigator.of(context).pop(true);
                          }),
                ),
              )
            ],
          );
        },
      ) ??
      false;
}

///Confirmation dialog
///Shows a dialog with cancel and confirm buttons and returns a confirmation bool
Future<bool> confirmationDialog(
  BuildContext context,
  String message,
  String confirmMessage,
  String cancelMessage, {
  Widget? textMessage,
  AsyncCallback? onPressedDeny,
  AsyncCallback? onPressedConfirm,
}) async {
  return await showDialog<bool>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: textMessage ?? Text(message),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            children: <Widget>[
              FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: onPressedDeny ??
                          () {
                            Navigator.of(context).pop(false);
                          },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.red[600],
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 25,
                            ),
                            Text(
                              cancelMessage,
                              style: text,
                            ),
                          ],
                        ),
                      ),
                    ), //Deny Button
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                        onPressed: onPressedConfirm ??
                            () {
                              Navigator.of(context).pop(true);
                            },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green[600],
                          ),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 25,
                              ),
                              Text(
                                confirmMessage,
                                style: text,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), //Agree Button
                  ],
                ),
              )),
            ],
          );
        },
      ) ??
      false;
}

///Notification dialog
///Shows a notification dialog with given title and message
Future<bool> notificationDialog(
  BuildContext buildContext,
  String title,
  String message, {
  Widget? titleMessage,
  Widget? contentMessage,
  Widget? closeButtonText,
  Widget? goToButtonText,
  Function? onTap,
  String? path,
  Color? flashBackgroundColor,
  Color? closeDialogButtonColor,
  Color? goToDialogButtonColor,
}) async {
  try {
    return (await showFlash(
          context: buildContext,
          duration: const Duration(seconds: 5),
          builder: (context, controller) {
            return Flash(
              controller: controller,
              position: FlashPosition.bottom,
              child: GestureDetector(
                onTap: () {
                  if (onTap != null) onTap();
                },
                child: FlashBar(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  behavior: FlashBehavior.floating,
                  margin: const EdgeInsets.all(20),
                  backgroundColor: flashBackgroundColor ?? Colors.blue[800],
                  title: titleMessage ??
                      Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                  content: contentMessage ??
                      Text(
                        message,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 20),
                      ),
                  controller: controller,
                ),
              ),
            );
          },
        ) as bool?) ??
        false;
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
    return await showDialog<bool>(
          context: buildContext,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: titleMessage ?? Text(title),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: contentMessage ??
                      Text(
                        message,
                        style: TextStyle(
                            color: Colors.blueGrey[600], fontSize: 15),
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
                        color: closeDialogButtonColor ?? Colors.blue[800],
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: closeButtonText ??
                                const Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: goToDialogButtonColor ?? Colors.green[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            if (onTap != null) onTap();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: goToButtonText ??
                                const Text(
                                  "Go",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
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
        ) ??
        false;
  }
}

///Information dialog
///Shows a flash dialog or a simple dialog with @isFlash = false
Future<bool> showText(
  BuildContext context,
  String title,
  String subtitle, {
  bool isNotification = false,
  bool isFlash = true,
  int seconds = 5,
  Color? backgroundColor,
  Widget? leading,
  Widget? titleMessage,
  Widget? subtitleMessage,
  Widget? closeTextDialog,
  List<Widget>? trailing,
  Function? onTap,
}) async {
  try {
    if (isFlash) {
      return (await showFlash(
            context: context,
            duration: Duration(seconds: seconds),
            transitionDuration: Duration(seconds: isNotification ? 2 : 1),
            builder: (context, controller) {
              return Flash(
                forwardAnimationCurve: Curves.elasticInOut,
                reverseAnimationCurve: Curves.elasticInOut,
                controller: controller,
                position: FlashPosition.bottom,
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap();
                  },
                  child: FlashBar(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(!isNotification ? 0 : 20))),
                    margin: !isNotification
                        ? EdgeInsets.zero
                        : const EdgeInsets.all(20),
                    shouldIconPulse: false,
                    icon: SizedBox(height: 30, width: 30, child: leading),
                    actions: trailing,
                    backgroundColor: backgroundColor ?? Colors.blue[800],
                    title: titleMessage ??
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                    content: subtitleMessage ??
                        Text(
                          subtitle,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 16),
                        ),
                    controller: controller,
                  ),
                ),
              );
            },
          ) as bool?) ??
          false;
    } else {
      return await showDialog<bool>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: titleMessage ??
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.green[900], fontSize: 25),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: subtitleMessage ??
                          Text(
                            subtitle,
                            style: TextStyle(
                                color: Colors.brown[900], fontSize: 15),
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: closeTextDialog ??
                              const Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                        ),
                      ),
                    ),
                  ],
                );
              }) ??
          false;
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
    return false;
  }
}
