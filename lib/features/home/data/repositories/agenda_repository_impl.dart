import 'package:devcon_hub/features/home/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/home/domain/repositories/agenda_repository.dart';

/// Uses the datasource (could be Firebase or another backend).
//
// Maps AgendaResponse to the domain entity AgendaItem using a toEntity() extension or method.
class AgendaRepositoryImpl implements AgendaRepository {
  final FirebaseAgendaDatasource _datasource;

  AgendaRepositoryImpl(this._datasource);

  @override
  Future<List<AgendaItem>> getAgendaItems() async {
    final items = await _datasource.fetchAgenda();
    return items.map((item) => item.toEntity()).toList();
  }
}
