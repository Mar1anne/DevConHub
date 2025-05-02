import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/features/home/presentation/view/drawer_scaffold.dart';
import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:devcon_hub/features/resources/domain/usecases/get_resources.dart';
import 'package:devcon_hub/features/resources/presentation/view/resources_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

typedef GetResourcesCubit = GenericCubit<List<Resource>, void>;
typedef GetResourcesState = GenericState<List<Resource>>;

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetResourcesCubit>(
      create: (context) => GenericCubit(GetIt.instance<GetResourcesUseCase>())..execute(),
      child: DrawerScaffold(
        title: 'Resources',
        body: BlocBuilder<GetResourcesCubit, GetResourcesState>(
          builder: (context, state) {
            if (state is GenericLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GenericLoaded<List<Resource>>) {
              final resources = state.data;

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: resources.length,
                itemBuilder: (context, index) {
                  final resource = resources[index];
                  return ResourceCard(resource: resource);
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
