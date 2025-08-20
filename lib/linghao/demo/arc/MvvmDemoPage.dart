import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. Model: 负责数据和最基础的业务规则。
//    - 它是纯 Dart 类，不依赖任何 Flutter 或状态管理库。
//    - 在这个例子中，它只包含一个计数器值。
class CounterModel {
  int value = 0;
}

// 2. ViewModel: 视图模型，作为 View 和 Model 之间的桥梁。
//    - 它持有 View 所需的状态（从 Model 获取或自己维护）。
//    - 它包含 View 的业务逻辑（如响应用户事件）。
//    - 它不直接引用 View，而是通过 `ChangeNotifier` 通知 View 更新。
class CounterViewModel extends ChangeNotifier {
  final CounterModel _counter = CounterModel();

  // ViewModel 暴露给 View 的状态。
  int get count => _counter.value;

  // ViewModel 暴露给 View 的业务逻辑方法。
  void increment() {
    _counter.value++;
    // 当状态改变时，通知所有监听者（View）。
    notifyListeners();
  }
}

// 3. View: 视图层，负责展示 UI 和将用户操作传递给 ViewModel。
//    - 在 Flutter 中，View 就是 Widget。
//    - 它应该是“哑”的，只负责展示数据和发送事件，不包含复杂的业务逻辑。
class MvvmDemoPage extends StatelessWidget {
  const MvvmDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 `ChangeNotifierProvider` 来创建和提供 ViewModel 实例。
    // 这个 ViewModel 的实例对于其下的所有子 Widget 都是可访问的。
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MVVM 演示'),
        ),
        body: const CounterView(),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 `context.watch<T>()` 或 `Consumer<T>` 来监听 ViewModel 的变化。
    // 当 ViewModel 调用 `notifyListeners()` 时，这个 Widget 会自动重建。
    final viewModel = context.watch<CounterViewModel>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '你已经点击了按钮这么多次:',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '${viewModel.count}', // 从 ViewModel 获取状态并显示
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // 当按钮被点击时，调用 ViewModel 的方法来执行业务逻辑。
              // 使用 `context.read<T>()` 是因为我们在这里不需要监听变化，只是想调用一个方法。
              context.read<CounterViewModel>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '说明:\n'
              'View (本页面) 通过 `context.watch` 监听 ViewModel 的状态变化。\n'
              '点击按钮时，View 调用 ViewModel 的 `increment()` 方法。\n'
              'ViewModel 更新 Model 的数据，并调用 `notifyListeners()` 通知 View 重建。',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
