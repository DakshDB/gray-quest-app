import 'package:flutter/material.dart';
import 'package:gray_quest/controller/todo_controller.dart';
import 'package:gray_quest/model/bottom_navigation.dart';
import 'package:gray_quest/model/post_model.dart';
import 'package:gray_quest/model/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gray_quest/provider/user_id_provider.dart';
import 'package:gray_quest/widget/todo_widget.dart';


class TodoScreen extends StatefulWidget {
  TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    super.initState();
    context.read(todoProvider.notifier).getTodos(context.read(userIdProvider).state);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final todoList = watch(todoProvider).data!.value;
      return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).accentColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Text(
                          "To Do List",
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and type setting industry.",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height / 50,
                        ),
                        child: TodoWidget(
                          todo: todoList[index],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 7,
                      );
                    },
                  ),
                )
              ],
            ),
          ));
    });
  }
}
