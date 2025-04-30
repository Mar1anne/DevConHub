import 'package:devcon_hub/features/resources/data/datasources/resource_datasource.dart';
import 'package:devcon_hub/features/resources/data/models/resource_response.dart';
import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:devcon_hub/features/resources/domain/repositories/resource_repository.dart';

class ResourceRepositoryImpl implements ResourceRepository {
  final FirebaseResourceDatasource _datasource;

  ResourceRepositoryImpl(this._datasource);

  @override
  Future<List<Resource>> getResources() async {
    final items = await _datasource.fetchResources();
    return items.map((item) => item.toEntity()).toList();
  }
}
