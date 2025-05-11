import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  Future<void> downloadFile() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) return;

    final url =
        'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
    final fileName = 'sample.pdf';

    final dir = Directory('/storage/emulated/0/Download');

    await FlutterDownloader.enqueue(
      url: url,
      savedDir: dir.path,
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Static File Download')),
      body: Center(
        child: ElevatedButton(
          onPressed: downloadFile,
          child: Text('Download PDF'),
        ),
      ),
    );
  }
}
