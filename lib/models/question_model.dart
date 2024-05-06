import 'dart:convert';

class Question {
  int id;
  String? title;
  String question;
  String answer;
  String? youtube_id_result;
  Question({
    required this.id,
    this.title = 'Sau khi thực hiện đoạn mã sẽ là gì ?',
    required this.question,
    required this.answer,
    this.youtube_id_result,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'question': question,
      'answer': answer,
      'youtube_id_result': youtube_id_result,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int,
      title: map['title'] != null
          ? map['title'] as String
          : 'Sau khi thực hiện đoạn mã sẽ là gì ?',
      question: map['question'] as String,
      answer: map['answer'] as String,
      youtube_id_result: map['youtube_id_result'] != null
          ? map['youtube_id_result'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
