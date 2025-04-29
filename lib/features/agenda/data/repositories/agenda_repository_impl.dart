import 'package:devcon_hub/features/agenda/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/agenda/data/models/agenda_item_response.dart';
import 'package:devcon_hub/features/agenda/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/agenda/domain/repositories/agenda_repository.dart';

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
