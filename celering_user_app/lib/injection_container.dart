import 'package:get_it/get_it.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:celering_user_app/amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:celering_user_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:celering_user_app/features/login/presentation/bloc/login_cubit.dart';
import 'package:celering_user_app/features/register/presentation/bloc/register_cubit.dart';
import 'package:celering_user_app/features/search_view/presentation/bloc/search_view_cubit.dart';
import 'package:celering_user_app/features/search_view/domain/use_cases/search_view_use_case.dart';
import 'package:celering_user_app/features/confirm_email/presentation/bloc/confirm_email_cubit.dart';
import 'package:celering_user_app/features/search_view/data/data_sources/search_view_data_sources.dart';
import 'package:celering_user_app/features/search_view/domain/repositories/search_view_repository.dart';
import 'package:celering_user_app/features/search_view/data/repositories/search_view_repository_impl.dart';

final sl = GetIt.instance;

init() async {
  //Blocs
  sl.registerFactory(() => HomeCubit());
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => RegisterCubit());
  sl.registerFactory(() => ConfirmEmailCubit());
  sl.registerFactory(() => SearchViewCubit(searchViewUserCase: sl()));

// Use cases
  sl.registerLazySingleton(
      () => SearchViewUserCase(searchViewRepository: sl()));

//Repositories
  sl.registerLazySingleton<SearchViewRepository>(
      () => SearchViewRepositoryImpl(searchViewDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<SearchViewDataSource>(
      () => SearchViewDataSourceImpl(sharedPreferences: sl()));

  //SharedPreference
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // initial amplify

  final _amplifyInstance = Amplify;

  AmplifyAuthCognito _amplifyAuthCognito = AmplifyAuthCognito();
  _amplifyInstance.addPlugin(_amplifyAuthCognito);

  // Initialize AmplifyFlutter
  try {
    await _amplifyInstance.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException catch (e) {
    print(e);
  }
}
