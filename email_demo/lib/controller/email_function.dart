import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';



class EmailFunction {
  
  sendEmail(BuildContext context ,String msg,String mailId,String subject//For showing snackbar
      ) async {
    String username = 'deshmukhdhanashree73@gmail.com'; //Your Email
    String password =
        'guri nfxc apdu irxb'; // 16 Digits App Password Generated From Google Account

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
          ..from = Address(username, 'Dhanashree')
          ..recipients.add(mailId)
          // ..ccRecipients.addAll(['abc@gmail.com', 'xyz@gmail.com']) // For Adding Multiple Recipients
          // ..bccRecipients.add(Address('a@gmail.com')) For Binding Carbon Copy of Sent Email
          ..subject = subject
          ..text = msg
        // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>"; // For Adding Html in email
        // ..attachments = [
        //   FileAttachment(File('image.png'))  //For Adding Attachments
        //     ..location = Location.inline
        //     ..cid = '<myimg@3.141>'
        // ]
        ;

    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: $sendReport');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Mail Send Successfully")));
    } on MailerException catch (e) {
      log('Message not sent.');
      log(e.message);
      for (var p in e.problems) {
        log('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
