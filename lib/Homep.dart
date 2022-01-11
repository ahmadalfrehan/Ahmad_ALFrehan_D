import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'Cubit/Cubitfile.dart';
import 'Cubit/Status.dart';
import 'Search.dart';

class HomeP extends StatelessWidget {
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var InfoController = TextEditingController();
  var priceController = TextEditingController();
  var madfouController = TextEditingController();
  var albaqiController = TextEditingController();
  var status = "new";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit Cub = AppCubit.get(context);
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              title: Text(Cub.title[Cub.c]),
              backgroundColor: Colors.orange,
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            body: Container(
              color: Colors.black45,
              child: Cub.screens[Cub.c],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                if (Cub.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    Cub.inserToDatabase(
                      title: titleController.text,
                      time: "5555",
                      date: dateController.text,
                      Info: InfoController.text,
                      sta: status,
                      price: priceController.text,
                      madfou: madfouController.text,
                      albaqi: albaqiController.text,
                    );
                  }
                } else {
                  ScaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.title),
                                        border: UnderlineInputBorder(),
                                        labelText: 'أدخل اسم المريض'),
                                    controller: titleController,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'name must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.calendar_today),
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter the date '),
                                    controller: dateController,
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2022-05-03'))
                                          .then(
                                        (value) => dateController.text =
                                            DateFormat()
                                                .add_yMMMd()
                                                .format(value!),
                                      );
                                    },
                                    keyboardType: TextInputType.datetime,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Date must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.title),
                                        border: UnderlineInputBorder(),
                                        labelText:
                                            'Enter the Information about him'),
                                    controller: InfoController,
                                    keyboardType: TextInputType.text,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Info must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.price_change),
                                        border: UnderlineInputBorder(),
                                        labelText: 'Enter the price'),
                                    controller: priceController,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'price must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.title),
                                        border: UnderlineInputBorder(),
                                        labelText: 'almadfou'),
                                    controller: madfouController,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'this must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.title),
                                        border: UnderlineInputBorder(),
                                        labelText: 'enter albaqi'),
                                    controller: albaqiController,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'this must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                    Cub.changeBottomSheetState(
                        ISShow: false, Iconn: Icons.edit);
                  });
                  Cub.changeBottomSheetState(ISShow: true, Iconn: Icons.add);
                }
              },
              child: Icon(Cub.fbData),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).c,
              onTap: (index) {
                AppCubit.get(context).changeindex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: "New tasks"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive),
                  label: "Archive",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
