import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Cubitfile.dart';
import 'Cubit/Status.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchCo = TextEditingController();

  String keborad = "ahmad";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit Cub = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: UnderlineInputBorder(),
                        labelText: 'Enter the the name to search '),
                    controller: searchCo,
                    onTap: () {},
                    onChanged: (val) {
                      setState(() {
                        keborad = val;
                      });
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                FutureBuilder(builder: (ctx, snapshot) {
                  if (snapshot.hasError) print("Error");
                  var data = snapshot.data;
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: Cub.newtasks.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: Key(Cub.newtasks[index]['id'].toString()),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.0,
                                      child: Text(
                                          '${Cub.newtasks[index]['time']}'),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${Cub.newtasks[index]['title']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${Cub.allrows[index]['date']}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${Cub.allrows[index]['status']}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${Cub.allrows[index]['price']}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${Cub.allrows[index]['madfoua']}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${Cub.allrows[index]['albaqe']}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) {},
                            );
                          })
                      : Center(child: Text("ahmadfrehan"));
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
/**LateInitializationError: Field 'database' has not been initialized.
 */