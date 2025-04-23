// // lib/models/psqi_question_model.dart

// class PsqiQuestionModel {
//   final int id;
//   final String question;
//   final List<String> answers;

//   PsqiQuestionModel({required this.id, required this.question, required this.answers});

//   factory PsqiQuestionModel.fromJson(Map<String, dynamic> json) {
//     return PsqiQuestionModel(
//       id: json['id'],
//       question: json['question'],
//       answers: List<String>.from(json['answers']),
//     );
//   }

// }

class Question {
  final String question;
  final List<String> options;

  Question({required this.question, required this.options});
}

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       id: json['id'],
//       question: json['question'],
//       answers: List<String>.from(json['answers']),
//     );
//   }

final List<Question> dummyQuestions = [
  Question(
    question: 'خلال الشهر الماضي، ما هو الوقت الذي اعتدت الذهاب فيه إلى الفراش ليلاً؟',
    options: ['8pm : 10pm', '10pm : 12am', '12am : 2am', '2am : 4am'],
  ),
  Question(
    question: 'خلال الشهر الماضي، كم من الوقت استغرقك عادة للنوم بعد الذهاب إلى الفراش؟',
    options: ['أقل من 15 دقيقة', '15-30 دقيقة', '31-60 دقيقة', 'أكثر من 60 دقيقة'],
  ),
  Question(
    question: 'خلال الشهر الماضي، كم من الوقت استغرقك عادة للنوم بعد الذهاب إلى الفراش؟',
    options: ['أقل من 15 دقيقة', '15-30 دقيقة', '31-60 دقيقة', 'أكثر من 60 دقيقة'],
  ),
  Question(
    question: 'خلال الشهر الماضي، ما هو الوقت الذي اعتدت الذهاب فيه إلى الفراش ليلاً؟',
    options: ['8pm : 10pm', '10pm : 12am', '12am : 2am', '2am : 4am'],
  ),
  Question(
    question: 'خلال الشهر الماضي، كم من الوقت استغرقك عادة للنوم بعد الذهاب إلى الفراش؟',
    options: ['أقل من 15 دقيقة', '15-30 دقيقة', '31-60 دقيقة', 'أكثر من 60 دقيقة'],
  ),
  Question(
    question: 'خلال الشهر الماضي، ما هو الوقت الذي اعتدت الذهاب فيه إلى الفراش ليلاً؟',
    options: ['8pm : 10pm', '10pm : 12am', '12am : 2am', '2am : 4am'],
  ),
];
