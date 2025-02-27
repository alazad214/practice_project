import 'package:flutter/material.dart';
import 'package:test_project/url_launcher/url_launcher_helper.dart';

class UrlLauncherScreen extends StatelessWidget {
  const UrlLauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Url Launcher'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Open Url-->>
              ElevatedButton(
                  onPressed: () {
                    LauncherHelper.openUrl('https://www.figma.com');
                  },
                  child: Text('Open Url')),

              //Open email-->>

              ElevatedButton(
                  onPressed: () {
                    LauncherHelper.sendEmail(
                        'alazad214@gmail.com', 'no subject', 'dhaka');
                  },
                  child: Text('Send Email')),

              //send sms-->>
              ElevatedButton(
                  onPressed: () {
                    LauncherHelper.sendSms('01700000000', 'Hello');
                  },
                  child: Text('Send SMS')),

              //send to whatsapp-->>

              ElevatedButton(
                  onPressed: () {
                    LauncherHelper.sendToWhatsApp('01700000000', 'No Message');
                  },
                  child: Text('Send To WhatsApp')),

              //Open dial app-->>

              ElevatedButton(
                  onPressed: () {
                    LauncherHelper.numberLauncher('01700000000');
                  },
                  child: Text('Number Launcher')),

              //open map-->>
              ElevatedButton(
                  onPressed: () {
                    LauncherHelper.openMap(
                        "26.085653429174577", "88.27635182998456");
                  },
                  child: Text('Open Map')),
            ],
          ),
        ));
  }
}
