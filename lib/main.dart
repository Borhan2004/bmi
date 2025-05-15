import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var bgColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YOUR - BMI')),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xff9be15d), Color(0xff00e3ae)],
            center: Alignment.topCenter,
          ),
        ),

        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in KG'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in Feet'),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in Inch'),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if (wt != '' && ft != '' && inch != '') {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (ift * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iwt / (tM * tM);
                      var msg = '';

                      if (bmi > 25) {
                        msg = "You're OverWeight!!";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You're UnderWeight!!";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "   You're Healthy!!";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            '$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                      });

                      // Add your BMI calculation logic here
                    } else {
                      setState(() {
                        result = 'Please fill all the Required Blanks!';
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 20),

                Text(result, style: TextStyle(fontSize: 19)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
