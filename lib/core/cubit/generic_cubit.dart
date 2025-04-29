import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// T - Type of data to be loaded
/// P - Type of parameters to be passed to the use case
class GenericCubit<T, P> extends Cubit<GenericState<T>> {
  final UseCase<T, P> useCase;

  GenericCubit(this.useCase) : super(GenericInitial<T>());

  Future<void> execute([P? params]) async {
    emit(GenericLoading<T>());
    try {
      final result = await useCase(params);
      emit(GenericLoaded<T>(result));
    } catch (e) {
      emit(GenericError<T>('Failed to load data'));
    }
  }
}
