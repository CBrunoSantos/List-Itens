import 'package:flutter_test/flutter_test.dart';
import 'package:listview/src/controller/home_controller.dart';
import 'package:listview/src/models/todo_model.dart';
import 'package:listview/src/repositories/todo_repository.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  test('Preencher variavel todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
