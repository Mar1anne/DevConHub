import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/home/domain/usecases/get_agenda.dart';
import 'package:devcon_hub/features/home/presentation/view/agenda_item_card.dart';
import 'package:devcon_hub/features/home/presentation/view/drawer_scaffold.dart';
import 'package:devcon_hub/shared/extensions/nullable_string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

typedef GetAgendaCubit = GenericCubit<List<AgendaItem>, void>;
typedef GetSpeakersState = GenericState<List<AgendaItem>>;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      title: 'DevCon 2025',
      body: BlocProvider<GetAgendaCubit>(
        create: (context) =>
            GenericCubit<List<AgendaItem>, void>(GetIt.instance<GetAgendaUseCase>())..execute(),
        child: BlocBuilder<GetAgendaCubit, GetSpeakersState>(
          builder: (context, state) {
            if (state is GenericLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GenericLoaded<List<AgendaItem>>) {
              final agendaItems = state.data;
              return ListView.builder(
                itemCount: agendaItems.length,
                itemBuilder: (context, index) {
                  final agendaItem = agendaItems[index];
                  return AgendaItemCard(item: agendaItem);
                },
              );
            } else if (state is GenericError) {
              return Center(child: Text('Error: ${state.toString()}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
