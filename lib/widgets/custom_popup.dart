import 'package:flutter/material.dart';

void customPopup(
  BuildContext context,
  String? title,
  String? yesButtonName,
  VoidCallback? ontap,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text( 'No'))),
                  SizedBox(width: 20),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: ontap ?? () {},
                          child: Text(yesButtonName ?? 'Yes'))),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
