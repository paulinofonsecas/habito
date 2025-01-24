import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore
import 'package:get_it/get_it.dart';
import 'package:habito_2/data/datasource/i_habito_datasource.dart';
import 'package:habito_2/data/datasource/sp_habito_datasource.dart';
import 'package:habito_2/data/repository/habito_repository.dart';
import 'package:habito_2/domain/usecases/habito_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; // sl is service locator

Future<void> setupServiceLocator() async {
  final sp = await SharedPreferences.getInstance();
  // ------------------------- External Dependencies -------------------------
  // Register FirebaseFirestore instance
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<SharedPreferences>(() => sp);

  // ------------------------- Data Sources -------------------------
  // Register FirebaseHabitoDataSource as a singleton and bind it to HabitoDataSource interface
  sl.registerLazySingleton<HabitoDataSource>(
    () => SPHabitoDatasource(),
  );

  // ------------------------- Repositories -------------------------
  // Register HabitoRepository as a singleton
  sl.registerLazySingleton<HabitoRepository>(
    () => HabitoRepository(sl<HabitoDataSource>()),
  );

  // ------------------------- Use Cases -------------------------
  // Register Use Cases as factories (usually, Use Cases are stateless, so factory is fine)
  sl.registerFactory<CriarHabitoUseCase>(
    () => CriarHabitoUseCase(sl<HabitoRepository>()),
  );

  sl.registerFactory<ObterListaHabitosUseCase>(
    () => ObterListaHabitosUseCase(sl<HabitoRepository>()),
  );

  sl.registerFactory<ObterListaHabitosConcluidosUseCase>(
    () => ObterListaHabitosConcluidosUseCase(sl<HabitoRepository>()),
  );

  sl.registerFactory<ObterDetalhesHabitoUseCase>(
    () => ObterDetalhesHabitoUseCase(sl<HabitoRepository>()),
  );

  sl.registerFactory<AtualizarHabitoUseCase>(
    () => AtualizarHabitoUseCase(sl<HabitoRepository>()),
  );

  sl.registerFactory<ExcluirHabitoUseCase>(
    () => ExcluirHabitoUseCase(sl<HabitoRepository>()),
  );

  sl.registerFactory<MarcarHabitoConcluidoUseCase>(
    () => MarcarHabitoConcluidoUseCase(
      sl<HabitoRepository>(),
      sl<ObterDetalhesHabitoUseCase>(), // Dependency on another Use Case
    ),
  );

  sl.registerFactory<DesmarcarHabitoConcluidoUseCase>(
    () => DesmarcarHabitoConcluidoUseCase(
      sl<HabitoRepository>(),
      sl<ObterDetalhesHabitoUseCase>(), // Dependency on another Use Case
    ),
  );
}
