import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc: Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // UI update
          Center(
            child: BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
          ),

          // Text on State
          Text(_counterBloc.state.toString()),

          // Button on Event
          ElevatedButton(
            onPressed: () {
              _counterBloc.add(Increment());
            },
            child: const Text('Increment'),
          ),
          ElevatedButton(
            onPressed: () {
              _counterBloc.add(Decrement());
            },
            child: const Text('Decrement'),
          ),
          ElevatedButton(
            onPressed: () {
              _counterBloc.add(Double());
            },
            child: const Text('Double'),
          ),
        ],
      ),
    );
  }
}
