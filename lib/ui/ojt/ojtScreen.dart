import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swdprojectbackup/ui/blank/blankScreen.dart';
import 'package:swdprojectbackup/ui/ojt/resultScreen.dart';
import 'updateProfileScreen.dart';
import 'chooseCompScreen.dart';

class OjtScreen extends StatefulWidget {
  @override
  _OjtScreenState createState() => _OjtScreenState();
}

class _OjtScreenState extends State<OjtScreen> {

  int selectedIndex = 0;
  List<String> actionStep = ['Update','Choose','The'];
  List<String> actionStepMapping = ['Profile', 'Comp', 'Result'];
  List<String> items = ['Email', 'Phone Number', 'GPA', 'CV'];
  List<Color> colors = [Colors.blue[800], Color(0xFFffe5b4), Colors.red];

  Widget _updateProfile = UpdateProfileScreen();
  Widget _blank = BlankScreen();


  Widget getBody( )  {
    if(this.selectedIndex == 0) {
      return this._updateProfile;
    } else if(this.selectedIndex == 1) {
      return this._blank;
    } else if(this.selectedIndex == 2) {
      return this._blank;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 15.0, top: 30.0, bottom: 50.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Container(
                          height: 90.0,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                child: Container(
                                  height: 75.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: index == selectedIndex ? Color(0xFF00003f) :  Color(0xFFffe5b4),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        actionStep[index],
                                        style: TextStyle(
                                            color: index == selectedIndex ? Colors.white : Color(0xFF00003f),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        actionStepMapping[index],
                                        style: TextStyle(
                                            color: index == selectedIndex ? Colors.white: Color(0xFF00003f),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 25.0,
                              );
                            },
                            itemCount: actionStep.length,
                          ),
                        ),
                      ),
                    ]
                )
              ),

              selectedIndex == 0 ? UpdateProfileScreen() :
              selectedIndex == 1 ? ChooseCompScreen() : ResultScreen()



            ]
        )

      ),
    );
  }

}

