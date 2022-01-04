import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstcontroller = TextEditingController();
  TextEditingController secondcontroller = TextEditingController();
  String result = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    //2. textform field with validator logic
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field cannot be empty";
                      }
                      return null;
                    },
                    controller: firstcontroller,
                    decoration: const InputDecoration(
                      hintText: 'Enter the first number',
                      labelText: 'First Number',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field cannot be empty";
                      }
                      return null;
                    },
                    controller: secondcontroller,
                    decoration: const InputDecoration(
                      hintText: 'Enter the second number',
                      labelText: 'Second Number',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      //3. validate and submit(sum) the form using button.
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          int sum = int.parse(firstcontroller.text) +
                              int.parse(secondcontroller.text);
                          result = sum.toString();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Somtething wrong")));
                      }
                    },
                    child: const Text("Sum"),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Result",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        result,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
