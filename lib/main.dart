import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Module9_LiveExam',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedSize = ''; // Variable to store the selected size

  // Create a list of button colors
  List<Color> buttonColors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  // Create a list of button sizes
  List<String> buttonSizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    '3XL',
  ];

  int selectedIndex = -1;

  void handleButtonTap(int index) {
    setState(() {
      buttonColors[index] = Colors.amber;

      if (selectedIndex != -1 && selectedIndex != index) {
        buttonColors[selectedIndex] = Colors.grey;
      }

      selectedIndex = index;

      selectedSize = buttonSizes[index];
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $selectedSize'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Size Selector')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < buttonSizes.length; i++)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ElevatedButton(
                      onPressed: () => handleButtonTap(i),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[i],
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: Text(buttonSizes[i]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
