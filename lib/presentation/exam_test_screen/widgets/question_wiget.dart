import 'package:flutter/material.dart';
import 'package:toeic_test/data/models/exam/group_question.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.onSelect,
      this.selectedQuestion,
      this.type = 0,
      this.isFinish = false})
      : super(key: key);
  final QuestionModel? question;
  final String? selectedQuestion;
  final int type;
  final bool isFinish;
  final void Function(int, String) onSelect;
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String selectedQuestion = "";
  bool isShowTheAnswer = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedQuestion = widget.selectedQuestion ?? "";
    if ((widget.type == 1 || widget.type == 2)) {
      isShowTheAnswer = widget.isFinish;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          getRadioWidget(widget.question!),
        ]));
  }

  Color getColor(String answer) {
    if (widget.isFinish) {
      if (selectedQuestion == answer) {
        return answer == (widget.question!.correctAnswer ?? "")
            ? Colors.green
            : Colors.red;
      } else if (answer == (widget.question!.correctAnswer ?? "")) {
        return Colors.green;
      }
    }
    return Colors.black;
  }

  Widget getRadioWidget(QuestionModel item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          if (widget.type != 1)
            Align(
              alignment: Alignment.centerLeft,
              child: Card(
                color: Colors.blue.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Question ${item.number}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          if (item.question != null)
                            TextSpan(
                              text: " ${item.question}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (item.A != null)
            RadioListTile<String>(
              title: Text(
                  item.A != null ? "(A). ${isShowTheAnswer ? item.A : ""}" : "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: getColor("A"))),
              value: "A",
              groupValue: selectedQuestion,
              onChanged: (String? value) {
                if (!widget.isFinish)
                  setState(() {
                    selectedQuestion = value ?? "";
                    widget.onSelect(item.number, selectedQuestion);
                  });
              },
            ),
          if (item.B != null)
            RadioListTile<String>(
              title: Text(
                  item.B != null ? "(B). ${isShowTheAnswer ? item.B : ""}" : "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: getColor("B"))),
              value: "B",
              groupValue: selectedQuestion,
              onChanged: (String? value) {
                if (!widget.isFinish)
                  setState(() {
                    selectedQuestion = value ?? "";
                    widget.onSelect(item.number, selectedQuestion);
                  });
              },
            ),
          if (item.C != null)
            RadioListTile<String>(
              title: Text(
                  item.C != null ? "(C). ${isShowTheAnswer ? item.C : ""}" : "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: getColor("C"))),
              value: "C",
              groupValue: selectedQuestion,
              onChanged: (String? value) {
                if (!widget.isFinish)
                  setState(() {
                    selectedQuestion = value ?? "";
                    widget.onSelect(item.number, selectedQuestion);
                  });
              },
            ),
          if (item.D != null && widget.type != 2)
            RadioListTile<String>(
              title: Text(
                  item.D != null ? "(D). ${isShowTheAnswer ? item.D : ""}" : "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: getColor("D"))),
              value: "D",
              groupValue: selectedQuestion,
              onChanged: (String? value) {
                if (!widget.isFinish)
                  setState(() {
                    selectedQuestion = value ?? "";
                    widget.onSelect(item.number, selectedQuestion);
                  });
              },
            ),
        ]);
  }
}
