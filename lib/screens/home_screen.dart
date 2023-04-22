import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
        if (state is InitialState) {
          return _counter(context, 0);
        }

        if (state is UpdateState) {
          return _counter(context, state.counter);
        }
        return Container();
      }),
    );
  }

  Widget _counter(BuildContext context, int counter) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                elevation: 0.0,
                height: 50,
                shape: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Icon(
                      Icons.minimize_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () => context.read<CounterBloc>().add(
                      NumberDecrease(),
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              MaterialButton(
                color: Colors.green,
                elevation: 0.0,
                height: 50,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () => context.read<CounterBloc>().add(
                      NumberIncrease(),
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
