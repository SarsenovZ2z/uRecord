import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urecord/src/common/presentation/widgets/ui/loading_screen.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_states.dart';

class AuthenticatedOnlyMiddleware extends StatelessWidget {
  final Widget child;

  const AuthenticatedOnlyMiddleware({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is NotAuthenticatedState) {
          context.push('/login');
        }
      },
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return child;
        }

        return const LoadingScreen();
      },
    );
  }
}
