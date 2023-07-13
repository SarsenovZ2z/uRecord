import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urecord/src/common/presentation/widgets/ui/loading_screen.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_states.dart';

class GuestsOnlyMiddleware extends StatelessWidget {
  final Widget child;

  const GuestsOnlyMiddleware({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          if (context.canPop()) {
            context.pop();
          } else {
            context.replace('/');
          }
        }
      },
      builder: (context, state) {
        if (state is! AuthenticatingState) {
          return child;
        }

        return const LoadingScreen();
      },
    );
  }
}
