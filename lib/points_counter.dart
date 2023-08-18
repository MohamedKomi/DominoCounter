import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_states.dart';

var _controller1 = TextEditingController();
var _controller2 = TextEditingController();
var _controller3 = TextEditingController();
var _controller4 = TextEditingController();

class PointsCounter extends StatelessWidget {
  const PointsCounter(
      {Key? key,
      required this.num,
      required this.first,
      required this.second,
      required this.third,
      required this.forth})
      : super(key: key);
  final int num;
  final String first;
  final String second;
  final String third;
  final String forth;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Row(
                  children: [
                    const Text('Reset'),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).resetTeams();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              ],
              backgroundColor: Colors.blueGrey,
              title: const Text(
                'Domino Counter',
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomCounter(
                          name: first,
                          count: 'first',
                          customController: _controller1,
                          teamChar: 'A'),
                      if (num > 1)
                        Container(
                          width: 3,
                          height: size.height * .4,
                          color: Colors.blueGrey,
                        ),
                      if (num > 1)
                        CustomCounter(
                            name: second,
                            count: 'second',
                            customController: _controller2,
                            teamChar: 'B'),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  if (num > 2)
                    Container(
                      width: size.width * .9,
                      height: 3,
                      color: Colors.blueGrey,
                    ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  if (num > 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomCounter(
                            name: third,
                            count: 'third',
                            customController: _controller3,
                            teamChar: 'C'),
                        if (num > 3)
                          Container(
                            width: 3,
                            height: size.height * .4,
                            color: Colors.blueGrey,
                          ),
                        if (num > 3)
                          CustomCounter(
                              name: forth,
                              count: 'forth',
                              customController: _controller4,
                              teamChar: 'D'),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomCounter extends StatelessWidget {
  final String name;
  final String count;
  final TextEditingController customController;
  final String teamChar;

  const CustomCounter({
    Key? key,
    required this.name,
    required this.count,
    required this.customController,
    required this.teamChar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int value = 0;
    return BlocConsumer<CounterCubit, CounterStates>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                '${BlocProvider.of<CounterCubit>(context).counters[count]}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  primary: Colors.black38,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  value = int.parse(customController.text);
                  BlocProvider.of<CounterCubit>(context)
                      .teamIncrement(teamChar, value);
                  customController.clear();
                },
                child: const Text(
                  'Add +',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: TextField(
                  controller: customController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black38,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Number',
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black38,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  value = int.parse(customController.text);
                  BlocProvider.of<CounterCubit>(context)
                      .teamDecrement(teamChar, value);
                  customController.clear();
                },
                child: const Text(
                  'Subtract -',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
