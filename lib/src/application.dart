import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:urecord/src/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:urecord/src/router.dart';
import 'package:urecord/src/themes/light_theme.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          lazy: false,
          create: (_) => GetIt.instance()..loginByToken(),
        ),
      ],
      child: CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        title: 'uRecord',
        theme: lightTheme,
        routerConfig: router,
      ),
    );
  }
}
