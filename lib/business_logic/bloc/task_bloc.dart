// ignore: depend_on_referenced_packages
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:my_note/business_logic/repositary/task_repo.dart';
import 'package:my_note/models/Notes.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(noteList: [], state: CrudState.read)) {
    on<Fetch>(_fetch);
    on<Add>(_add);
    on<Delete>(_delete);
    on<Update>(_update);
  }
  FutureOr<void> _fetch(TaskEvent event, Emitter<TaskState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(state: CrudState.loading));
    var data = await TaskRepo().getAllNotes();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(noteList: data, state: CrudState.read));
  }

  FutureOr<void> _add(Add event, Emitter<TaskState> emitter) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(state: CrudState.loading));
   await TaskRepo().createNote(event.note);
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(state: CrudState.created));
  }

  FutureOr<void> _delete(Delete event,Emitter<TaskState> emitter) async{
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(state: CrudState.loading));
    await TaskRepo().delete(event.id);
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(state: CrudState.deleted));
  }

  FutureOr<void> _update(Update event, Emitter<TaskState> emitter) async{
    emit(state.copyWith(state: CrudState.loading));
    // await TaskRepo().update()
  }

}
