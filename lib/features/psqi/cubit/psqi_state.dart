import 'package:nap_nest/features/psqi/data/model/question_model.dart';

abstract class PsqiState {}

class PsqiInitial extends PsqiState {}

class PsqiLoading extends PsqiState {}

class PsqiLoaded extends PsqiState {
  final QuestionModel question;
  final int current;
  final int total;
  final String? selectedAnswer;

  PsqiLoaded(this.question, this.current, this.total, {this.selectedAnswer});
}

class PsqiSubmitting extends PsqiState {}

class PsqiSubmitted extends PsqiState {
  final Map<String, dynamic> result;
  PsqiSubmitted(this.result);
}

class PsqiError extends PsqiState {
  final String message;
  PsqiError(this.message);
}
