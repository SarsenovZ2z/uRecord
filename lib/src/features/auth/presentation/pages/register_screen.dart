import 'package:flutter/cupertino.dart';
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
        ],
      ),
    );
  }
}


