import 'package:database/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_service/http_service.dart';
import 'package:sada_checkpoint/src/data/repositories/insert_occurrence_in_database_repository_impl.dart';
import 'package:sada_checkpoint/src/data/repositories/update_occurrence_sync_repository_impl.dart';
import 'package:sada_checkpoint/src/domain/use_cases/submit_occurrence_use_case.dart';

import '../data/repositories/send_occurrence_repository_impl.dart';
import '../presentation/screens/camera_screen/camera_store.dart';
import '../presentation/screens/occurrence_form/store/occurrence_store.dart';
import '../presentation/screens/screens.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomeScreen());
    r.child(
      '/occurrence',
      child: (_) => VehiclePhotoScreen(
        store: Modular.get<OccurrenceStore>()..initOccurence(),
      ),
    );
    r.child(
      '/occurrence/camera',
      child: (_) =>
          CameraScreen(cameraStore: Modular.get<CameraStore>()..init()),
    );

    r.child(
      '/occurrence/responsable',
      child: (_) => ResponsableScreen(
        store: Modular.get<OccurrenceStore>()..initResponsable(),
      ),
    );
    r.child(
      '/occurrence/responsable/signature',
      child: (_) => SignatureScreen(
        store: Modular.get<OccurrenceStore>()..initSignature(),
      ),
    );
    r.child(
      '/occurrence/success',
      child: (_) =>
          SuccessOccurrenceScreen(store: Modular.get<OccurrenceStore>()),
    );
    super.routes(r);
  }

  @override
  void binds(Injector i) {
    i.add<CameraStore>(() => CameraStore());
    i.addSingleton<DatabaseService>(() => DatabaseService.instance);
    i.addSingleton<HttpService>(() => HttpService.instance);
    i.addInstance(
      OccurrenceStore(
        submitOccurrenceUseCase: SubmitOccurrenceUseCase(
          insertOccurenceInDatabaseRepository:
              InsertOccurenceInDatabaseRepositoryImpl(
                databaseService: DatabaseService.instance,
              ),
          sendOccurrenceRepository: SendOccurrenceRepositoryImpl(
            httpService: HttpService.instance,
          ),
          updateOccurrenceSyncRepository: UpdateOccurrenceSyncRepositoryImpl(
            databaseService: DatabaseService.instance,
          ),
        ),
      ),
    );
    super.binds(i);
  }
}
