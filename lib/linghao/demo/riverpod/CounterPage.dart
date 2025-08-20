import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 创建一个 Provider
//    - `StateProvider` 是最简单的 Provider，用于暴露一个可被外部修改的状态。
//    - 它非常适合用于存储简单的状态，比如枚举、字符串、布尔值或数字。
//    - `ref` 参数可以用来读取其他的 Provider。
final counterProvider = StateProvider<int>((ref) => 0);

// 2. 创建一个 ConsumerWidget 来监听 Provider
//    - `ConsumerWidget` 和 `StatelessWidget` 类似，但它的 `build` 方法多了一个 `WidgetRef` 参数。
//    - `WidgetRef` 是我们与 Provider 交互的桥梁。
class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. 使用 ref.watch() 来读取和监听 Provider 的状态
    //    - 当 `counterProvider` 的状态改变时，这个 Widget 会自动重新构建。
    final int count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider 示例'),
      ),
      body: Center(
        child: Text(
          'Count: $count',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 4. 使用 ref.read() 来修改 Provider 的状态
          //    - `ref.read(counterProvider.notifier)` 获取到状态的控制器 (StateController)。
          //    - 然后修改它的 `.state` 属性来更新状态。
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
