import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nap_nest/features/library/cubit/library_state.dart';
import 'package:nap_nest/features/library/data/api/library_service.dart';

class LibraryCubit extends Cubit<LibraryState> {
  final LibraryService _service;
  LibraryCubit(this._service) : super(LibraryInitial());
  
  Future<void> getSections() async {
    emit(LibraryLoading());
    try {
      final sections = await _service.fetchSections();
      emit(LibraryLoaded(sections));
    } catch (e) {
      print('❌ Failed to load sections: $e');
      emit(LibraryError('Failed to load sections'));
    }
  }
}
