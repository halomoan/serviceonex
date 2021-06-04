import 'package:flutter/material.dart';
import 'package:serviceonex/models/Task.dart';

class Utils {
  static List<Task> getMockTasks() {
    return [
      Task(
          seq: 0,
          groupid: "GROUPID1",
          id: "TASKID1",
          assignedTo: "Andy",
          priorAssign: "",
          locID: 0,
          location: "Basement 1",
          title: "Fix Any Pipe",
          statusID: "IP",
          status: "In-Progress",
          startDate: "2021-02-04",
          startTime: "20:28:00",
          endDate: "",
          endTime: "",
          isChecked: false,
          tagColor: Color(0xFF23DF91),
          notes: [
            "Please bring toolkits",
            "John will join you",
            "Gooluck"
          ],
          images: [
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200"
          ]),
      Task(
          seq: 1,
          groupid: "GROUPID1",
          id: "TASKID2",
          assignedTo: "Andy",
          priorAssign: "",
          locID: 1,
          location: "Level 1",
          title: "Fix Lamp",
          statusID: "IP",
          status: "In-Progress",
          startDate: "2020-02-04",
          startTime: "20:28:00",
          endDate: "",
          endTime: "",
          isChecked: false,
          tagColor: Color(0xFF23DF91),
          notes: [
            "Please bring toolkits",
            "John will join you",
            "Gooluck"
          ],
          images: [
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200"
          ])
    ];
  }
}
