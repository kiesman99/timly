import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:bottom_sheet_duration_picker/bottom_sheet_duration_picker.dart';


// TODO: IMPLEMENT DB
class SettingsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var setupDuration = useState(Duration.zero);
    var burnInProtection = useState(true);

    return Scaffold(
        appBar: AppBar(
          title: Text(t.settings_page.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(t.settings_page.setup_time_title),
              subtitle: Text(t.settings_page.setup_time_description),
              trailing: Text('${setupDuration.value.inSeconds}s'),
              onTap: () async {
                setupDuration.value =
                    await showDurationPickerBottomSheet(context: context) ??
                        setupDuration.value;
              },
            ),
            Divider(),
            SwitchListTile(
              activeColor: Colors.teal[100],
              value: burnInProtection.value,
              title: Text(t.settings_page.burn_in_protection_title),
              subtitle:
                  Text(t.settings_page.burn_in_protection_description),
              onChanged: (value) {
                burnInProtection.value = value;
              },
            ),
            Divider(),
          ],
        ));
  }
}
