import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// UI 触发事件（Event） → BLoC 处理事件并更新状态（State） → UI 根据新状态重新渲染。
// 本例演示了 Flutter Bloc 的基本用法：
// - CounterEvent 定义了事件类型（如 IncrementEvent）。
// - CounterState 保存当前计数值。
// - CounterBloc 负责处理事件并更新状态。
// - BlocProvider 提供 Bloc 实例。
// - BlocBuilder 根据状态变化重建 UI。

//记忆方式： 事件 ， 状态 ， 处理逻辑

// 事件
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

// 状态
class CounterState {
  final int count;
  CounterState(this.count);
  // CounterState 用于保存计数器的当前值。
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    // 监听 IncrementEvent，每次收到事件时，计数加1。
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1));
    });
  }
}

// BlocDemo
class BlocDemo extends StatelessWidget {
  const BlocDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider 提供 CounterBloc 实例给子组件使用。
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BlocDemo'),
          elevation: 0,
        ),
        body: const CounterHome(),
        floatingActionButton: const CounterActionButton(),
      ),
    );
  }
}

// CounterHome
class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocBuilder 监听 CounterBloc 的状态变化，自动刷新 UI。
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return ActionChip(
            label: Text('${state.count}'),
            onPressed: () {
              // 触发 IncrementEvent，计数加1。
              context.read<CounterBloc>().add(IncrementEvent());
            },
          );
        },
      ),
    );
  }
}

// CounterActionButton
class CounterActionButton extends StatelessWidget {
  const CounterActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 浮动按钮也可以触发 IncrementEvent。
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CounterBloc>().add(IncrementEvent());
      },
    );
  }
}

/**

1. BLoC 是什么？ BLoC 是 Business Logic Component（业务逻辑组件）的缩写。它是一种设计模式，
旨在将应用的业务逻辑与 UI 展示层分离开。这使得代码更清晰、更容易测试和维护。


 2. BLoC 的核心思想是什么？ 
 BLoC 的核心思想是响应式的单向数据流： 
 • 事件 (Events)：从 UI 层发出，代表用户的操作或系统的通知（例如：点击按钮）。
  ◦ “在我的代码示例中，IncrementEvent 就是一个事件，当用户点击按钮时就会被触发。”  
 
  • BLoC (Business Logic Component)：接收事件，执行相应的业务逻辑。
   ◦ “CounterBloc 就是 BLoC 本身。它会监听 IncrementEvent。”   

 • 状态 (States)：BLoC 处理完逻辑后，会发出一个新的状态。状态是应用在某个时间点的数据快照。 
 ◦ “当 CounterBloc 收到 IncrementEvent 后，它会计算新的计数值，并发出一个新的 CounterState，
 其中包含了更新后的 count 值。”  
 
  • UI (User Interface)：UI 层监听状态的变化，并根据新的状态来重绘自己，而不需要关心业务逻辑是如何执行的。 
  ◦ “BlocBuilder widget 负责监听 CounterState 的变化。每当有新状态发出时，它会自动重建 ActionChip，
  并显示最新的计数值。”   
  这个流程可以总结为：UI 触发 Event → BLoC 处理 Event 并发出 State → UI 根据 State 重建。
  
   3. 使用 BLoC 的主要好处是什么？ 
   1. 关注点分离 (Separation of Concerns)：UI 代码只负责展示，业务逻辑代码只负责处理逻辑。这让代码结构非常清晰。
    2. 易于测试 (Testability)：由于业务逻辑被封装在 BLoC 中，独立于 UI，我们可以非常方便地对 BLoC 进行单元测试。只需给它输入事件，
        然后断言它是否输出了正确的状态即可。
    3. 可预测性 (Predictability)：状态的每一次改变都源于一个明确的事件，数据流是单向的，这使得追踪和调试 Bug 变得更加容易。
     4. 性能优化：通过 BlocBuilder，我们可以精确地控制只重建那些依赖特定状态的 Widget，避免不必要的 UI 刷新。 
    
    
     总结 “总的来说，BLoC 是一个强大的状态管理模式，它通过将业务逻辑与 UI 分离，创建了一个可预测、可测试且结构清晰的应用架构。
    它依赖于事件驱动和状态输出的单向数据流，非常适合构建复杂且需要长期维护的 Flutter 应用。”        







 */