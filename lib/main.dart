import 'package:bookapp/core/error/handle_error.dart';
import 'package:bookapp/feature/dashboarad/domain/repositories/local_repositori_impl.dart';
import 'package:bookapp/feature/dashboarad/presentation/bloc/dbbook_bloc/dbbook_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/dashboarad/presentation/pages/main_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HandleError.exit1();
  localReposiroyImplementation.opendatabase();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<DBBookBloc>(create: (context) => DBBookBloc())],
      child: MaterialApp(
        builder: HandleError.materialerror,
        home: InitialApp(),
      ),
    );
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
