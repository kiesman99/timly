import 'package:tyme/i18n/strings.g.dart';
import 'package:flutter/material.dart';

@immutable
class SettingsPage extends StatelessWidget {
  SettingsPage();

  final Duration setupDuration = Duration.zero;
  final bool burnInProtection = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.settings_page.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(t.settings_page.setup_time_title),
              subtitle: Text(t.settings_page.setup_time_description),
              trailing: Text('${setupDuration.inSeconds}s'),
              onTap: () async {
                // Update [setupDuration]
              },
            ),
            const Divider(),
            SwitchListTile(
              activeColor: Colors.teal[100],
              value: burnInProtection,
              title: Text(t.settings_page.burn_in_protection_title),
              subtitle: Text(t.settings_page.burn_in_protection_description),
              onChanged: (bool value) {
                // update [brunInProtection]
              },
            ),
            const Divider(),
          ],
        ));
  }
}
