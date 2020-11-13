import 'package:flutter/material.dart';
import 'package:swdprojectbackup/models/companyChoose.dart';

class ChooseCompScreen extends StatefulWidget {
  @override
  _ChooseCompScreenState createState() => _ChooseCompScreenState();
}

class _ChooseCompScreenState extends State<ChooseCompScreen> {
  List<CompanyChoose> _companies1 = CompanyChoose.getCompanies();
  List<DropdownMenuItem<CompanyChoose>> _dropdownMenuItem1;
  CompanyChoose _selectedCompany1;

  List<DropdownMenuItem<CompanyChoose>> buildDropdownMenuItem(List companies) {
    List<DropdownMenuItem<CompanyChoose>> items = List();
    for (CompanyChoose com in _companies1) {
      items.add(DropdownMenuItem(
        value: com,
        child: Text('Company: ' + com.comName + ', Main: ' + com.comMain),
      ));
    }
    return items;
  }

  onChangeDropdownItem(CompanyChoose selectedCom) {
    setState(() {
      _selectedCompany1 = selectedCom;
    });
  }

  @override
  void initState() {
    _dropdownMenuItem1 = buildDropdownMenuItem(_companies1);
    _selectedCompany1 = _dropdownMenuItem1[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0)),
              color: Color(0xFF00003f),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Select Company 1 ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            value: _selectedCompany1,
                            items: _dropdownMenuItem1,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: onChangeDropdownItem,
                            underline: Container(
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Selected: ${_selectedCompany1.comName} - ${_selectedCompany1.comMain}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Select Company 2 ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            value: _selectedCompany1,
                            items: _dropdownMenuItem1,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: onChangeDropdownItem,
                            underline: Container(
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Selected: ${_selectedCompany1.comName} - ${_selectedCompany1.comMain}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Select Company 3 ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            value: _selectedCompany1,
                            items: _dropdownMenuItem1,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: onChangeDropdownItem,
                            underline: Container(
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Selected: ${_selectedCompany1.comName} - ${_selectedCompany1.comMain}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
