import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxAppareil extends StatelessWidget {
  BoxAppareil({Key? key, required this.nomAppareil, required this.iconAppareil, required this.status, required this.onChanged}) : super(key: key);

  final String nomAppareil;
  final String iconAppareil;
  final bool status;
  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: status?Colors.grey[900]: Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //icon
              Image.asset(
                iconAppareil,
                height: 80,
                color: status?Colors.white: Colors.black,
              ),
              //nom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      nomAppareil,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: status?Colors.white:Colors.black,
                      ),
                    )
                  ),
                  Transform.rotate(
                    angle: pi/2,
                    child: CupertinoSwitch(value: status, onChanged: onChanged)
                  )
                ],
              ),
              //statut
            ],
          ),
        ),
      ),
    );
  }
}
