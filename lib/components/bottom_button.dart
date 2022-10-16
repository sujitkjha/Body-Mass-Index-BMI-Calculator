import 'package:flutter/material.dart';
import '../constants.dart';


class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttomTitle});

  final VoidCallback? onTap;
  final String buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttomTitle,
          style: kLargeButtontext,
        ),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}