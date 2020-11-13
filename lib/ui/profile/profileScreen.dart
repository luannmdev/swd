import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swdprojectbackup/models/account.dart';
import 'package:swdprojectbackup/models/profile.dart';
import 'package:swdprojectbackup/ui/profile/profileViewModel.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FocusNode textFieldFocus_0;
  FocusNode textFieldFocus_1;
  FocusNode textFieldFocus_2;
  FocusNode textFieldFocus_3;
  final textController_0 = TextEditingController();
  final textController_1 = TextEditingController();
  final textController_2 = TextEditingController();
  final textController_3 = TextEditingController();
  Set<int> listEdit = new Set<int>();

  Widget _circleAvatar() {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 5),
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/avt.jpg'),
        ),
      ),
    );
  }

  Widget _textFormField({
    id,
    String hintText,
    IconData icon,
    bool editable,
    FocusNode focusNode,
    TextEditingController controller
  }) {
    final int textId = id;
    return Material(
      elevation: 2,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: new TextField(
              focusNode: focusNode,
              readOnly: !listEdit.contains(textId),
              // enabled: listEdit.contains(textId),
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  prefixIcon: Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                  filled: true,
                  fillColor: Colors.white30),
            ),
          ),
          if (editable) IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              print('edit mode');
              setState(() {
                listEdit.add(textId);
              });
              focusNode.requestFocus();
              print(controller.text);
            },
          )
        ],
      ),



    );
  }

  Widget _textFormFieldCalling() {
    final bool editable = true;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _textFormField(
            id: 0,
            hintText: 'Full-Name',
            icon: Icons.person,
            editable: true,
            focusNode: textFieldFocus_0,
            controller: textController_0
          ),
          SizedBox(height: 3),
          _textFormField(
            id: 1,
            hintText: 'E-mail',
            icon: Icons.mail,
            editable: true,
              focusNode: textFieldFocus_1,
              controller: textController_1
          ),
          SizedBox(height: 3),
          _textFormField(
            id: 2,
            hintText: 'Contact Number',
            icon: Icons.phone,
            editable: true,
              focusNode: textFieldFocus_2,
              controller: textController_2
          ),
          SizedBox(height: 3),
          _textFormField(
            id: 3,
            hintText: 'GPA',
            icon: Icons.person,
            editable: true,
              focusNode: textFieldFocus_3,
              controller: textController_3
          ),
          SizedBox(height: 3),
          _textFormField(
            id: 4,
            hintText: 'Major',
            icon: Icons.work,
            editable: false,
          ),

          SizedBox(height: 3),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 55,
            width: 150,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Provider.of<ProfileViewModel>(context,listen: false).getProfile();
    textFieldFocus_0 = FocusNode();
    textFieldFocus_1 = FocusNode();
    textFieldFocus_2 = FocusNode();
    textFieldFocus_3 = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_circleAvatar(), _textFormFieldCalling()],
            ),
          ),
        ],
      ),
    );
  }
}

//Color(0xff555555)
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff6361f3);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
