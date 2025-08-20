import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'DddNetworkDemoPage.dart';

// --- 领域层 (DOMAIN) ---

/// 1. 值对象 (Value Object): Address
/// - 一个由其属性（而不是唯一 ID）定义的对象。
/// - 应该是不可变的 (immutable)。
/// - 如果两个值对象的所有属性都相等，那么它们就相等。
/// - 我们使用 `equatable` 包来轻松实现 `==` 和 `hashCode` 的比较。
@immutable
class Address extends Equatable {
  final String street;
  final String city;

  const Address(this.street, this.city);

  @override
  List<Object?> get props => [street, city];
}

/// 2. 实体 (Entity): User
/// - 一个具有唯一标识（ID）并随时间持续存在的对象。
/// - 即使其他所有属性都相同，只要 ID 不同，两个实体就是不同的。
/// - 实体是可变的，但其状态变更应通过其内部方法来控制。
class User {
  final String id;
  String name;
  Address address;

  User({required this.id, required this.name, required this.address});
}

// --- 表现层 (PRESENTATION) ---

class DddSimpleDemoPage extends StatefulWidget {
  const DddSimpleDemoPage({super.key});

  @override
  State<DddSimpleDemoPage> createState() => _DddSimpleDemoPageState();
}

class _DddSimpleDemoPageState extends State<DddSimpleDemoPage> {
  // 为演示创建实例
  final user1 = User(id: const Uuid().v4(), name: '张三', address: const Address('人民路123号', '上海'));

  // 创建一个名字相同但 ID 不同的用户
  final user2 = User(id: const Uuid().v4(), name: '张三', address: const Address('人民路123号', '上海'));

  // 创建两个属性完全相同的地址
  final address1 = const Address('北京西路456号', '北京');
  final address2 = const Address('北京西路456号', '北京');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DDD: 实体与值对象'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '实体 (Entity) - User',
              explanation: '实体由其唯一的 ID 标识。即使其他属性（如姓名）完全相同，只要 ID 不同，它们就是两个不同的实体。',
              object1Text: '用户 1: ${user1.name} (ID: ...${user1.id.substring(user1.id.length - 4)})',
              object2Text: '用户 2: ${user2.name} (ID: ...${user2.id.substring(user2.id.length - 4)})',
              areEqual: user1 == user2,
            ),
            const Divider(height: 30),
            _buildSection(
              title: '值对象 (Value Object) - Address',
              explanation: '值对象由其属性值定义。如果所有属性都相同，那么这两个对象就相等。它们通常是不可变的。',
              object1Text: '地址 1: ${address1.street}, ${address1.city}',
              object2Text: '地址 2: ${address2.street}, ${address2.city}',
              areEqual: address1 == address2,
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.network_check),
                label: const Text('查看网络示例 (聚合与仓库)'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DddNetworkDemoPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String explanation,
    required String object1Text,
    required String object2Text,
    required bool areEqual,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(explanation),
        const SizedBox(height: 16),
        Card(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(object1Text), const SizedBox(height: 8), Text(object2Text)]))),
        const SizedBox(height: 16),
        Center(
            child: Text('两个对象是否相等: $areEqual',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: areEqual ? Colors.green.shade700 : Colors.red.shade700))),
      ],
    );
  }
}
