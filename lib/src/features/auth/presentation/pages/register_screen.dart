import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:urecord/src/features/auth/presentation/widgets/auth_email_field.dart';
import 'package:urecord/src/features/auth/presentation/widgets/auth_name_field.dart';
import 'package:urecord/src/features/auth/presentation/widgets/auth_password_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(),
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

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _isLoading = false;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    context
        .read<AuthCubit>()
        .register(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        )
        .then((isSuccess) {
      if (isSuccess) {
        context.push<bool>('/verification').then((isSuccess) {
          if (isSuccess == true) {
            context.pop(_emailController.text);
          }
        });
      } else {
        // TODO: snackbar
      }
    }).catchError((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverList.list(
        children: [
          Form(
            key: _formKey,
            child: CupertinoFormSection(
              children: [
                AuthNameField(
                  controller: _nameController,
                ),
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
          CupertinoButton.filled(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _register(context);
              }
            },
            child: const Text('Sign up'),
          ),
          const SizedBox(height: 20),
          const _TermsOfUse(),
        ],
      ),
    );
  }
}

class _TermsOfUse extends StatelessWidget {
  const _TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle.merge(
              const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
        children: [
          const TextSpan(
            text:
                'By clicking Sign Up, you are indicating that you have read and agree to the ',
          ),
          TextSpan(
            text: 'Terms of Use',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: CupertinoTheme.of(context).primaryColor,
            ),
          ),
          const TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: CupertinoTheme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
