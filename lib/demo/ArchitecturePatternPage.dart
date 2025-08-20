import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/arc/CleanArchitectureDemoPage.dart';
import 'package:flutter_app_learn/linghao/demo/arc/MvvmDemoPage.dart';

import '../linghao/demo/arc/DddSimpleDemoPage.dart';
import '../linghao/demo/getx/GetxListPage.dart';

class ArchitecturePatternPage extends StatelessWidget {
  const ArchitecturePatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('应用架构思想'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _ArchitectureCard(
            title: 'MVVM (Model-View-ViewModel)',
            description: 'MVVM 是一种旨在将业务逻辑与 UI 分离的架构模式。它通过 ViewModel 作为 View 和 Model 之间的桥梁，实现了数据和视图的双向绑定或单向数据流。',
            implementationInFlutter: '在 Flutter 中，MVVM 可以通过多种状态管理库实现：\n'
                '• View: Widget 树，负责展示 UI 和响应用户输入。\n'
                '• ViewModel: 通常是一个 `ChangeNotifier` (使用 Provider)、`Cubit`/`Bloc` (使用 BLoC) 或 `Notifier` (使用 Riverpod)。它持有视图状态，处理业务逻辑，并通知 View 更新。\n'
                '• Model: 数据层，负责获取和处理原始数据（如 API 响应、数据库记录）。',
            advantages: '• 高度可测试性：ViewModel 不依赖 Flutter UI，可以轻松进行单元测试。\n'
                '• 关注点分离：UI 代码和业务逻辑代码清晰分离，易于维护。\n'
                '• 团队协作：UI 设计师和后端开发者可以并行工作。',
            demoPage: MvvmDemoPage(),
          ),
          _ArchitectureCard(
            title: 'Clean Architecture (洁净架构)',
            description: '洁净架构由 Robert C. Martin (Uncle Bob) 提出，其核心思想是“依赖倒置原则”。它将软件分为多个层次，规定内层不应知道任何关于外层的信息，所有依赖关系都指向中心。',
            implementationInFlutter: '在 Flutter 中，通常分为以下几层：\n'
                '• Domain (领域层): 包含核心业务逻辑和实体 (Entities) 以及用例 (Use Cases)。这是最内层，不依赖任何其他层。\n'
                '• Data (数据层): 负责实现领域层定义的接口（仓库 Repository），并处理来自网络或本地数据库的数据源 (Data Sources)。\n'
                '• Presentation (表现层): 包含 UI (View) 和状态管理逻辑 (如 BLoC, ViewModel)。它依赖于领域层来执行业务逻辑。\n'
                '• DI (依赖注入): 使用 `get_it` 或 `Riverpod` 等工具将各层依赖关系串联起来。',
            advantages: '• 独立于框架：核心业务逻辑不依赖于 Flutter 或任何状态管理库。\n'
                '• 高度可测试性：每一层都可以独立测试。\n'
                '• 易于维护和扩展：层级分明，修改一层不会影响其他层。',
            demoPage: CleanArchitectureDemoPage(),
          ),
          _ArchitectureCard(
            title: 'DDD (Domain-Driven Design - 领域驱动设计)',
            description: 'DDD 是一种软件开发方法论，强调将软件的核心复杂性放在业务领域（Domain）上。它通过与领域专家紧密合作，建立一个通用的、精确的模型和语言（通用语言 Ubiquitous Language）。',
            implementationInFlutter: 'DDD 在 Flutter 中更多是一种思想指导，而不是具体的框架。它与洁净架构可以很好地结合：\n'
                '• 实体 (Entities) 和值对象 (Value Objects): 在 `Domain` 层定义，它们是业务领域的核心。\n'
                '• 聚合根 (Aggregate Roots): 确保业务规则的一致性，是数据修改的唯一入口。\n'
                '• 仓库 (Repositories): 在 `Domain` 层定义接口，在 `Data` 层实现，用于持久化和检索聚合。\n'
                '• 领域事件 (Domain Events): 当领域中发生重要事情时，可以发布事件，解耦不同业务模块。',
            advantages: '• 聚焦业务核心：确保开发始终围绕真实的业务需求。\n'
                '• 代码即文档：代码结构和命名能清晰地反映业务模型。\n'
                '• 适应复杂业务：非常适合处理复杂且不断演变的业务系统。',
            demoPage: const DddSimpleDemoPage(),
          ),
        ],
      ),
    );
  }
}

class _ArchitectureCard extends StatelessWidget {
  final String title;
  final String description;
  final String implementationInFlutter;
  final String advantages;
  final Widget? demoPage;

  const _ArchitectureCard({
    required this.title,
    required this.description,
    required this.implementationInFlutter,
    required this.advantages,
    this.demoPage,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary);
    final subtitleStyle = Theme.of(context).textTheme.titleMedium;
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            const SizedBox(height: 8),
            Text(description, style: bodyStyle),
            const Divider(height: 24),
            Text('在 Flutter 中的实现', style: subtitleStyle),
            const SizedBox(height: 8),
            Text(implementationInFlutter, style: bodyStyle),
            const Divider(height: 24),
            Text('主要优点', style: subtitleStyle),
            const SizedBox(height: 8),
            Text(advantages, style: bodyStyle),
            if (demoPage != null) ...[
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => demoPage!),
                    );
                  },
                  icon: const Icon(Icons.play_circle_outline),
                  label: const Text('查看演示'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
