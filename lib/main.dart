import 'package:basketball_counter_app/players.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Domino Counter',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Choose number of Players',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              const CustomButton(num: 1),
              SizedBox(
                height: size.height * .03,
              ),
              const CustomButton(num: 2),
              SizedBox(
                height: size.height * .03,
              ),
              const CustomButton(num: 3),
              SizedBox(
                height: size.height * .03,
              ),
              const CustomButton(num: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final int num;

  const CustomButton({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade700),
        ),
        onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Players(
                  num: num,
                ),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50.0),
          child: Text(
            '$num',
            style: const TextStyle(fontSize: 20),
          ),
        ));
  }
}
