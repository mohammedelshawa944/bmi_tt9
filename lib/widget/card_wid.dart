import 'package:bmi_tt9/constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget ({
    Key? key,
    required this.widGet,
    required this.colorwid,
  }) : super(key: key);

  final Widget widGet;
  final Color colorwid;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorwid,
      ),
      child: widGet,
    );
  }
}
