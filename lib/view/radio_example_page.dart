import 'package:flutter/material.dart';

class RadioExamplePage extends StatefulWidget {
  const RadioExamplePage({Key? key}) : super(key: key);

  @override
  _RadioExamplePageState createState() => _RadioExamplePageState();
}

class _RadioExamplePageState extends State<RadioExamplePage> {
  String? _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select an option:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRadioOption('Option 1'),
            _buildRadioOption('Option 2'),
            _buildRadioOption('Option 3'),
            const SizedBox(height: 24),
            Text(
              'Selected option: $_selectedOption',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String option) {
    return RadioListTile<String>(
      title: Text(option),
      value: option,
      groupValue: _selectedOption,
      onChanged: (String? value) {
        setState(() {
          _selectedOption = value;
        });
      },
    );
  }
}
