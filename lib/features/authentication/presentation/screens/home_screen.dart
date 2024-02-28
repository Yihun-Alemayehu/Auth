import 'package:authentication_app/features/authentication/presentation/auth-bloc/auth_bloc.dart';
import 'package:authentication_app/features/authentication/presentation/screens/create_user_screen.dart';
import 'package:authentication_app/features/authentication/presentation/widgets/loading_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void getUsers() {
    context.read<AuthBloc>().add(const GetUsersEvent());
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }else if(state is CreateUserState){
          getUsers();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is GetUsersLoadingState
              ? const LoadingColumn(message: 'Getting users',)
              : state is CreateUserLoadingState 
              ? const LoadingColumn(message: 'Creating user',)
              : state is GetUsersState
              ?
              ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].name),
                    leading: Image.network(state.users[index].avatar),
                    trailing: Text(state.users[index].id),
                    subtitle: Text(state.users[index].createdAt),
                  );
                },
              ): const SizedBox.shrink(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) =>  const CreateUserScreen(),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
