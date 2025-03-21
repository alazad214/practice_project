import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';

import 'package:maps_launcher/maps_launcher.dart';

class ShareScreen extends StatelessWidget {

  final String textToShare =
      "Check out this amazing link: https://www.example.com";
  final AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Text/Link'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _shareToFacebook(),
              child: Text('Share to Facebook'),
            ),
            ElevatedButton(
              onPressed: () => _shareToLinkedIn(),
              child: Text('Share to LinkedIn'),
            ),
            ElevatedButton(
              onPressed: () => _shareToYouTube(),
              child: Text('Share to YouTube'),
            ),
            ElevatedButton(
              onPressed: () {
                MapsLauncher.launchQuery(
                    '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');
              },
              child: Text('Open Maps'),
            ),
          ],
        ),
      ),
    );
  }

  // Share to Facebook
  void _shareToFacebook() {
    appinioSocialShare.android.shareToSMS('message', 'asdf');
  }

  // Share to LinkedIn
  void _shareToLinkedIn() {
    appinioSocialShare.android.shareToSMS('message', 'asdf');
  }

  // Share to YouTube
  void _shareToYouTube() {
    appinioSocialShare.android.shareToSMS('message', 'asdf');
  }
}
