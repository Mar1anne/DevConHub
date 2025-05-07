import 'package:devcon_hub/core/cache/generic_cache.dart';
import 'package:devcon_hub/features/home/data/datasources/agenda_datasource.dart';
import 'package:devcon_hub/features/home/data/models/agenda_item_response.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/home/domain/repositories/agenda_repository.dart';

/// Uses the datasource (could be Firebase or another backend).
//
// Maps AgendaResponse to the domain entity AgendaItem using a toEntity() extension or method.
class AgendaRepositoryImpl implements AgendaRepository {
  final AgendaDataSource _datasource;
  final GenericCache<AgendaItem> _cache;

  AgendaRepositoryImpl(this._datasource, this._cache);

  @override
  Future<List<AgendaItem>> getAgendaItems() async {
    final cached = await _cache.getCachedItems();
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }

    final items = await _datasource.fetchAgenda();
    final agendaItems = _mapAndSort(items);

    await _cache.saveItems(agendaItems);

    return agendaItems;
  }

  List<AgendaItem> _mapAndSort(List<AgendaItemResponse> responses) {
    final agendaItems = responses.map((e) => e.toEntity()).toList();
    agendaItems.sort((a, b) => a.startTime!.compareTo(b.startTime!));
    return agendaItems;
  }
}
