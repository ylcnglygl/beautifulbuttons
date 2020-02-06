import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BeautifulButtons extends StatefulWidget {
  @override
  _BeautifulButtonsState createState() => _BeautifulButtonsState();
}

class _BeautifulButtonsState extends State<BeautifulButtons> {
  String _msg = ' ';
  String _msgVolume = 'Volume Up';
  String dropdownValue = 'One';
  String _dropDownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],

      appBar: AppBar(
        title: Text('Beautiful Buttons'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: (){
                showToast("FloatingAction Button");
              },
              label: Text('Search',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic),),
              splashColor: Colors.white,
              icon: Icon(Icons.search),
            ),
            RaisedButton(
              color: Colors.red[200],
              onPressed: (){
                showToast("Raised Button");
              },
              child: Text('Search',
              style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30,fontWeight: FontWeight.bold),),
              splashColor: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red[200])
              ),
            ),
            Center(
              child: Text(_msg,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
      DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 30,
        elevation: 16,
        style: TextStyle(
            color: Colors.deepPurple
        ),
        underline: Container(
          height: 4,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Three', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList(),
      ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: (){
                      showToastVolume('Volume Up IconButton');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_down),
                    onPressed: (){
                      showToastVolume('Volume Down IconButton');
                    },
                  ),
                ],
              ),
            ),
            Text('Message duration is one second.'),
          ],
        ),
      ),
    );
  }
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: 1, gravity: gravity);
  }
  void showToastVolume(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: 1, gravity: gravity);
  }
}
