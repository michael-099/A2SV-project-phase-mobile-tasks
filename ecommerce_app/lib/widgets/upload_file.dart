import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromARGB(9, 0, 0, 0),
        ),
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 60,
              color: Colors.black38,
            ),
            Text(
              "upload image",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black38),
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: Text("Apply"),
                style: FilledButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
