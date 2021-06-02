// Our movie model
import 'package:flutter/material.dart';

class Task {
  final int seq;
  final String id, groupid;
  final String priorAssign, assignedTo;
  final String title;
  final String statusID;
  final String status;
  final String location;
  final String startDate, endDate, startTime, endTime;
  final Color tagColor;
  final bool isChecked;
  final List<String> notes;
  final List<String> images;

  Task({
    this.seq,
    this.groupid,
    this.id,
    this.title,
    this.assignedTo,
    this.priorAssign,
    this.statusID,
    this.status,
    this.location,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.tagColor,
    this.isChecked,
    this.notes,
    this.images,
  });
}

// List<Task> tasks = [
//   Task(
//       seq: 0,
//       groupid: "GROUPID1",
//       id: "TASKID1",
//       assignedTo: "Andy",
//       priorAssign: "",
//       location: "Basement 1",
//       title: "Fix Water Pipe",
//       statusID: "IP",
//       status: "In-Progress",
//       startDate: "2021-02-04",
//       startTime: "20:28:00",
//       endDate: "",
//       endTime: "",
//       isChecked: false,
//       tagColor: Color(0xFF23CF91),
//       notes: [
//         "Please bring toolkits",
//         "John will join you",
//         "Gooluck"
//       ],
//       images: [
//         "https://picsum.photos/200",
//         "https://picsum.photos/200",
//         "https://picsum.photos/200"
//       ])
// ];

// class TaskRequest {
//   final int id;
//   final String desc;
//   final String date, time;
//   final String runMode;
//   final bool completed;

//   final List<Task> tasks;

//   TaskRequest(
//       {this.id,
//       this.desc,
//       this.runMode,
//       this.date,
//       this.time,
//       this.completed,
//       this.tasks});
// }

// // our demo data movie data
// List<TaskRequest> taskRequests = [
//   TaskRequest(
//     id: 1,
//     desc: "Fix PM Tasks",
//     date: "2021-02-04",
//     time: "20:28:00",
//     runMode: "SEQ",
//     completed: false,
//     tasks: [
//       Task(
//           seq: 0,
//           id: "TASKID1",
//           assignedTo: "Andy",
//           priorAssign: "",
//           location: "Basement 1",
//           title: "Fix Water Pipe",
//           statusID: "IP",
//           status: "In-Progress",
//           startDate: "2021-02-04",
//           startTime: "20:28:00",
//           endDate: "",
//           endTime: "",
//           notes: [
//             "Please bring toolkits",
//             "John will join you",
//             "Gooluck"
//           ],
//           images: [
//             "https://picsum.photos/200",
//             "https://picsum.photos/200",
//             "https://picsum.photos/200"
//           ])
//     ],
//   ),
// ];
