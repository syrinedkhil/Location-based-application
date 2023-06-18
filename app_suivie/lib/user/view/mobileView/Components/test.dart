/*import 'dart:io';

import 'package:flutter/material.dart';

class PythonScreen extends StatefulWidget {
  @override
  _PythonScreenState createState() => _PythonScreenState();
}

class _PythonScreenState extends State<PythonScreen> {
  String output = '';

  Future<void> runPythonScript() async {
    Process process = await Process.start(
      'python3',
      ['C://Users//Admin//Desktop//PCD//app_suivie//lib//user//view//mobileView//Components//test.py'],
    );

    process.stdout.listen((data) {
      setState(() {
        output += String.fromCharCodes(data);
      });
    });

    process.stderr.listen((data) {
      setState(() {
        output += String.fromCharCodes(data);
      });
    });

    process.stdin.writeln('');

    await process.exitCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Python Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  output = '';
                });
                await runPythonScript();
              },
              child: Text('Run Python Script'),
            ),
            SizedBox(height: 16),
            Text(output),
          ],
        ),
      ),
    );
  }
}
*/