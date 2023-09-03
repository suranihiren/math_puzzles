import 'package:flutter/material.dart';
import 'package:mathspuzzle1/lavel1.dart';
import 'package:mathspuzzle1/main.dart';

class Puzzlelevel extends StatefulWidget {
  int ab;

  Puzzlelevel(int this.ab);

  @override
  State<Puzzlelevel> createState() => _PuzzlelevelState();
}

class _PuzzlelevelState extends State<Puzzlelevel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image1/background.jpg"), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image1/trophy.png"))),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushReplacement(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return Lavel1(widget.ab + 1);
                  //       },
                  //     ));
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration( color: Colors.grey),
                  //     height: 30,
                  //     width: 140,
                  //     margin: EdgeInsets.all(10),
                  //     child: Text("CONTONE"),
                  //   ),
                  // ),
                  Container(
                    height: 35,
                    width: 140,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.black12),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return Lavel1(widget.ab + 1);
                            },
                          ));
                        },
                        child: Text("CONTONE")),
                  ),
                  Container(
                    height: 35,
                    width: 140,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black12),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return mathspuzzle();
                          },));
                        },
                        child: Text("MAIN MANU")),
                  ),
                  InkWell(
                    child: Container(
                      height: 35,
                      width: 140,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black12),
                          onPressed: () {

                          },
                          child: Text("BUY PRO")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
