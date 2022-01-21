import 'package:code_challenge/core/services/snackbar_service.dart';
import 'package:code_challenge/features/TimeMachine/domain/repository/time_machine_repo.dart';
import 'package:code_challenge/features/TimeMachine/view/provider/base_provider.dart';

class TimeMachineProvider extends BaseProvider {
  final TimeMachineRepo _timeMachineRepo;
  final SnackBarService _snackBarService;

  TimeMachineProvider(
      {required TimeMachineRepo timeMachineRepo,
      required SnackBarService snackBarService})
      : _timeMachineRepo = timeMachineRepo,
        _snackBarService = snackBarService;

  Future<bool> fetchDCA() async {
    setState(ProviderState.loading);
    final dcaEither = await _timeMachineRepo.fetchDCA(requestEntity);
    setState(ProviderState.idle);
    return dcaEither.fold(
      (failure) {
        _snackBarService.displayMessage(failure.message);
        return false;
      },
      (response) {
        responseEntity = response;
        return true;
      },
    );
  }
}
