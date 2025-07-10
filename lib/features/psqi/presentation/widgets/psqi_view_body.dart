import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:nap_nest/core/services/shared_preferences_singleton.dart';
import 'package:nap_nest/core/utils/app_colors.dart';
import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
import 'package:nap_nest/features/psqi/cubit/psqi_cubit.dart';
import 'package:nap_nest/features/psqi/cubit/psqi_state.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/answer_container.dart';
import 'package:nap_nest/features/psqi/presentation/widgets/navigator_button.dart';

class PsqiViewBody extends StatelessWidget {
  const PsqiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PsqiCubit>();
    final token = Prefs.getString('token');
    final patientId = Prefs.getInt('patient_id');

    if (token == null || patientId == null) {
      return const Center(child: Text('⚠️ Missing token or patient ID'));
    }
    return BlocBuilder<PsqiCubit, PsqiState>(
      builder: (context, state) {
        if (state is PsqiInitial) {
          cubit.fetchQuestions(token);
          return const Center(child: CustomAppLoading());
        } else if (state is PsqiLoading || state is PsqiSubmitting) {
          return const Center(child: CustomAppLoading());
        } else if (state is PsqiLoaded) {
          final q = state.question;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 54.h),
                    Text(
                      'Sleep Index',
                      style: TextStyle(
                        color: AppColors.darkGreyTxtColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    LinearProgressBar(
                      maxSteps: state.total,
                      currentStep: state.current,
                      progressColor: AppColors.secondaryColor2,
                      backgroundColor: AppColors.containerColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Question ${state.current} of ${state.total}',
                      style: TextStyle(
                        color: const Color(0xFF9EA8B9),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Text(q.text, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    SizedBox(height: 45.h),
                    AnswersContainer(
                      options: q.options,
                      selected: state.selectedAnswer,
                      onTap: (val) => cubit.selectAnswer(q.id, val),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 44.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavigatorButton(
                    text: 'Previous',
                    textColor: AppColors.primaryColor,
                    buttonColor: Colors.transparent,
                    side: BorderSide(
                      color: cubit.currentIndex == 0 ? Colors.grey : AppColors.primaryColor,
                      width: 2.5.w,
                    ),
                    onPressed: cubit.currentIndex == 0 ? null : cubit.previousQuestion,
                  ),
                  NavigatorButton(
                    text: 'Next',
                    textColor:
                        state.selectedAnswer != null
                            ? AppColors.primaryColor
                            : AppColors.primaryColor,
                    buttonColor: Colors.transparent,
                    side: BorderSide(
                      color: state.selectedAnswer != null ? AppColors.primaryColor : Colors.grey,
                      width: 2.5.w,
                    ),
                    onPressed:
                        state.selectedAnswer != null
                            ? () => cubit.nextQuestion(context, token, patientId)
                            : null,
                  ),
                ],
              ),
            ],
          );
        } else if (state is PsqiError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
