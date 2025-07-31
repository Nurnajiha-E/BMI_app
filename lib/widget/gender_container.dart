import 'package:bmi_app/color/colors.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
   GenderContainer({
    super.key,
    required this.txt,
    required this.ontap,
    required this.isMale,
  });
  final String txt;
  final Function() ontap;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isMale == true && txt =='male')||(isMale == false && txt =='Female') ?darker:dark,
          ),
          margin: const EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                txt == 'male' ? Icons.male : Icons.female,
                size: 80,
                color: red,
              ),
              Text(
                txt,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
