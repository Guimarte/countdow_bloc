import 'dart:async';

import 'package:final_countdown/app/home/bloc/home_bloc.dart';
import 'package:final_countdown/app/home/bloc/home_event.dart';
import 'package:final_countdown/app/home/bloc/home_state.dart';
import 'package:final_countdown/app/home/widgets/button_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: Center(
              child: BlocConsumer<HomeBloc, HomeState>(
                listenWhen: (previous, current) {
                  if (current is HomeStateCounter) {
                    return true;
                  } else {
                    return false;
                  }
                },
                listener: (context, state) {
                  int newValue = HomeBloc().value;
                  Timer.periodic(Duration(seconds: newValue), (timer) {
                    if (newValue > 0) {
                      newValue--;
                      context.read<HomeBloc>().add(HomeEventCounter());
                    } else {
                      timer.cancel();
                    }
                  });
                },
                builder: (context, state) {
                  if (state is HomeStateInitial) {
                    return const Text("Clique no + para adicionar tempo");
                  } else if (state is HomeStateAdd) {
                    return Text(state.value.toString());
                  } else if (state is HomeStateRemove) {
                    return Text(state.value.toString());
                  } else if (state is HomeStateCounter) {
                    double progress = state.value.toDouble() / 10.0;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text((state).value.toString()),
                        ),
                        CircularProgressIndicator(
                          value: progress,
                        )
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonCounter(
                function: () {
                  context.read<HomeBloc>().add(HomeEventAdd());
                },
                icon: const Icon(Icons.add),
              ),
              ButtonCounter(
                  function: () {
                    context.read<HomeBloc>().add(HomeEventCounter());
                  },
                  icon: const Icon(Icons.play_arrow)),
              ButtonCounter(
                function: () {
                  context.read<HomeBloc>().add(HomeEventRemove());
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
