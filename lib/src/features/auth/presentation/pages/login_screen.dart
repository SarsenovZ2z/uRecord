import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_states.dart';
import 'package:urecord/src/features/auth/presentation/widgets/auth_email_field.dart';
import 'package:urecord/src/features/auth/presentation/widgets/auth_password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
          ),
          _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login(BuildContext context) async {
    context.read<AuthCubit>().login(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverList.list(
        children: [
          Row(
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoTheme.of(context)
                      .textTheme
                      .tabLabelTextStyle
                      .color,
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  context.push<String?>('/register').then((email) {
                    if (email is String) {
                      _emailController.text = email;
                    }
                  });
                },
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: CupertinoFormSection(
              children: [
                AuthEmailField(
                  controller: _emailController,
                ),
                AuthPasswordField(
                  controller: _passwordController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
            final bool isLoading = state is AuthenticatingState;
            return CupertinoButton.filled(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _login(context);
                      }
                    },
              child: AnimatedSize(
                duration: const Duration(milliseconds: 100),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: CupertinoActivityIndicator(),
                      ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
