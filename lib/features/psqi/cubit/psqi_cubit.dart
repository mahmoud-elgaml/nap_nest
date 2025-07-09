import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/core/widgets/custom_toast.dart';
import 'package:nap_nest/features/psqi/cubit/psqi_state.dart';
import 'package:nap_nest/features/psqi/data/api/psqi_service.dart';
import 'package:nap_nest/features/psqi/data/model/question_model.dart';
import 'package:nap_nest/features/psqi/presentation/view/psqi_result_view.dart';

// class PsqiCubit extends Cubit<PsqiState> {
//   final PsqiService _psqiService;

//   List<QuestionModel> _questions = [];
//   Map<String, String> _answers = {};
//   int _currentIndex = 0;

//   PsqiCubit(this._psqiService) : super(PsqiInitial());

//   Future<void> fetchQuestions(String token) async {
//     emit(PsqiLoading());
//     try {
//       _questions = await _psqiService.getPsqiQuestions(token);
//       _shuffleOptions();
//       emit(PsqiLoaded(_questions[_currentIndex], _currentIndex + 1, _questions.length));
//     } catch (e) {
//       emit(PsqiError(e.toString()));
//     }
//   }

//   void selectAnswer(String questionId, String value) {
//     _answers[questionId] = value;
//     emit(
//       PsqiLoaded(
//         _questions[_currentIndex],
//         _currentIndex + 1,
//         _questions.length,
//         selectedAnswer: value,
//       ),
//     );
//   }

//   void nextQuestion(BuildContext context, String token, int patientId) async {
//     if (_currentIndex < _questions.length - 1) {
//       _currentIndex++;
//       _shuffleOptions();
//       final question = _questions[_currentIndex];
//       emit(
//         PsqiLoaded(
//           question,
//           _currentIndex + 1,
//           _questions.length,
//           selectedAnswer: _answers[question.id],
//         ),
//       );
//     } else {
//       emit(PsqiSubmitting());

//       try {
//         final response = await _psqiService.submitPsqiAnswers(patientId, _answers, token);
//         emit(PsqiSubmitted(response));

//         Navigator.pushNamed(context, PsqiResultView.routeName, arguments: response);
//       } catch (e) {
//         emit(PsqiError('Failed to submit answers: $e'));
//       }
//     }
//   }

//   void previousQuestion() {
//     if (_currentIndex > 0) {
//       _currentIndex--;
//       _shuffleOptions();
//       final question = _questions[_currentIndex];
//       emit(
//         PsqiLoaded(
//           question,
//           _currentIndex + 1,
//           _questions.length,
//           selectedAnswer: _answers[question.id],
//         ),
//       );
//     }
//   }

//   void _shuffleOptions() {
//     final options = _questions[_currentIndex].options;
//     options.shuffle();
//   }
// }

class PsqiCubit extends Cubit<PsqiState> {
  final PsqiService _psqiService;

  List<QuestionModel> _questions = [];
  Map<String, String> _answers = {};
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  PsqiCubit(this._psqiService) : super(PsqiInitial());

  Future<void> fetchQuestions(String token) async {
    emit(PsqiLoading());
    try {
      _questions = await _psqiService.getPsqiQuestions(token);
      _shuffleOptions();
      emit(PsqiLoaded(_questions[_currentIndex], _currentIndex + 1, _questions.length));
    } catch (e) {
      emit(PsqiError(e.toString()));
    }
  }

  void selectAnswer(String questionId, String value) {
    _answers[questionId] = value;
    emit(
      PsqiLoaded(
        _questions[_currentIndex],
        _currentIndex + 1,
        _questions.length,
        selectedAnswer: value,
      ),
    );
  }

  void nextQuestion(BuildContext context, String token, int patientId) async {
    final currentQuestion = _questions[_currentIndex];

    if (!_answers.containsKey(currentQuestion.id)) {
      CustomToast.show(message: 'Please select answer to continuing', isError: true);
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(SnackBar(content: Text('Please select answer to continuing')));
      return;
    }

    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _shuffleOptions();
      final question = _questions[_currentIndex];
      emit(
        PsqiLoaded(
          question,
          _currentIndex + 1,
          _questions.length,
          selectedAnswer: _answers[question.id],
        ),
      );
    } else {
      emit(PsqiSubmitting());

      try {
        final response = await _psqiService.submitPsqiAnswers(patientId, _answers, token);

        // ✅ تأخير بسيط لإظهار شاشة اللودينج
        await Future.delayed(const Duration(milliseconds: 800));

        emit(PsqiSubmitted(response));
        Navigator.pushNamed(context, PsqiResultView.routeName, arguments: response);
      } catch (e) {
        emit(PsqiError('Failed to submit answers: $e'));
      }
    }
  }

  void previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _shuffleOptions();
      final question = _questions[_currentIndex];
      emit(
        PsqiLoaded(
          question,
          _currentIndex + 1,
          _questions.length,
          selectedAnswer: _answers[question.id],
        ),
      );
    }
  }

  void _shuffleOptions() {
    final options = _questions[_currentIndex].options;
    options.shuffle();
  }
}
