
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/all_task/presentation/page/all_task_page.dart';
import 'package:todo/features/completed_todo/presentation/binding/completed_todo_binding.dart';
import 'package:todo/features/completed_todo/presentation/page/completed_todo_page.dart';
import 'package:todo/features/edite_todo/presentation/binding/edite_todo_binding.dart';
import 'package:todo/features/edite_todo/presentation/page/edite_todo_page.dart';
import 'package:todo/features/home/presentation/binding/home_page_binding.dart';
import 'package:todo/features/home/presentation/page/home_page.dart';
import 'package:todo/features/new_task/presentation/binding/new_todo_binding.dart';
import 'package:todo/features/new_task/presentation/page/new_task_page.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";
  static const String intro = "/intro";
  static const String home = "/home";
  static const String allTask = "/all_task";
  static const String newToDo = "/new_todo";
  static const String editeTodo = "/edite_todo";
  static const String completedTodo = "/completed_todo";

}

List<GetPage> appPages() => [
      GetPage(
          transition: Transition.cupertinoDialog,
          transitionDuration: 350.milliseconds,
          name: Routes.home,
          page: () => const HomePage(),
          binding: HomePageBinding()),

      GetPage(name: Routes.allTask, page: () => const AllTaskPage(), binding: AllTaskBinding()),
      GetPage(name: Routes.newToDo, page: () => const NewTodoPage(), binding: NewTodoBinding()),
      GetPage(name: Routes.editeTodo, page: () => const EditeTodoPage(), binding: EditeTodoBinding()),
      GetPage(name: Routes.completedTodo, page: () => const CompletedTodoPage(), binding: CompletedTodoBinding()),

    ];
