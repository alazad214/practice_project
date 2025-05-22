import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailSenderScreen extends StatefulWidget {
  const EmailSenderScreen({super.key});

  @override
  State<EmailSenderScreen> createState() => _EmailSenderScreenState();
}

class _EmailSenderScreenState extends State<EmailSenderScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> sendEmail() async {
    final String username = 'alazad214@gmail.com'; // তোমার ফিক্সড ইমেল
    final String password = '00000000'; // Gmail এ App Password create করতে হবে

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Your App Name') // Sender Info
      ..recipients
          .add('your_receiver_email@gmail.com') // যেখানে যাবে, তোমার email
      ..subject = 'New Message from ${emailController.text}'
      ..text = messageController.text;

    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: $sendReport');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email Sent Successfully!')),
      );
    } catch (e) {
      log('Message not sent: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send email.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Message to Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Your Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(labelText: 'Your Message'),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: sendEmail,
              child: const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
