import 'package:flutter/material.dart';
import 'package:mathspuzzle1/lavel1.dart';
import 'package:mathspuzzle1/selectpuzzle.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(
    home: mathspuzzle(),
    debugShowCheckedModeBanner: false,
  ));
}
class mathspuzzle extends StatefulWidget {
 static SharedPreferences? prefs;
 static List<String> statuslist = [];
 static String Isclear = "clear";
 static String hpending = "pending";
 static String hskip = "skip";

  @override
  State<mathspuzzle> createState() => _mathspuzzleState();
}

int? ab;
class _mathspuzzleState extends State<mathspuzzle> {
   // SharedPreferences? prefs;
  bool sstatus = false;
  Future<void> sharepreferenctext() async {
    mathspuzzle.prefs = await SharedPreferences.getInstance();
   setState(() {
     ab = mathspuzzle.prefs!.getInt("key")??0;
     sstatus = true;
     for(int i = 0 ; i < 75 ;i++ ){
       String lavelstatus = mathspuzzle.prefs!.getString("status$i")?? mathspuzzle.hpending ;
        mathspuzzle.statuslist.add(lavelstatus);
     }
   });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharepreferenctext();
  }
  @override
  Widget build(BuildContext context) {
    return sstatus? SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("image1/background.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Math Puzzles",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      color: Colors.blue),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(40),
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image1/blackboard_main_menu.jpg"),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Lavel1(ab!);
                          },));
                        },
                        child: Text("CONTINUE",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SelectPuzzle();
                          },));
                        },
                        child: Text("PUZZLES",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.white)),
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text("BUY PRO",
                            style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                color: Colors.white)),
                      ),
                    ],
                  ),

                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("image1/ltlicon.png"),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,

                          ),
                        ],
                      ),
                      Expanded(flex: 5,
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("image1/shareus.png"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("image1/emailus.png"),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),

                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ): Center(child: CircularProgressIndicator());
  }
  
}
