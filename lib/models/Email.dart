import 'package:flutter/material.dart';

class Email {
  final String image, name, subject, body, time;
  final bool isAttachmentAvailable, isChecked;
  final Color tagColor;

  Email({
    this.time,
    this.isChecked,
    this.image,
    this.name,
    this.subject,
    this.body,
    this.isAttachmentAvailable,
    this.tagColor,
  });
}

List<Email> emails = List.generate(
  demodata.length,
  (index) => Email(
    name: demodata[index]['name'],
    image: demodata[index]['image'],
    subject: demodata[index]['subject'],
    isAttachmentAvailable: demodata[index]['isAttachmentAvailable'],
    isChecked: demodata[index]['isChecked'],
    tagColor: demodata[index]['tagColor'],
    time: demodata[index]['time'],
    body: emailDemoText,
  ),
);

List demodata = [
  {
    "name": "Apple",
    "image": "https://picsum.photos/200",
    "subject": "iPhone 12 is here",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": null,
    "time": "Now"
  },
  {
    "name": "Elvia Atkins",
    "image": "https://picsum.photos/200",
    "subject": "Inspiration for our new home",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "15:32"
  },
  {
    "name": "Marvin Kiehn",
    "image": "https://picsum.photos/200",
    "subject": "Business-focused empowering the world",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "14:27",
  },
  {
    "name": "Domenic Bosco",
    "image": "https://picsum.photos/200",
    "subject": "The fastest way to Design",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": Color(0xFF23CF91),
    "time": "10:43"
  },
  {
    "name": "Elenor Bauch",
    "image": "https://picsum.photos/200",
    "subject": "New job opportunities",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": Color(0xFF3A6FF7),
    "time": "9:58"
  }
];

String emailDemoText =
    "Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed";
