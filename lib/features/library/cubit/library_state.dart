import 'package:nap_nest/features/library/data/model/library_section_model.dart';

abstract class LibraryState {}

class LibraryInitial extends LibraryState {}

class LibraryLoading extends LibraryState {}

class LibraryLoaded extends LibraryState {
  final List<LibrarySectionModel> sections;
  LibraryLoaded(this.sections);
}

class LibraryError extends LibraryState {
  final String message;
  LibraryError(this.message);
}
