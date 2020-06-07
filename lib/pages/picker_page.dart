import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timly/pages/timer_page.dart';
import 'package:timly/provider/timer_provider.dart';

class PickerPage extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {

  int _laps;
  int _intervalDuration;
  int _recoverDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timly"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              onChanged: (text) {
               _laps = int.parse(text);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Runden"
              ),
            ),
            TextField(
              onChanged: (text) {
                _intervalDuration = int.parse(text);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Intervall (in Sekunden)"
              ),
            ),
            TextField(
              onChanged: (text) {
                _recoverDuration = int.parse(text);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Pause (in Sekunden)"
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
            create: (_) => TimerProvider(const Duration(seconds: 3), Duration(seconds: 2), Duration(seconds: 5), 4),
            child: TimerPage(),
          )));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
