import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 创建一个服务类，它暴露一个 Stream
//    这个 TickerService 模拟一个数据源，比如来自服务器的实时报价或通知。
class TickerService {
  // 这个方法返回一个 Stream，它会每隔一秒发出一个递增的整数。
  // 为了让演示不无限进行下去，我们用 .take(10) 让它在发出10个值后自动关闭。
  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i + 1).take(10);
  }
}

// 2. 创建一个 Provider 来提供服务实例
//    这遵循了依赖注入的最佳实践，使代码更具可测试性和可维护性。
final tickerServiceProvider = Provider<TickerService>((ref) {
  return TickerService();
});

// 3. 创建 StreamProvider
//    - `StreamProvider` 用于监听一个 Stream 并将其最新的值暴露出来。
//    - 它会自动处理 Stream 的生命周期，当不再有监听者时，它会自动关闭 Stream。
//    - 它非常适合用于实时数据，如 WebSocket、Firebase 或计时器。
final tickerProvider = StreamProvider<int>((ref) {
  // 获取 TickerService 实例
  final tickerService = ref.watch(tickerServiceProvider);
  // 返回要监听的 Stream
  return tickerService.tick();
});

// 4. 创建 UI 页面 (ConsumerWidget)
class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 5. 使用 ref.watch() 来监听 StreamProvider
    //    - `ref.watch` 返回一个 `AsyncValue<int>`。
    //    - 每当 Stream 发出一个新值时，这个 Widget 就会重建以显示新值。
    final AsyncValue<int> ticker = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider 示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'StreamProvider 正在监听一个每秒发出新数据的流:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            // 6. 使用 `when` 来处理不同的流状态
            //    - `loading`: Stream 正在等待第一个事件。
            //    - `error`: Stream 发出了一个错误。
            //    - `data`: Stream 成功发出了一个值。
            //    `when` 会优雅地处理所有情况，确保你的 UI 是完备的。
            ticker.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('错误: $err'),
              data: (value) => Text(
                '$value',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
