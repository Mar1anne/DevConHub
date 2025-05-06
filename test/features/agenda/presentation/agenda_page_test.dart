import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/features/home/domain/entities/agenda_item.dart';
import 'package:devcon_hub/features/home/domain/usecases/get_agenda.dart';
import 'package:devcon_hub/features/home/presentation/view/agenda_item_card.dart';
import 'package:devcon_hub/features/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockAgendaCubit extends Mock implements GenericCubit<List<AgendaItem>, void> {}

class MockGetAgendaUseCase extends Mock implements GetAgendaUseCase {}

void main() {
  late MockAgendaCubit mockCubit;

  setUpAll(() {
    final mockUseCase = MockGetAgendaUseCase();
    mockCubit = MockAgendaCubit();

    GetIt.instance.registerSingleton<GetAgendaUseCase>(mockUseCase);

    final agendaItems = [
      AgendaItem(
          id: '1',
          title: 'Flutter Workshop',
          subtitle: 'Flutter Workshop',
          description: 'Learn Flutter from scratch',
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 2)),
          imageUrl: 'https://picsum.photos/200',
          type: 'talk'),
      AgendaItem(
          id: '2',
          title: 'Dart Workshop',
          subtitle: 'Dart Workshop',
          description: 'Learn Dart from scratch',
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 2)),
          imageUrl: 'https://picsum.photos/200',
          type: 'talk'),
    ];

    when(() => mockUseCase.call(null)).thenAnswer((_) async => agendaItems);
    when(() => mockCubit.execute()).thenAnswer((_) async {});
  });

  tearDownAll(() {
    mockCubit.close();
    GetIt.instance.reset();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<GenericCubit<List<AgendaItem>, void>>.value(
        value: mockCubit,
        child: const HomePage(),
      ),
    );
  }

  testWidgets('displays loading indicator when state is GenericLoading', (tester) async {
    when(() => mockCubit.state).thenReturn(GenericLoading());

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays list of agenda items when state is GenericLoaded', (tester) async {
    await tester.pumpWidget(createTestWidget());

    final agendaItems = [
      AgendaItem(
          id: '1',
          title: 'Flutter Workshop',
          subtitle: 'Flutter Workshop',
          description: 'Learn Flutter from scratch',
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 2)),
          imageUrl: 'https://picsum.photos/200',
          type: 'talk'),
      AgendaItem(
          id: '2',
          title: 'Dart Workshop',
          subtitle: 'Dart Workshop',
          description: 'Learn Dart from scratch',
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(hours: 2)),
          imageUrl: 'https://picsum.photos/200',
          type: 'talk'),
    ];

    when(() => mockCubit.state).thenReturn(GenericLoaded(agendaItems));

    await mockNetworkImages(() async {
      await tester.pumpAndSettle();

      expect(find.byType(AgendaItemCard), findsNWidgets(2));
    });
  });

  testWidgets('displays loading indicator when state is GenericInitial', (tester) async {
    when(() => mockCubit.state).thenReturn(GenericInitial());

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(AgendaItemCard), findsNothing);
    expect(find.byType(SizedBox), findsAtLeast(1));
  });
}
