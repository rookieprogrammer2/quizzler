import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/database/models/quiz_model.dart';
import 'package:quizzler/providers/auth_provider.dart';

class QuizCreationScreen extends StatefulWidget {
  static const routeName = "quiz_creation_sc";

  const QuizCreationScreen({super.key});
  @override
  _QuizCreationScreenState createState() => _QuizCreationScreenState();
}

class _QuizCreationScreenState extends State<QuizCreationScreen> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<Question> _questions = [];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Create a Quiz'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10),
              Text('Date and Time: ${_selectedDate.toString()}'),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('Pick Date'),
              ),
              SizedBox(height: 20),
              Text('Questions:'),
              Expanded(
                child: ListView.builder(
                  itemCount: _questions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Q${index + 1}: ${_questions[index].text}'),
                      subtitle: Text(
                        _questions[index].isTrueFalse
                            ? 'True/False'
                            : 'Multiple Choice',
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showAddQuestionDialog();
                },
                child: Text('Add Question'),
              ),
            ],
          ),
        ),
      );


  }

  void _showAddQuestionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        bool isTrueFalse = false;
        String questionText = '';
        List<String> options = ['Option 1', 'Option 2'];
        int correctOptionIndex = 0;

        return AlertDialog(
          title: Text('Add a Question'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    onChanged: (value) {
                      questionText = value;
                    },
                    decoration: InputDecoration(labelText: 'Question'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Type: '),
                      DropdownButton<bool>(
                        value: isTrueFalse,
                        items: [
                          DropdownMenuItem<bool>(
                            value: false,
                            child: Text('Multiple Choice'),
                          ),
                          DropdownMenuItem<bool>(
                            value: true,
                            child: Text('True/False'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            isTrueFalse = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  isTrueFalse
                      ? Container()
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Options:'),
                      for (int i = 0; i < options.length; i++)
                        Row(
                          children: [
                            Text('Option ${i + 1}:'),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  options[i] = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 10),
                      Text('Correct Option:'),
                      DropdownButton<int>(
                        value: correctOptionIndex,
                        items: [
                          for (int i = 0; i < options.length; i++)
                            DropdownMenuItem<int>(
                              value: i,
                              child: Text('Option ${i + 1}'),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            correctOptionIndex = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the question to the list
                _questions.add(
                  Question(
                    text: questionText,
                    isTrueFalse: isTrueFalse,
                    options: options,
                    correctOptionIndex: correctOptionIndex,
                  ),
                );

                Navigator.pop(context);
                setState(() {});
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
