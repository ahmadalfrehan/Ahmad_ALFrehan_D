import 'package:ahmad_alfrehan/Cubit/Status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../ArchivedScreen.dart';
import '../NewTaskScreen.dart';
import '../Search.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int c = 0;
  List<String> title = [
    'NewTask',
    'ArchivedTasks',
  ];
  void changeindex(index) {
    c = index;
    emit(AppChanfeBottomNavBarState());
  }

  bool isBottomSheetShown = false;
  IconData fbData = Icons.edit;
  late Database database;
  List<Map> newtasks = [];
  List<Map> Archivetasks = [];
  List<Map> Searchtasks = [];
  void changeBottomSheetState({
    required bool ISShow,
    required IconData Iconn,
  }) {
    isBottomSheetShown = ISShow;
    fbData = Iconn;
    emit(AppChangeBottomSheetState());
  }

  List<Widget> screens = [
    NewTaskScreen(),
    ArchivedScreen(),
  ];
  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, info TEXT, status TEXT, price TEXT, madfoua TEXT, albaqe Text)')
            .then((value) {
          print('table created');
        }).catchError(
          (onError) =>
              print('error when create the table ${onError.toString()}'),
        );
      },
      onOpen: (database) {
        GetDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  inserToDatabase({
    required String title,
    required String time,
    required String date,
    required String Info,
    required String sta,
    required String price,
    required String madfou,
    required String albaqi,
  }) async {
    await database.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO tasks(title, date, time, info, status, price, madfoua, albaqe) VALUES("$title", "$date", "$time", "$Info", "$sta", "$price", "$madfou", "$albaqi")')
            .then((value) {
          print('$value inserted successfully');

          emit(AppInsertDataBaseState());
          GetDataFromDatabase(database);
        }).catchError(
                (error) => print('error when inserting ${error.toString()}')));
  }

  void GetDataFromDatabase(database) {
    emit(AppGetDataBaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newtasks.add(element);
        } else if (element['status'] == 'archive') {
          Archivetasks.add(element);
        }
      });
      emit(AppGetDataBaseState());
    });
  }

  List<Map> allrows = [];
  SearchInDataBase(databse) {
    emit(AppSearchDataBaseLoadState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['title'] != null) {
          allrows.add(element);
        } else
          print("no name ");
      });
      emit(AppSearchDataBaseState());
    });
  }

  void UpdateDateBase({
    required String sta,
    required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status =? WHERE id=?',
      ['$sta', id],
    ).then((value) {
      GetDataFromDatabase(database);
      emit(AppUpdateDataBaseState());
    });
  }

  void DeleteDateBase({
    required int id,
  }) {
    database.rawDelete('DELETE FROM tasks WHERE id=?', [id]).then((value) {
      GetDataFromDatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }
}
