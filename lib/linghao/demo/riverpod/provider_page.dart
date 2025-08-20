import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 创建一个服务类 (Service)
//    这个类代表一个我们想要在应用中共享的只读对象。
//    它没有任何可变状态，只是提供功能。
class GreetingService {
  String greet(String name) {
    if (name.isEmpty) {
      return '你好, 陌生人!';
    }
    return '你好, $name!';
  }
}

// 2. 创建一个 Provider
//    - `Provider` 是最基础的 Provider，用于暴露一个不会改变的对象实例。
//    - 它非常适合用于依赖注入，比如提供服务类 (Service) 或仓库类 (Repository)。
//    - 这个 Provider 一旦被创建，它所持有的 GreetingService 实例将不会被重建，除非 Provider 被销毁。
final greetingServiceProvider = Provider<GreetingService>((ref) {
  // `ref` 参数可以用来读取其他的 Provider，这里我们不需要。
  return GreetingService();
});

// 3. 创建 UI 页面 (ConsumerStatefulWidget)
//    - 因为我们需要处理 TextField 的输入和本地状态（显示的问候语），
//      使用 ConsumerStatefulWidget 是一个好选择。
class ProviderPage extends ConsumerStatefulWidget {
  const ProviderPage({super.key});

  @override
  ConsumerState<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends ConsumerState<ProviderPage> {
  final _textController = TextEditingController();
  String _greeting = '...'; // 用于显示问候语的本地状态

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showGreeting() {
    // 4. 使用 ref.read() 来读取 Provider 的值
    //    - `ref.read()` 用于在回调函数（如 onPressed）中获取 Provider 的值。
    //    - 它只会读取一次值，不会监听变化（因为 GreetingService 本身不会变）。
    final greetingService = ref.read(greetingServiceProvider);
    final name = _textController.text;

    setState(() {
      _greeting = greetingService.greet(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 5. UI 元素
            const Text(
              'Provider 用于提供一个只读对象，比如这里的 GreetingService。它不会像 StateProvider 那样引起UI重建，非常适合依赖注入。',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: '输入你的名字',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showGreeting,
              child: const Text('显示问候'),
            ),
            const SizedBox(height: 30),
            Text(
              _greeting,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}