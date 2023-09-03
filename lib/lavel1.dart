 // ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathspuzzle1/Puzzlelevel.dart';
import 'package:mathspuzzle1/main.dart';

class Lavel1 extends StatefulWidget {
  int ab;

  Lavel1(this.ab);

  @override
  State<Lavel1> createState() => _Lavel1State();
}

class _Lavel1State extends State<Lavel1> {
  String Text1 = "";
  static List answer = [
    "10",
    "25",
    "6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    "2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
    "50",
    "34",
    "6",
    "41",
    "16",
    "126",
    "82",
    "14",
    "7",
    "132",
    "34",
    "48",
    "42",
    "288",
    "45",
    "4",
    "111",
    "47",
    "27",
    "87",
    "22",
    "253",
    "12",
    "38",
    "178",
    "1",
    "6",
    "10",
    "2",
    "20",
    "7",
    "511",
    "143547",
    "84",
    "11",
    "27",
    "3",
    "5",
    "39",
    "31",
    "10",
    "130",
    "22",
    "3",
    "14",
    "42",
    "164045",
    "11",
    "481",
    "86",
    "84",
    "13",
    "8"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(onWillPop: Onbackpresse,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image1/gameplaybackground.jpg"),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                mathspuzzle.statuslist[widget.ab] = mathspuzzle.hskip;
                                mathspuzzle.prefs!.setString("statuslist${widget.ab}", mathspuzzle.hskip);

                                // print(mathspuzzle.statuslist);
                                setState(() {
                                  widget.ab++;
                                });
                                // print(widget.ab);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Lavel1(widget.ab);
                                  },
                                ));
                                mathspuzzle.prefs!.setInt("key", widget.ab);
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.fromLTRB(5, 10, 15, 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image1/skip.png"))),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Level ${ widget.ab + 1 }",
                                style: TextStyle(fontSize: 30),
                              ),
                              height: 50,
                              width: 250,
                              margin: EdgeInsets.fromLTRB(10, 10, 15, 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image1/level_board.png"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: EdgeInsets.fromLTRB(5, 10, 15, 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("image1/hint.png"))),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 150),
                                child: Image.asset("image1/p${widget.ab + 1}.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "$Text1",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white24),
                                onPressed: () {
                                  setState(() {
                                    Text1 = Text1.substring(0, Text1.length - 1);
                                  });
                                },
                                child: Icon(
                                  Icons.backspace,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 12 ),
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.black),
                              onPressed: () {
                                setState(() {
                                  if (Text1 == answer[widget.ab]) {
                                    String lavelstatus = mathspuzzle.statuslist[widget.ab];
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                      return Puzzlelevel(widget.ab);
                                    },));
                                    if (lavelstatus == mathspuzzle.Isclear) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return Puzzlelevel(widget.ab);
                                        },
                                      ));
                                    } else
                                      if (lavelstatus == mathspuzzle.hskip) {
                                      setState(() {
                                        mathspuzzle.statuslist[widget.ab] =
                                            mathspuzzle.Isclear;
                                        mathspuzzle.prefs!.setString("status${widget.ab}",
                                            mathspuzzle.Isclear);
                                      });
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return Puzzlelevel(widget.ab);
                                        },
                                      ));
                                    }
                                    else {
                                      mathspuzzle.statuslist[widget.ab] = mathspuzzle.Isclear;
                                      mathspuzzle.prefs!.setString("status${widget.ab}", mathspuzzle.Isclear);
                                      setState(() {
                                        widget.ab++;
                                      });
                                      mathspuzzle.prefs!.setInt("level", widget.ab);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Puzzlelevel(widget.ab - 1);
                                            },
                                          ));
                                    }
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "worg answer",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  }
                                });
                              },
                              child: Text(
                                " SUBMIT  ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("1");
                                });
                              },
                              child: Text(
                                "1",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("2");
                                });
                              },
                              child:  Text("2", textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:  EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("3");
                                });
                              },
                              child:  Text("3"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:  EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("4");
                                });
                              },
                              child:  Text("4"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:  EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("5");
                                });
                              },
                              child:  Text("5"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:  EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("6");
                                });
                              },
                              child:  Text("6"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("7");
                                });
                              },
                              child: Text("7"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("8");
                                });
                              },
                              child: Text("8"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("9");
                                });
                              },
                              child: Text("9"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.white24),
                              onPressed: () {
                                setState(() {
                                  textb("0");
                                });
                              },
                              child: Text("0"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void textb(String s) {
    setState(() {
      Text1 = Text1 + s;
    });
  }

  Future<bool> Onbackpresse() {
    showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text("are you sore exit"),
        actions: [TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return mathspuzzle();
          },));
        }, child: Text("Yas")),
        TextButton(onPressed: () {
          Navigator.pop(context);
          exit(0);
        }, child: Text("No"))
        ],
      );
    }, );
    return Future.value();
  }
}
