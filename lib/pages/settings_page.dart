import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timly/modals/time_picker_bottom_sheet.dart';

// TODO: IMPLEMENT DB
class SettingsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var setupDuration = useState(Duration.zero);
    var burnInProtection = useState(true);

    return Scaffold(
        appBar: AppBar(
          title: Text('settings_page.title').tr(),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('settings_page.setup_time_title').tr(),
              subtitle: Text('settings_page.setup_time_description').tr(),
              trailing: Text('${setupDuration.value.inSeconds}s'),
              onTap: () async {
                setupDuration.value =
                    await showTimePickerBottomSheet(context) ??
                        setupDuration.value;
              },
            ),
            Divider(),
            SwitchListTile(
              activeColor: Colors.teal[100],
              value: burnInProtection.value,
              title: Text('settings_page.burn_in_protection_title').tr(),
              subtitle:
                  Text('settings_page.burn_in_protection_description').tr(),
              onChanged: (value) {
                burnInProtection.value = value;
              },
            ),
            Divider(),
          ],
        ));
  }
}
