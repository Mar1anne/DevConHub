import 'package:devcon_hub/features/agenda/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/agenda/domain/repositories/agenda_repository.dart';

class GetAgenda {
  final AgendaRepository repository;

  GetAgenda(this.repository);

  Future<List<AgendaItem>> call() async {
    return await repository.getAgendaItems();
  }
}
