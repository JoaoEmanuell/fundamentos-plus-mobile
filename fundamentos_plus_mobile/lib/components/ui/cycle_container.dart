import 'package:flutter/material.dart';

Widget cycleContainer(int number, String title, int lessons) {
  return GestureDetector(
      onTap: () {
        print("Container clicked $number");
      },
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          color: Colors.green.shade700,
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text(number.toString(),
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text("$lessons lições",
                          style: TextStyle(fontSize: 16, color: Colors.green))
                    ],
                  )
                ],
              ),
            ),
          )));
}
