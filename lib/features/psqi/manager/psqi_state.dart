// import 'package:nap_nest/features/psqi/data/model/question_model.dart';

// abstract class PsqiStates {
//   final int totalQuestions;
//   const PsqiStates(this.totalQuestions);
// }

// class PsqiInitialState extends PsqiStates {
//   const PsqiInitialState(int totalQuestions) : super(totalQuestions);
// }

// class PsqiLoadingState extends PsqiStates {
//   const PsqiLoadingState(int totalQuestions) : super(totalQuestions);
// }

// class PsqiLoadedState extends PsqiStates {
//   final List<Question> questions;
//   const PsqiLoadedState(this.questions) : super(questions.length);
// }

// class PsqiQuestionChangedState extends PsqiStates {
//   final int currentQuestionIndex;
//   const PsqiQuestionChangedState(this.currentQuestionIndex, int totalQuestions)
//     : super(totalQuestions);
// }

// class PsqiQuestionAnsweredState extends PsqiStates {
//   final int questionIndex;
//   final String? answer;
//   const PsqiQuestionAnsweredState(this.questionIndex, this.answer, int totalQuestions)
//     : super(totalQuestions);
// }

// class PsqiTestCompletedState extends PsqiStates {
//   final List<String?> allAnswers;
//   const PsqiTestCompletedState(this.allAnswers, [int totalQuestions = 0]) : super(totalQuestions);
// }

// class PsqiErrorState extends PsqiStates {
//   final String errorMessage;
//   const PsqiErrorState(this.errorMessage, [int totalQuestions = 0]) : super(totalQuestions);
// }
