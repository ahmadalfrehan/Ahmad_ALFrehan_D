import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/Cubitfile.dart';
import 'Cubit/Status.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit Cub = AppCubit.get(context);
        return Container(
          child: ListView.separated(
            itemBuilder: (context, index) =>
                newMethod(Cub.newtasks[index], context),
            itemCount: Cub.newtasks.length,
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

  Widget newMethod(Map model, context) {
    return Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 40.0,
              child: Text('${model['title']}'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['date']}',
                    style: TextStyle(),
                  ),
                  Text(
                    '${model['info']}',
                    style: TextStyle(),
                  ),
                  Text(
                    '${model['price']}',
                    style: TextStyle(),
                  ),
                  Text(
                    '${model['madfoua']}',
                    style: TextStyle(),
                  ),
                  Text(
                    '${model['albaqe']}',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                onPressed: () {
                  //AppCubit.get(context).DeleteDateBase(id: model['id']);
                },
                icon: Icon(Icons.delete)),
            IconButton(
              onPressed: () {
                AppCubit.get(context).UpdateDateBase(
                  sta: 'archive',
                  id: model['id'],
                );
              },
              icon: Icon(Icons.archive),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).DeleteDateBase(id: model['id']);
      },
    );
  }
}
