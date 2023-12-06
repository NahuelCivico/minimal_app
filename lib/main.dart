import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minimal_app/core/app/minimal_app.dart';
import 'package:minimal_app/core/env/env.dart';
import 'package:minimal_app/core/helpers/storage_preferences.dart';
import 'package:minimal_app/features/customers/cubit/customer_repository.dart';
import 'package:tots_core/tots_core.dart';

import 'core/helpers/app_bloc_observer.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/cubit/auth_repository.dart';
import 'features/customers/cubit/customer_cubit.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  TotsHttp.instance.options.baseUrl = Env.baseUrl;
  await StoragePreferences.init();
  Bloc.observer = AppBlocObserver();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => CustomerRepository(
            authRepository: context.read<AuthRepository>(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => CustomerCubit(
              customerRepository: context.read<CustomerRepository>(),
            ),
          ),
        ],
        child: const MinimalApp(),
      ),
    ),
  );
}
