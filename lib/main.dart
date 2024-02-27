import 'package:authentication_app/core/services/injection_container.dart';
import 'package:authentication_app/features/authentication/presentation/auth-bloc/auth_bloc.dart';
import 'package:authentication_app/features/authentication/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
