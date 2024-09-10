import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyUIWidget extends StatelessWidget {
  const MyUIWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // alignment: Alignment.center,
        color: Colors.blue,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            // color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.00),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,
                  ),
                  const Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyen Van Thanh',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nguyen Van Thanh la mot tho kim hoan noi tieng',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )),
                  const Flexible(child: Icon(CupertinoIcons.play_arrow_solid)),
                  const Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.heart_fill),
                        Text('1'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            // color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.00),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,
                  ),
                  const Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyen Van Thanh',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nguyen Van Thanh la mot tho kim hoan noi tieng',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )),
                  const Flexible(child: Icon(CupertinoIcons.play_arrow_solid)),
                  const Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.heart_fill),
                        Text('1'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            // color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.00),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,
                  ),
                  const Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nguyen Van Thanh',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nguyen Van Thanh la mot tho kim hoan noi tieng',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      )),
                  const Flexible(child: Icon(CupertinoIcons.play_arrow_solid)),
                  const Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.heart_fill),
                        Text('1'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
