import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Cubitfile.dart';
import 'Cubit/Status.dart';

class ArchivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        AppCubit Cub = AppCubit.get(context);
        return Container(
          child: ListView.separated(
            itemBuilder: (context, index) =>
                newMethod(Cub.Archivetasks[index], context),
            itemCount: Cub.Archivetasks.length,
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
        );
      },
    );
  }

  Padding newMethod(Map model, context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text('${model['time']}'),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${model['status']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${model['price']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${model['madfoua']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${model['albaqe']}',
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
          IconButton(
            onPressed: () {
              AppCubit.get(context).DeleteDateBase(id: model['id']);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
