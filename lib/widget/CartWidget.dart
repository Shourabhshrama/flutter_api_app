

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cart(){
  return Padding(
    padding: EdgeInsets.only(right: 18.0, left: 18.0, bottom: 8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              color: Colors.black87,
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              child: Container(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
              ),
            )
          ],
        ),
      ),
    ),
  );
}