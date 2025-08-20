import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

// --- 领域层 (DOMAIN) ---

/// 值对象 (Value Object)
@immutable
class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;

  const OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

/// 聚合根 (Aggregate Root): Order
/// - 它是一个实体，是其内部所有对象（聚合）的访问入口。
/// - 外部世界不能直接修改 OrderItem，必须通过 Order 的方法。
/// - 它负责维护整个聚合的业务规则（不变量 Invariants）。
class Order {
  final String id;
  final List<OrderItem> _items;
  double _total;

  Order({required this.id, List<OrderItem>? items, double? total})
      : _items = items ?? [],
        _total = total ?? 0.0;

  // 以只读方式暴露内部状态
  List<OrderItem> get items => List.unmodifiable(_items);

  double get total => _total;

  /// 业务方法：这是向订单添加商品的唯一途径。
  /// 此方法强制执行聚合的不变量。
  void addItem(OrderItem newItem) {
    // 业务规则：不允许添加数量为 0 或负数的商品
    if (newItem.quantity <= 0) {
      throw Exception("商品数量必须为正数。");
    }
    _items.add(newItem);
    _recalculateTotal(); // 强制执行不变量：总价必须总是正确的
  }

  // 私有方法，用于维护聚合内部的一致性
  void _recalculateTotal() {
    _total = _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}

/// 仓库接口 (Repository Interface)
/// 定义了如何持久化和检索聚合根。
abstract class OrderRepository {
  Future<void> save(Order order);

  Future<Order?> findById(String id);
}

// --- 数据层 (DATA) ---

/// 仓库的内存实现 (In-Memory Repository Implementation)
/// 模拟网络或数据库操作。
class InMemoryOrderRepository implements OrderRepository {
  final Map<String, Order> _storage = {};

  @override
  Future<void> save(Order order) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));
    print('正在保存订单 ${order.id} 到 "数据库"...');
    _storage[order.id] = order;
    print('订单保存成功!');
  }

  @override
  Future<Order?> findById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _storage[id];
  }
}

// --- 表现层 (PRESENTATION) ---

/// Providers for DI using Riverpod
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  return InMemoryOrderRepository();
});

// StateNotifier for managing the Order state
final orderProvider = StateNotifierProvider<OrderNotifier, AsyncValue<Order>>((ref) {
  return OrderNotifier(ref.watch(orderRepositoryProvider));
});

class OrderNotifier extends StateNotifier<AsyncValue<Order>> {
  final OrderRepository _repository;

  OrderNotifier(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  late Order _order;

  void _init() {
    // 创建一个新订单
    _order = Order(id: const Uuid().v4());
    state = AsyncValue.data(_order);
  }

  void addProduct() {
    try {
      // 模拟添加一个商品
      final newItem = OrderItem(
        productId: 'p-${const Uuid().v4().substring(0, 4)}',
        productName: 'Flutter T-Shirt',
        quantity: 1,
        price: 99.9,
      );
      _order.addItem(newItem);
      // 更新状态，通知 UI 重建。创建新实例以确保 Riverpod 检测到状态变化。
      state = AsyncValue.data(Order(id: _order.id, items: _order.items, total: _order.total));
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveOrder(BuildContext context) async {
    final orderToSave = state.value;
    if (orderToSave == null) return;

    state = const AsyncValue.loading();
    try {
      await _repository.save(orderToSave);
      state = AsyncValue.data(orderToSave); // 保存成功后回到数据状态
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('订单保存成功!'), backgroundColor: Colors.green),
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

/// UI Page
class DddNetworkDemoPage extends ConsumerWidget {
  const DddNetworkDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DDD: 聚合与仓库'),
      ),
      body: orderState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('发生错误: $err')),
        data: (order) => _buildOrderView(context, ref, order),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(orderProvider.notifier).addProduct(),
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  Widget _buildOrderView(BuildContext context, WidgetRef ref, Order order) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '这是一个订单聚合根 (Order Aggregate Root)。所有修改都必须通过 Order 对象的方法进行，以保证业务规则的一致性。',
          ),
          const SizedBox(height: 16),
          Text('订单 ID: ${order.id}', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text('总金额: ¥${order.total.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green)),
          const Divider(height: 30),
          const Text('订单项:', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: order.items.isEmpty
                ? const Center(child: Text('购物车是空的，请添加商品。'))
                : ListView.builder(
                    itemCount: order.items.length,
                    itemBuilder: (context, index) {
                      final item = order.items[index];
                      return ListTile(
                        title: Text(item.productName),
                        subtitle: Text('ID: ${item.productId}'),
                        trailing: Text('¥${item.price} x ${item.quantity}'),
                      );
                    },
                  ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => ref.read(orderProvider.notifier).saveOrder(context),
              child: const Text('保存订单到仓库'),
            ),
          ),
        ],
      ),
    );
  }
}
