import 'package:bloc_test/bloc_test.dart';
import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/core/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UseCaseMock<T, Params> extends Mock implements UseCase<T, Params> {}

void main() {
  late GenericCubit<String, int> genericCubit;
  late UseCaseMock<String, int> useCaseMock;

  setUp(() {
    useCaseMock = UseCaseMock<String, int>();
    genericCubit = GenericCubit<String, int>(useCaseMock);

    when(() => useCaseMock.call(any())).thenAnswer((_) async => 'Success');
  });

  tearDown(() => genericCubit.close());

  test('initial state is GenericInitial', () {
    expect(genericCubit.state, isA<GenericInitial<String>>());
  });

  blocTest<GenericCubit<String, int>, GenericState<String>>(
    'GenericCubit emits [GenericLoading, GenericLoaded] when use case succeeds',
    build: () {
      when(() => useCaseMock.call(any())).thenAnswer((_) async => 'Success');
      return genericCubit;
    },
    act: (cubit) => cubit.execute(1),
    expect: () => [
      isA<GenericLoading<String>>(),
      isA<GenericLoaded<String>>().having((state) => state.data, 'data', 'Success'),
    ],
  );

  blocTest<GenericCubit<String, int>, GenericState<String>>(
    'GenericCubit emits [GenericLoading, GenericError] when use case fails',
    build: () {
      when(() => useCaseMock.call(any())).thenThrow(Exception('Error'));
      return genericCubit;
    },
    act: (cubit) => cubit.execute(1),
    expect: () => [
      isA<GenericLoading<String>>(),
      isA<GenericError<String>>()
          .having((state) => state.message, 'message', 'Failed to load data'),
    ],
  );
}
