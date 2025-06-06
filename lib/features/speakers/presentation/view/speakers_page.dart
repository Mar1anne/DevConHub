import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/features/home/presentation/view/drawer_scaffold.dart';
import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/features/speakers/domain/usecases/get_speakers.dart';
import 'package:devcon_hub/features/speakers/presentation/view/speakers_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

typedef GetSpeakersCubit = GenericCubit<List<Speaker>, void>;
typedef GetSpeakersState = GenericState<List<Speaker>>;

class SpeakerListPage extends StatelessWidget {
  const SpeakerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetSpeakersCubit>(
      create: (context) => GenericCubit(GetIt.instance<GetSpeakersUseCase>())..execute(),
      child: DrawerScaffold(
        title: 'Speakers',
        body: BlocBuilder<GetSpeakersCubit, GetSpeakersState>(
          builder: (context, state) {
            if (state is GenericLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GenericLoaded<List<Speaker>>) {
              final speakers = state.data;

              return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: speakers.length,
                  itemBuilder: (context, index) {
                    final speaker = speakers[index];
                    return InkWell(
                        child: SpeakerCard(speaker: speaker),
                        onTap: () {
                          context.push('/speaker/details', extra: speaker);
                        });
                  });
            } else if (state is GenericError) {
              return Center(child: Text('Something went wrong.'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
