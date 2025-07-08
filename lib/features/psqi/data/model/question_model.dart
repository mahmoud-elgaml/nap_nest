import 'package:nap_nest/features/psqi/data/model/psqi_option.dart';
class QuestionModel {
  final String id;
  final String text;
  final List<PsqiOption> options;

  QuestionModel({required this.id, required this.text, required this.options});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      text: json['text'],
      options: (json['options'] as List).map((option) => PsqiOption.fromJson(option)).toList(),
    );
  }
}

