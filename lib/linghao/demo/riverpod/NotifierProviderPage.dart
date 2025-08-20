import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

/*
当然可以！NotifierProvider 是 Riverpod 2.0 以后推荐的、用于处理复杂业务逻辑和状态的核心工具。它比 StateProvider 更强大，比 StateNotifierProvider 更简洁、更安全。 我们将通过一个经典的待办事项列表
(Todo List) 应用来详细讲解和演示它的用法。这个例子将涵盖状态的创建、读取、添加、更新和删除。 核心思想
   1. 定义状态模型 (Todo)：
               1.创建一个不可变的 Todo 类来表示每个待办事项的数据结构。
                2. 创建业务逻辑核心 (TodosNotifier)：这是我们的状态管理器。它继承自 Notifier，并包含所有修改待办事项列表的业务逻辑（如添加、删除、切换完成状态）。
                3. 创建 NotifierProvider：这个 Provider 负责创建和“提供”我们的 TodosNotifier 实例，让应用的其它部分可以访问它。
                4. 构建 UI (NotifierProviderPage)：UI 组件会监听 Provider 提供的状态。当状态改变时，UI 会自动刷新。UI 中的按钮等交互元素会调用 TodosNotifier 中的方法来更新状态。
 */

// 1. 定义状态模型 (State Model)
//    这是一个简单的 Dart 类，用于表示单个待办事项。
//    使用 `@immutable` 注解和 `const` 构造函数是好习惯，能确保状态的不可变性。
//    使用 `copyWith` 方法可以方便地创建状态的不可变副本。
@immutable
class Todo {
  const Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  final String id;
  final String description;
  final bool completed;

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

// 2. 创建 Notifier
//    - `Notifier` 是 Riverpod 中用于管理和暴露状态的核心类。
//    - 它应该是一个不可变类，其公共方法用于修改状态。
//    - 泛型 `<List<Todo>>` 定义了此 Notifier 管理的状态类型。
class TodosNotifier extends Notifier<List<Todo>> {
  // `build` 方法用于创建初始状态。
  // 当 Provider 第一次被读取时，这个方法会被调用一次。
  @override
  List<Todo> build() {
    // 返回一个空的待办事项列表作为初始状态。
    return [];
  }

  // 添加一个新的待办事项
  void addTodo(String description) {
    // `state` 属性持有当前的状态值。
    // 我们通过创建一个新的列表（包含旧的状态和新项）来更新它。
    // 这种不可变的方式是 Riverpod 和函数式编程推荐的做法。
    state = [
      ...state,
      Todo(id: const Uuid().v4(), description: description),
    ];
  }

  // 移除一个待办事项
  void removeTodo(String todoId) {
    // 创建一个不包含指定 ID 的新列表。
    state = state.where((todo) => todo.id != todoId).toList();
  }

  // 切换待办事项的完成状态
  void toggle(String todoId) {
    state = [
      for (final todo in state)
      // 我们只修改匹配 ID 的待办事项
        if (todo.id == todoId)
        // 使用 `copyWith` 创建一个副本，并切换 `completed` 状态
          todo.copyWith(completed: !todo.completed)
        else
        // 其他待办事项保持不变
          todo,
    ];
  }
}

// 3. 创建 NotifierProvider
//    - `NotifierProvider` 是用于暴露 `Notifier` 及其状态的 Provider。
//    - 它允许 UI 读取状态，并调用 Notifier 中的方法来修改状态。
final todosProvider = NotifierProvider<TodosNotifier, List<Todo>>(
  // 返回 Notifier 的一个新实例。
  TodosNotifier.new,
);

// 4. 创建 UI 页面 (ConsumerWidget)
class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 ref.watch() 监听待办事项列表的状态。
    // 当列表发生变化时，UI 会自动重建。
    final List<Todo> todos = ref.watch(todosProvider);
    final newTodoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifierProvider (Todo List)'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: newTodoController,
              decoration: const InputDecoration(
                labelText: '添加新的待办事项',
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  // 调用 Notifier 的方法来修改状态。
                  // 使用 `ref.read(provider.notifier)` 来获取 Notifier 实例。
                  ref.read(todosProvider.notifier).addTodo(value.trim());
                  newTodoController.clear();
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.description, style: TextStyle(decoration: todo.completed ? TextDecoration.lineThrough : null)),
                  leading: Checkbox(value: todo.completed, onChanged: (value) => ref.read(todosProvider.notifier).toggle(todo.id)),
                  trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () => ref.read(todosProvider.notifier).removeTodo(todo.id)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
