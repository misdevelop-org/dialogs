import 'package:flutter/material.dart';

/// Red cancel and green proceed buttons
class ConfirmDenyButtons extends StatefulWidget {
  final double? screenHeight;
  final double? screenWidth;
  final Function? confirm;
  final Function? deny;
  final String denyText;
  final String confirmText;

  const ConfirmDenyButtons({
    Key? key,
    @required this.deny,
    this.screenHeight,
    this.screenWidth,
    @required this.confirm,
    this.denyText = '',
    this.confirmText = '',
  }) : super(key: key);
  @override
  _ConfirmDenyButtonsState createState() => _ConfirmDenyButtonsState();
}

class _ConfirmDenyButtonsState extends State<ConfirmDenyButtons> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = widget.screenHeight ?? MediaQuery.of(context).size.height;
    screenWidth = widget.screenWidth ?? MediaQuery.of(context).size.width;
    TextStyle text = TextStyle(fontSize: screenHeight / 34, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              widget.deny!();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.red[600], borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    widget.denyText,
                    style: text,
                  ),
                ],
              ),
            ),
          ), //Deny Button
          Padding(
            padding: EdgeInsets.only(left: screenWidth / 20),
            child: TextButton(
              onPressed: () {
                widget.confirm!();
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
                      widget.confirmText,
                      style: text,
                    ),
                  ],
                ),
              ),
            ),
          ), //Agree Button
        ],
      ),
    );
  }
}
