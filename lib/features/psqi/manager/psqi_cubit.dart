// // import 'package:bloc/bloc.dart';
// // import 'package:dio/dio.dart';
// // import 'package:nap_nest/features/psqi/data/model/question_model.dart';

// // part 'psqi_state.dart';

// // class PsqiCubit extends Cubit<PsqiState> {
// //   PsqiCubit() : super(PsqiState(questions: [], currentIndex: 0, selectedAnswers: []));

// //   final Dio _dio = Dio();

// //   Future<void> fetchQuestions() async {
// //     emit(state.copyWith(isLoading: true));
// //     try {
// //       // استبدل اللينك ده أول ما يوصل من صاحبك
// //       final response = await _dio.get('https://your-api.com/psqi-questions');

// //       final List<dynamic> data = response.data;
// //       final questions = data.map((e) => PsqiQuestionModel.fromJson(e)).toList();

// //       emit(
// //         PsqiState(
// //           questions: questions,
// //           currentIndex: 0,
// //           selectedAnswers: List<int?>.filled(questions.length, null),
// //           isLoading: false,
// //         ),
// //       );
// //     } catch (e) {
// //       print('Error fetching questions: $e');
// //       emit(state.copyWith(isLoading: false));
// //     }
// //   }

// //   void selectAnswer(int index) {
// //     final updatedAnswers = [...state.selectedAnswers];
// //     updatedAnswers[state.currentIndex] = index;
// //     emit(state.copyWith(selectedAnswers: updatedAnswers));
// //   }

// //   void next() {
// //     if (state.currentIndex < state.questions.length - 1) {
// //       emit(state.copyWith(currentIndex: state.currentIndex + 1));
// //     }
// //   }

// //   void previous() {
// //     if (state.currentIndex > 0) {
// //       emit(state.copyWith(currentIndex: state.currentIndex - 1));
// //     }
// //   }
// // }

// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nap_nest/features/psqi/data/model/question_model.dart';
// import 'psqi_state.dart';

// class PsqiCubit extends Cubit<PsqiStates> {
//   final Dio dio = Dio();
//   int currentQuestionIndex = 0;
//   List<String?> answers = List.generate(dummyQuestions.length, (_) => null);

//   PsqiCubit() : super(PsqiInitialState(dummyQuestions.length));

//   Future<void> fetchQuestions() async {
//     emit(PsqiLoadingState(dummyQuestions.length));
//     // في هذه المرحلة، يمكنك استخدام Dio لجلب البيانات من API
//     // try {
//     //   final response = await dio.get('YOUR_API_LINK_HERE');
//     //   if (response.statusCode == 200) {
//     //     // قم بتحويل بيانات JSON إلى قائمة من كائنات Question
//     //     // emit(PsqiLoaded(fetchedQuestions));
//     //   } else {
//     //     emit(PsqiError('Failed to load questions'));
//     //   }
//     // } catch (error) {
//     //   emit(PsqiError('Error: $error'));
//     // }

//     // استخدام البيانات الوهمية مؤقتًا
//     emit(PsqiLoadedState(dummyQuestions));
//   }

//   void answerQuestion(int index, String? answer) {
//     answers[currentQuestionIndex] = answer;
//     emit(PsqiQuestionAnsweredState(currentQuestionIndex, answer, state.totalQuestions));
//   }

//   void nextQuestion() {
//     if (currentQuestionIndex < state.totalQuestions - 1) {
//       currentQuestionIndex++;
//       emit(PsqiQuestionChangedState(currentQuestionIndex, state.totalQuestions));
//     } else {
//       // يمكنك هنا الانتقال إلى شاشة النتائج أو إرسال الإجابات
//       emit(PsqiTestCompletedState(answers));
//     }
//   }

//   void previousQuestion() {
//     if (currentQuestionIndex > 0) {
//       currentQuestionIndex--;
//       emit(PsqiQuestionChangedState(currentQuestionIndex, state.totalQuestions));
//     }
//   }
// }
