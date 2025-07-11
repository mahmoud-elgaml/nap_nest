import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nap_nest/core/widgets/app_loading_indicator.dart';
import 'package:nap_nest/core/widgets/custom_appbar.dart';
import 'package:nap_nest/features/library/cubit/library_cubit.dart';
import 'package:nap_nest/features/library/cubit/library_state.dart';
import 'package:nap_nest/features/library/data/api/library_service.dart';
import 'package:nap_nest/features/library/presentation/widgets/library_grid.dart';
class LibraryViewBody extends StatelessWidget {
  const LibraryViewBody({super.key});
  static const routeName = 'libraryViewBody';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (_) => LibraryCubit(LibraryService())..getSections(),
  child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 80.h, top: 16.h),
            child: Column(
              children: [
                CustomAppbar(
                  popText: 'Home',
                  title: 'Nest Notes',
                  subtitle: 'Your calming guide to better sleep.',
                ),
                SizedBox(height: 20.h),
                BlocBuilder<LibraryCubit, LibraryState>(
                  builder: (context, state) {
                    if (state is LibraryLoading) {
                      return const Center(child: CustomAppLoading());
                    } else if (state is LibraryLoaded) {
                      return LibraryGrid(sections: state.sections);
                    } else if (state is LibraryError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
