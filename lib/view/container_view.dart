import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Widget')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.grey,
            width: 180.0,
            height: 180.0,
            alignment: const Alignment(0.5, 0.5),
            // margin: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 5, color: Colors.orange),
              color: Colors.grey,
            ),
            transform: Matrix4.rotationZ(0.2),
            // transform: ,
            child: Text(
              ("Container").toUpperCase(),
              style: const TextStyle(
                  fontSize: 20, color: Colors.white38, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child:
              Container(
                // color: Colors.grey,
                width: 200.0,
                height: 200.0,
                alignment: const Alignment(-0.5, -0.5),
                // margin: const EdgeInsets.only(top: 50),
                // padding: const EdgeInsets.symmetric(vertical: 8),
                // padding: const EdgeInsets.only(left: double.infinity),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 5, color: Colors.orange),
                  color: Colors.brown,
                ),
                transform: Matrix4.rotationZ(-0.2),
                // transform: ,
                child: Text(
                  ("Container").toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, color: Colors.white38, fontWeight: FontWeight.bold),
                ),
              ),

          ),
          Container(
            // color: Colors.grey,
            width: 150.0,
            height: 150.0,
            alignment: const Alignment(0, -0.75),
            // margin: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 5, color: Colors.orange),
              color: Colors.green,
            ),
            transform: Matrix4.rotationZ(-0.2),
            // transform: ,
            child: Text(
              ("Container").toUpperCase(),
              style: const TextStyle(
                  fontSize: 15, color: Colors.white38, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
