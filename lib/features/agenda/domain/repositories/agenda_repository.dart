import 'package:devcon_hub/features/agenda/domain/entities/agenda_item.dart';

/// Clean domain-layer contract.
//
// No Firebase or low-level details exposed.
abstract class AgendaRepository {
  Future<List<AgendaItem>> getAgendaItems();
}
