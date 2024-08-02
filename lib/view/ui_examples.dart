import 'package:flutter/material.dart';

class MyUIWidget extends StatelessWidget {
  const MyUIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UI examples")),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "data acked kdslafj kidskin atlsd klass asdkfjkla adskfjdask"
              "data ajkdk kdslafj kljdsk aklsdfj klasdjf asdkfjkla adskfjdask"
              "data ajkdk kdslafj kljdsk aklsdfj klasdjf asdkfjkla adskfjdask",
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              textScaleFactor: 1.2,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.pink,
                backgroundColor: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                // fontFamily: 'Times New Roman',
                wordSpacing: 4,
                letterSpacing: 2,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                  // style: DefaultTextStyle.of(context).style,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      wordSpacing: 5.5),
                  children: <TextSpan>[
                    TextSpan(text: "Hello"),
                    TextSpan(
                        text: "My",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextSpan(text: "Friend")
                  ]),
            ),
            const Card(
              color: Colors.pink,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'An Lee',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
