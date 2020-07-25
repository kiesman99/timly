import 'package:flutter/material.dart';
import 'package:tyme/utils/list_utils.dart';

Future<Duration> showTimePickerBottomSheet(BuildContext context) async {
  return await showModalBottomSheet<Duration>(
      context: context,
      isDismissible: true,
      enableDrag: false,
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      builder: (context) {
        List<int> elements = [0, 0, 0, 0];
        var count = 0;

        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    '${elements[3]}${elements[2]}m ${elements[1]}${elements[0]}s',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1.7),
                    itemBuilder: (context, index) {
                      var i = index + 1;
                      if (i == 10) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pop(Duration(
                                seconds: (elements[1] * 10) + elements[0],
                                minutes: (elements[3] * 10 + elements[2])));
                          },
                          child: Container(
                            child: Center(
                              child: Icon(Icons.check),
                            ),
                          ),
                        );
                      } else if (i == 11) {
                        return InkWell(
                          onTap: () {
                            print('0');
                            if (count != 4) {
                              elements = shiftRight(elements);
                              elements[0] = 0;
                              count++;
                              setState(() {});
                            }
                          },
                          child: Container(
                            child: Center(
                              child: Text('0',
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        );
                      } else if (i == 12) {
                        return InkWell(
                          onTap: () {
                            if (count != 0) {
                              elements = shiftLeft(elements);
                              count--;
                              setState(() {});
                            }
                          },
                          child: Container(
                            child: Center(
                              child: Icon(Icons.backspace),
                            ),
                          ),
                        );
                      }

                      return InkWell(
                        onTap: () {
                          if (count != 4) {
                            elements = shiftRight(elements);
                            elements[0] = i;
                            count++;
                            setState(() {});
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text('$i',
                                style: Theme.of(context).textTheme.headline4),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        );
      });
}
