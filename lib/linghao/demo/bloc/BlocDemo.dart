import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//UI 触发事件（Event） → BLoC 处理事件并更新状态（State） → UI 根据新状态重新渲染。

// 事件
abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}

// 状态
class CounterState {
  final int count;
  CounterState(this.count);
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
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
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return ActionChip(
            label: Text('${state.count}'),
            onPressed: () {
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
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CounterBloc>().add(IncrementEvent());
      },
    );
  }
}

