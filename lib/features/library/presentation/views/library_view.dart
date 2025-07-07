import 'package:flutter/material.dart';
import 'package:nap_nest/features/library/presentation/widgets/library_view_body.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});
  static const routeName = 'libraryView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LibraryViewBody(),
      //
    );
  }
}
