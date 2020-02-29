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
  List<bool> _selections = List.generate(3, (_) => false);
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
            ToggleButtons(
              children: [
                Icon(Icons.local_cafe),
                Icon(Icons.fastfood),
                Icon(Icons.cake)
              ],
              isSelected: _selections,
              onPressed: (int index){
                setState(() {
                  _selections[index] = !_selections[index];
                });
              },
              color: Colors.green,
              selectedColor: Colors.blue,
              fillColor: Colors.red,
              borderRadius: BorderRadius.circular(30),
              borderWidth: 5,
              borderColor: Colors.yellow,
              selectedBorderColor: Colors.deepOrange,
              splashColor: Colors.purple,
              highlightColor: Colors.yellow,
              disabledColor: Colors.grey[300],
              disabledBorderColor: Colors.blueGrey,
            ),
            SizedBox(height: 100,),
           Text('Message duration is one second.',
            style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),),
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
