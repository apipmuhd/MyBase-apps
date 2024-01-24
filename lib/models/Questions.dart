// ignore_for_file: file_names

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  const Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
  });
}

const List<Question> sampleData = [
  Question(
    id: 1,
    question:
        "What is the decimal equivalent of the binary number 1011?",
    options: ['A. 11', 'B. 12', 'C. 13', 'D. 14'],
    answer: 0,
  ),
  Question(
    id: 2,
    question: "What is the decimal equivalent of the binary number 11110?",
    options: ['A. 30', 'B. 31', 'C. 32', 'D. 33'],
    answer: 2,
  ),
  Question(
    id: 3,
    question: "What is the decimal equivalent of the octal number 17?",
    options: ['A. 7', 'B. 8', 'C. 9', 'D. 10'],
    answer: 1,
  ),
  Question(
    id: 4,
    question: "What is the decimal equivalent of the octal number 77?",
    options: ['A. 63', 'B. 64', 'C. 65', 'D. 66'],
    answer: 3,
  ),
   Question(
    id: 5,
    question: "What is the decimal equivalent of the hexadecimal number 2A?",
    options: ['A. 42', 'B. 43', 'C. 44', 'D. 45'],
    answer: 0,
  ),
];
