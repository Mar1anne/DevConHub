import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/features/speakers/domain/usecases/get_speakers.dart';
import 'package:devcon_hub/shared/extensions/nullable_string_extension.dart';
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
      child: Scaffold(
        appBar: AppBar(title: const Text('Speakers')),
        body: BlocBuilder<GetSpeakersCubit, GetSpeakersState>(
          builder: (context, state) {
            if (state is GenericLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GenericLoaded<List<Speaker>>) {
              final speakers = state.data;
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: speakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final speaker = speakers[index];
                  return GestureDetector(
                    onTap: () => context.push('/speaker_details', extra: speaker),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            speaker.imageUrl.emptyIfNull,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (speaker.name.isNotNullOrEmpty)
                          Text(speaker.name!, style: Theme.of(context).textTheme.titleMedium),
                        if (speaker.jobTitle.isNotNullOrEmpty)
                          Text(speaker.jobTitle!, style: Theme.of(context).textTheme.bodySmall),
                        if (speaker.company.isNotNullOrEmpty)
                          Text(speaker.company!, style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  );
                },
              );
            } else if (state is GenericError) {
              return Center(child: Text(state.toString()));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
