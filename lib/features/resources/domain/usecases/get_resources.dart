import 'package:devcon_hub/core/usecase/usecase.dart';
import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:devcon_hub/features/resources/domain/repositories/resource_repository.dart';

class GetResourcesUseCase extends UseCase<List<Resource>, void> {
  final ResourceRepository repository;

  GetResourcesUseCase(this.repository);

  @override
  Future<List<Resource>> call(void params) {
    return repository.getResources();
  }
}
