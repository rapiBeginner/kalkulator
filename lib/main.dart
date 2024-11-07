import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalulator',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        output = "0";
      } else if (buttonText == '=') {
        try {
          output = evaluateExpression(output);
        } catch (e) {
          output = "Error";
        }
      }
      else{
        output+=buttonText;
      }
    });
  }

  String evaluateExpression(String expression) {
    final parsedExpression = Expression.parse(expression);
    final evaluator = ExpressionEvaluator();
    final result = evaluator.eval(parsedExpression, {});

    return result.toString();
  }

  Widget buildButton(String buttonText, Color color,
      {double widhfactor = 1.0}) {
    return Expanded(
        flex: widhfactor.toInt(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 22),
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 0),
            onPressed: () => buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(bottom: 24, right: 24),
            alignment: Alignment.bottomRight,
            child: Text(
              output,
              style: TextStyle(fontSize: 89, color: Colors.white),
            ),
          )),
          Column(
            children: [
              Row(
                children: [
                buildButton('C', Colors.grey.shade600, ),
                buildButton('+/-', Colors.grey.shade600, ),
                buildButton('%', Colors.grey.shade600, ),
                buildButton('/', Colors.orange.shade600, ),
                ]
              ),
              Row(
                children: [
                buildButton('7', Colors.grey.shade600, ),
                buildButton('8', Colors.grey.shade600, ),
                buildButton('9', Colors.grey.shade600, ),
                buildButton('*', Colors.orange.shade600, ),
                ]
              ),
              Row(
                children: [
                buildButton('4', Colors.grey.shade600, ),
                buildButton('5', Colors.grey.shade600, ),
                buildButton('6', Colors.grey.shade600, ),
                buildButton('-', Colors.orange.shade600, ),
                ]
              ),
              Row(
                children: [
                buildButton('1', Colors.grey.shade600, ),
                buildButton('2', Colors.grey.shade600, ),
                buildButton('3', Colors.grey.shade600, ),
                buildButton('+', Colors.orange.shade600, ),
                ]
              ),
               Row(
                children: [
                buildButton('0', Colors.grey.shade600, widhfactor: 2.0),
                buildButton('.', Colors.grey.shade600, ),
                buildButton('=', Colors.orange.shade600, ),
                ]
              ),

            ],
          )
        ],
      ),
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
 

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
       
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
