import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 通知 UI 更新
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return ActionChip(
            label: Text('${provider.count}'),
            onPressed: () {
              provider.increment(); // 点击增加计数器
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  const CounterActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CounterProvider>().increment(); // 点击增加计数器
      },
    );
  }
}