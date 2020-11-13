import 'package:flutter/material.dart';
import 'package:swdprojectbackup/ui/ojt/taskCard.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  List<String> items = ['Email', 'Phone Number', 'GPA', 'CV'];
  List<Color> colors = [Colors.blue[800], Color(0xFFffe5b4), Colors.red];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.only(topRight: Radius.circular(30.0)),
              color: Color(0xFF00003f),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, top: 30.0,bottom: 30.0),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return TaskCard(
                  number: (index+1).toString(),
                  item: items[index],
                  backgrClr: colors[(index % colors.length)],
                  firstCircle: colors[(index+1) % colors.length],
                  secondCircle: colors[(index+2) % colors.length],
                );
              },
              separatorBuilder: ( BuildContext context, int index ) { return SizedBox(height: 40.0,); },
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

}

