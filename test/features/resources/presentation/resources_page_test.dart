import 'package:devcon_hub/features/resources/domain/usecases/get_resources.dart';
import 'package:devcon_hub/features/resources/presentation/view/resources_card.dart';
import 'package:devcon_hub/features/resources/presentation/view/resources_page.dart';
import 'package:devcon_hub/features/resources/domain/entities/resource.dart';
import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockResourcesCubit extends Mock implements GenericCubit<List<Resource>, void> {}

class MockGetResourcesUseCase extends Mock implements GetResourcesUseCase {}

void main() {
  late MockResourcesCubit mockCubit;

  setUpAll(() {
    final mockUseCase = MockGetResourcesUseCase();
    mockCubit = MockResourcesCubit();

    GetIt.instance.registerSingleton<GetResourcesUseCase>(mockUseCase);

    final resources = [
      Resource(id: '1', name: 'Flutter 1', url: 'https://flutter.dev'),
      Resource(id: '2', name: 'Dart 2', url: 'https://dart.dev'),
    ];

    when(() => mockUseCase.call(null)).thenAnswer((_) async => resources);
    when(() => mockCubit.execute()).thenAnswer((_) async {});
    when(() => mockCubit.close()).thenAnswer((_) async {});
  });

  tearDownAll(() {
    mockCubit.close();
    GetIt.instance.reset();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<GenericCubit<List<Resource>, void>>.value(
        value: mockCubit,
        child: const ResourcesPage(),
      ),
    );
  }

  testWidgets('displays loading indicator when state is GenericLoading', (tester) async {
    when(() => mockCubit.state).thenReturn(GenericLoading());

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays list of resources when state is GenericLoaded', (tester) async {
    await tester.pumpWidget(createTestWidget());

    final resources = [
      Resource(name: 'Resource 1', url: 'https://example.com/1', id: '111'),
      Resource(name: 'Resource 2', url: 'https://example.com/2', id: '222'),
    ];

    when(() => mockCubit.state).thenReturn(GenericLoaded(resources));

    await tester.pumpAndSettle();

    expect(find.byType(ResourceCard), findsNWidgets(2));
  });

  testWidgets('displays loading indicator when state is GenericInitial', (tester) async {
    when(() => mockCubit.state).thenReturn(GenericInitial());

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(ResourceCard), findsNothing);
    expect(find.byType(SizedBox), findsAtLeast(1));
  });
}
