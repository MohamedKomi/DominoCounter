import 'package:basketball_counter_app/points_counter.dart';
import 'package:flutter/material.dart';

TextEditingController controller1 = TextEditingController();

TextEditingController controller2 = TextEditingController();

TextEditingController controller3 = TextEditingController();

TextEditingController controller4 = TextEditingController();

class Players extends StatelessWidget {
  const Players({Key? key, required this.num}) : super(key: key);
  final int num;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Domino Counter',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            const Text(
              'Enter player names!',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: controller1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1A2035)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(109),
                      )),
                  label: Text('Enter player one name'),
                ),
              ),
            ),
            if (num > 1)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: controller2,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1A2035)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(109),
                            )),
                        labelText: 'Enter player two name')),
              ),
            if (num > 2)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: controller3,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1A2035)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(109),
                            )),
                        labelText: 'Enter player three name')),
              ),
            if (num > 3)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: controller4,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1A2035)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(109),
                            )),
                        labelText: 'Enter player four name')),
              ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.grey.shade700)),
              onPressed: () async{
               await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => PointsCounter(
                            num: num,
                            first: controller1.text==''?'First Player':controller1.text,
                            second: controller2.text==''?'Second Player':controller2.text,
                            third: controller3.text==''?'Third Player':controller3.text,
                            forth: controller4.text==''?'Forth Player':controller4.text,
                          )),
                );
                controller1.clear();
                controller2.clear();
                controller3.clear();
                controller4.clear();

              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
