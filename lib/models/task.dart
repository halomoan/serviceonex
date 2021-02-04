// Our movie model
class Task {
  final int seq;
  final String id;
  final String title;
  final String statusID;
  final String status;
  final String location;
  final String startDate, endDate, startTime, endTime;
  final List<String> notes;
  final List<String> images;

  Task({
    this.seq,
    this.id,
    this.title,
    this.statusID,
    this.status,
    this.location,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.notes,
    this.images,
  });
}

class Request {
  final int id;
  final String desc;
  final String date, time;
  final String runMode;
  final bool completed;

  final List<Task> tasks ;
  

  Request({this.id, this.desc,this.runMode, this.date,this.time, this.completed,this.tasks 
    
  })
}

// our demo data movie data
List<Request> tasks = [
  Request(
    id: 1,
    desc: "Fix PM Tasks",    
    date: "2021-02-04",   
    time: "20:28:00",    
    runMode: "SEQ" ,
    completed: false,
    tasks: [
      Task(
        seq: 0,
        id: "TASKID1",
        location: "Basement 1",
        title: "Fix Water Pipe",
        statusID: "IP",
        status: "In-Progress",
        startDate: "",
        startTime: "",
        endDate: "",
        endTime: "",
        notes: ["Please bring toolkits", "John will join you","Gooluck"],
        images: ["https://picsum.photos/200", "https://picsum.photos/200","https://picsum.photos/200"]

      )
      
    ],
  ),
];
