import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewEmployee extends StatefulWidget{
  ViewEmployee() : super();

  _ViewEmployeeScreen createState() => _ViewEmployeeScreen();
}

class _ViewEmployeeScreen extends State<ViewEmployee>{

  var _employeeSearch;
  final employeeSearch = new TextEditingController();
  double iconSize = 40;
  var _employeeName;
  final employeeName = new TextEditingController();
  var _employeePhone;
  final employeePhone = new TextEditingController();
  var _employeePass;
  final employeePass = new TextEditingController();
  var _employeeEmail;
  final employeeEmail = new TextEditingController();

  String name = 'Von Seyha';
  String email = 'seyha@gmail.com';
  String phonenumber = '0969840040';

  TextEditingController _textFieldController = TextEditingController();

  Future<File> imageFile;


  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 130,
            height: 130,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return  Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightBlueAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                image: NetworkImage('https://www.pngitem.com/pimgs/m/78-786293_1240-x-1240-0-avatar-profile-icon-png.png'),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                children: [
                  Container(
                    height: 400.0,
                    width: 900.0,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                showImage(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: new Text(
                                        "Select Image",
                                        style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontFamily: 'RobotoMono',
                                        )
                                    ),
                                    color: Colors.lightBlueAccent,
                                    colorBrightness: Brightness.light,
                                    onPressed: () {
                                      pickImageFromGallery(ImageSource.gallery);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children:[
                              Container(
                                margin: const EdgeInsets.only(left: 30.0),
                                width: 500.0,
                                child: new TextFormField(
                                  controller: _employeeName,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Name",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(left: 40.0),
                                width: 500.0,
                                child: new TextFormField(
                                  controller: employeePhone,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Phone Number",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),

                            ],
                          ),

                          Row(
                            children:[
                              Container(
                                margin: const EdgeInsets.only(top: 20.0,left: 30.0),
                                width: 500.0,
                                child: new TextFormField(
                                  controller: _employeeEmail,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Email",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 20.0,left: 40.0),
                                width: 500.0,
                                child: new TextFormField(
                                  controller: employeePass,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Password",
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      borderSide: new BorderSide(
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),


                  )
                ],
              ),

            ),


            actions: <Widget>[
              new FlatButton(
                child: new Text('concel',style: new TextStyle(fontSize: 17.0,color:Colors.white),),
                color: Colors.orange,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('submit',style: new TextStyle(fontSize: 17.0,color:Colors.white),),
                color: Colors.lightBlueAccent,

                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],

          );
        });
  }

  _displayDialogView(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top:100,left: 20),
                        width:500,
                        height:400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:AssetImage("images/employee_icon.png"),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 100.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width:150,
                                height:150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage("images/iconprofile.png"),
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(top:20.0),
                                child: new Text(
                                  'Name : $name',
                                  style: new TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: 'RobotoMono',
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:20.0),
                                child: new Text(
                                  'Email : $email',
                                  style: new TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: 'RobotoMono',
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:20.0),
                                child: new Text(
                                  'Phone Number : $phonenumber',
                                  style: new TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: 'RobotoMono',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding:EdgeInsets.symmetric(horizontal:10.0),
                      margin: const EdgeInsets.only(top:100),
                      child:Container(
                        height:30,
                        color:(Colors.orange),
                      )
                  ),
                ],
              ),
            ),

            actions: <Widget>[
              Container(
                margin: const EdgeInsets.all(20),
                width: 130.0,
                height: 40.0,
                child: new FlatButton(
                  child: new Text('concel',style: new TextStyle(fontSize: 20.0,color:Colors.white),),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],

          );
        });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 800.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70.0,
                    width: 1600.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 20.0),
                      child: new Text(
                        'Dashbaord / All Employees',
                        style: new TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),

                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    height: 70.0,
                    width: 1238.0,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: new Text(
                            'EMPLOYEE LIST',
                            style: new TextStyle(
                              fontFamily: 'RobotoMono',
                              fontSize: 30.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(left: 850.0),
                          height: 45.0,
                          child: new RaisedButton(
                            child: new Text(
                                "Add New",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontFamily: 'RobotoMono',
                                )
                            ),
                            colorBrightness: Brightness.light,
                            onPressed: () {
                              _displayDialog(context);
                            },
                            color: Colors.lightBlueAccent,
                            shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:15.0,right: 900.0),
                    width: 350.0,
                    height: 50.0,
                    child: TextField(
                      controller: _employeeSearch,
                      decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          )
                      ),
                    ),
                  ),

                  Container(
                      child:Column(
                        children: [
                          SizedBox(
                            height: 500,
                            child: ListView(
                              children: [
                                DataTable(
                                  columns: [
                                    DataColumn(label: new Text(
                                      'No',
                                      style: new TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.red,
                                      ),
                                    )),
                                    DataColumn(label: new Text(
                                      'Image',
                                      style: new TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    )
                                    ),
                                    DataColumn(
                                        label: new Text(
                                          'Name',
                                          style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        )
                                    ),

                                    DataColumn(
                                        label: new Text(
                                          'Phone Number',
                                          style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        )
                                    ),

                                    DataColumn(
                                        label: new Text(
                                          'Action',
                                          style: new TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        )
                                    ),
                                  ],

                                  rows: [
                                    DataRow(cells: [
                                      DataCell(new Text(
                                        '1',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color:Colors.red,
                                        ),
                                      )),
                                      DataCell(
                                        Container(
                                          width:90,
                                          height:90,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:AssetImage("images/iconprofile.png"),
                                            ),
                                          ),
                                        )
                                      ),
                                      DataCell( new Text(
                                        'Von Seyha',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell( new Text(
                                        '0969840040',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "view",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      _displayDialogView(context);
                                                      //push to new page----------------------------
                                                    },
                                                    color: Colors.greenAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: 85.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.only(bottom: 2.0 , left: 10.0 ),
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "edit",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize:15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page--------------------
                                                    },
                                                    color: Colors.lightBlueAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),
                                                //New button in row
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "delete",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page--------------------------
                                                    },
                                                    color: Colors.red,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                          )
                                      ),
                                    ]),

                                    DataRow(cells: [
                                      DataCell(new Text(
                                        '1',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color:Colors.red,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            width:90,
                                            height:90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:AssetImage("images/iconprofile.png"),
                                              ),
                                            ),
                                          )
                                      ),
                                      DataCell( new Text(
                                        'Von Seyha',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell( new Text(
                                        '0969840040',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "view",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.greenAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: 85.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.only(bottom: 2.0 , left: 10.0 ),
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "edit",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize:15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.lightBlueAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),
                                                //New button in row
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "delete",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.red,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                          )
                                      ),
                                    ]),

                                    DataRow(cells: [
                                      DataCell(new Text(
                                        '1',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color:Colors.red,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            width:90,
                                            height:90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:AssetImage("images/iconprofile.png"),
                                              ),
                                            ),
                                          )
                                      ),
                                      DataCell( new Text(
                                        'Von Seyha',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell( new Text(
                                        '0969840040',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "view",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.greenAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: 85.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.only(bottom: 2.0 , left: 10.0 ),
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "edit",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize:15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.lightBlueAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),
                                                //New button in row
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "delete",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.red,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                          )
                                      ),
                                    ]),

                                    DataRow(cells: [
                                      DataCell(new Text(
                                        '1',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color:Colors.red,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            width:90,
                                            height:90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:AssetImage("images/iconprofile.png"),
                                              ),
                                            ),
                                          )
                                      ),
                                      DataCell( new Text(
                                        'Von Seyha',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell( new Text(
                                        '0969840040',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "view",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.greenAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: 85.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.only(bottom: 2.0 , left: 10.0 ),
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "edit",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize:15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.lightBlueAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),
                                                //New button in row
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "delete",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.red,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                          )
                                      ),
                                    ]),

                                    DataRow(cells: [
                                      DataCell(new Text(
                                        '1',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color:Colors.red,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            width:90,
                                            height:90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:AssetImage("images/iconprofile.png"),
                                              ),
                                            ),
                                          )
                                      ),
                                      DataCell( new Text(
                                        'Von Seyha',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell( new Text(
                                        '0969840040',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "view",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.greenAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: 85.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.only(bottom: 2.0 , left: 10.0 ),
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "edit",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize:15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.lightBlueAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),
                                                //New button in row
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "delete",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.red,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                          )
                                      ),
                                    ]),

                                    DataRow(cells: [
                                      DataCell(new Text(
                                        '1',
                                        style: new TextStyle(
                                          fontSize: 15,
                                          color:Colors.red,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            width:90,
                                            height:90,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:AssetImage("images/iconprofile.png"),
                                              ),
                                            ),
                                          )
                                      ),
                                      DataCell( new Text(
                                        'Von Seyha',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell( new Text(
                                        '0969840040',
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      )),
                                      DataCell(
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "view",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //----------------------------
                                                    },
                                                    color: Colors.greenAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  width: 85.0,
                                                  height: 35.0,
                                                  padding: const EdgeInsets.only(bottom: 2.0 , left: 10.0 ),
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "edit",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize:15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      _displayDialog(context);
                                                    },
                                                    color: Colors.lightBlueAccent,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                ),
                                                //New button in row
                                                Container(
                                                  padding: const EdgeInsets.only(bottom: 2.0 ,left: 10.0),
                                                  width: 85.0,
                                                  height: 35.0,
                                                  child: new RaisedButton(
                                                    child: new Text(
                                                        "delete",
                                                        style: new TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontFamily: 'RobotoMono',
                                                        )
                                                    ),
                                                    colorBrightness: Brightness.light,
                                                    onPressed: () {
                                                      //push to new page
                                                    },
                                                    color: Colors.red,
                                                    shape:  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                      ),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
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