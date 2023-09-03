import 'package:flutter/material.dart';
import 'package:mathspuzzle1/lavel1.dart';
import 'package:mathspuzzle1/main.dart';

class SelectPuzzle extends StatefulWidget {
  const SelectPuzzle({Key? key}) : super(key: key);

  @override
  State<SelectPuzzle> createState() => _SelectPuzzleState();
}

class _SelectPuzzleState extends State<SelectPuzzle> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AssetImage("image1/lock.png"))
          // ),

          child: Column(
            children: [
              Expanded(
                flex: 1,

                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Center(
                      child: Text(
                        "SELECT PUZZLE",
                        style: TextStyle(color: Colors.blue, fontSize: 30),
                      )),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: mathspuzzle.statuslist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      String levelstus = mathspuzzle.statuslist[index];
                      int levelk = mathspuzzle.prefs!.getInt("level")??0;
                      if (levelstus == mathspuzzle.Isclear) {
                        return InkWell(onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return Lavel1(index);
                          },));
                        },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(width: 3),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("image1/tick.png"))),
                          ),
                        );
                      } else if (levelstus == mathspuzzle.hskip) {
                        return InkWell(onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return Lavel1(index);
                          },));
                        },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 3),
                                borderRadius: BorderRadius.circular(20)),
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                "${index +1}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        );
                      } else {
                        if(index==levelk)
                        {
                          return InkWell(onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return Lavel1(index);
                            },));
                          },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 3),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "${index+1}",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          );
                        }
                        return Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("image1/lock.png"))),
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 300,
                margin: EdgeInsets.only(left: 270),
                decoration: BoxDecoration(
                    image:
                    DecorationImage(image: AssetImage("image1/next.png"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
