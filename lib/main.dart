import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ihun_food_app/src/core/services/injection_container.dart';

import 'src/features/authenticate/views/bloc/authenticate_bloc.dart';
import 'src/features/authenticate/views/signin/sign_in_page.dart';
import 'src/features/products/views/bloc/products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
            create: (context) => sl<ProductsBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<AuthenticateBloc>(),
          )
        ],
        child: MaterialApp(
          title: 'iHun Food App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SignInPage(),
        ),
      ),
    );
  }
}
