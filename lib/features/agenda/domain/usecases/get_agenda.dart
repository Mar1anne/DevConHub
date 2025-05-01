import 'package:devcon_hub/core/usecase/usecase.dart';
import 'package:devcon_hub/features/agenda/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/agenda/domain/repositories/agenda_repository.dart';

class GetAgendaUseCase extends UseCase<List<AgendaItem>, void> {
  final AgendaRepository repository;

  GetAgendaUseCase(this.repository);

  @override
  Future<List<AgendaItem>> call(void params) {
    return repository.getAgendaItems();
  }
}
