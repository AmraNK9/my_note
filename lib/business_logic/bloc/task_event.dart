part of 'task_bloc.dart';

sealed class TaskEvent {}
class Fetch extends TaskEvent{
}
class Add extends TaskEvent{
  final Note note;
  Add({required this.note});
}
class Delete extends TaskEvent{
  final int id;
  Delete({required this.id});
}
class Update extends TaskEvent{
  final Note note;
  Update({required this.note});
}

class Edit extends TaskEvent{
  final String title;
  final String content;
  Edit({ this.title = "Untitled" ,this.content = ''});
}