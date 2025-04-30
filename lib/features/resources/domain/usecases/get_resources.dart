import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:devcon_hub/features/resources/domain/repositories/resource_repository.dart';

class GetResources {
  final ResourceRepository repository;

  GetResources(this.repository);

  Future<List<Resource>> call() async {
    return await repository.getResources();
  }
}
