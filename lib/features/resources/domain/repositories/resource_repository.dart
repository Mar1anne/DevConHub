import 'package:devcon_hub/features/resources/domain/entities/resource.dart';

abstract class ResourceRepository {
  Future<List<Resource>> getResources();
}
