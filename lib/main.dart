import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller1 = TextEditingController();
    var _controller2 = TextEditingController();

    int value = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black38,
              title: const Text('Domino Counter'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'First Team',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '${BlocProvider.of<CounterCubit>(context).firstTeamCounter}',
                              style: const TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                primary: Colors.black38,
                                minimumSize: const Size(150, 50),
                              ),
                              onPressed: () {
                                value = int.parse(_controller1.text);
                                BlocProvider.of<CounterCubit>(context)
                                    .teamIncrement('A', value);
                                _controller1.clear();
                              },
                              child: const Text(
                                'Add اجمع',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: TextField(
                                controller: _controller1,
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
                                value = int.parse(_controller1.text);
                                BlocProvider.of<CounterCubit>(context)
                                    .teamDecrement('A', value);
                                _controller1.clear();
                              },
                              child: const Text(
                                'Subtract اطرح',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 500,
                        child: VerticalDivider(
                          indent: 50,
                          endIndent: 50,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Second Team',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '${BlocProvider.of<CounterCubit>(context).secondTeamCounter}',
                              style: const TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                primary: Colors.black38,
                                minimumSize: const Size(150, 50),
                              ),
                              onPressed: () {
                                value = int.parse(_controller2.text);
                                BlocProvider.of<CounterCubit>(context)
                                    .teamIncrement('B', value);
                                _controller2.clear();
                              },
                              child: const Text(
                                'Add اجمع',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: TextField(
                                controller: _controller2,
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
                                value = int.parse(_controller2.text);
                                BlocProvider.of<CounterCubit>(context)
                                    .teamDecrement('B', value);
                                _controller2.clear();
                              },
                              child: const Text(
                                'Subtract اطرح',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      primary: Colors.black38,
                      minimumSize: const Size(150, 50),
                    ),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).resetTeams();
                    },
                    child: const Text(
                      'Reset صفر',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          listener: (context, state) {},
        ),
      ),
    );
  }
}
