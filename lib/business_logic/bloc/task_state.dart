part of 'task_bloc.dart';
enum CrudState{loading,created,read,updated,deleted,allDeleted,favDone}



final class TaskState  {
  final List<Note> noteList ;
  final CrudState state;
  TaskState({required this.noteList,required this.state});
  copyWith({List<Note>? noteList,CrudState? state}){
    return TaskState(noteList: noteList??this.noteList, state: state??this.state);
  }
}
