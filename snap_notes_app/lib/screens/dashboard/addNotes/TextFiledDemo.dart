import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFieldDemo extends StatefulWidget {
  @override
  _MyTextFieldDemoState createState() => _MyTextFieldDemoState();
}

class _MyTextFieldDemoState extends State<MyTextFieldDemo> {
  TextEditingController _controller = TextEditingController();
  bool _isBold = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField with Bold Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  // Update the state when the text changes
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _boldSelectedText();
              },
              child: Text('Bold Selected Text'),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: _buildTextSpans(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _boldSelectedText() {
    // Get the selected text range
    TextSelection selection = _controller.selection;

    // Check if there is a selection
    if (selection.baseOffset != selection.extentOffset) {
      // Toggle the bold state
      _isBold = !_isBold;

      // Get the current text from the controller
      String currentText = _controller.text;

      // Wrap the selected text with the bold tag
      String newText =
      currentText.replaceRange(selection.start, selection.end, _isBold ? '**${currentText.substring(selection.start, selection.end)}**' : currentText.substring(selection.start, selection.end));

      // Set the new text to the controller
      _controller.text = newText;

      // Move the cursor to the end of the bold text
      _controller.selection = TextSelection.collapsed(
        offset: selection.start + (_isBold ? 2 : 0),
      );
    }
  }

  List<TextSpan> _buildTextSpans() {
    List<TextSpan> spans = [];

    // Split the text into parts based on '**' bold tags
    List<String> parts = _controller.text.split('**');

    // Add text spans with style based on bold tags
    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        // Non-bold text
        spans.add(TextSpan(text: parts[i]));
      } else {
        // Bold text
        spans.add(TextSpan(
          text: parts[i],
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      }
    }

    return spans;
  }
}