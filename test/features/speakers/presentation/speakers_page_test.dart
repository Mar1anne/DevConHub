import 'package:devcon_hub/core/cubit/generic_cubit.dart';
import 'package:devcon_hub/core/cubit/generic_state.dart';
import 'package:devcon_hub/features/speakers/domain/entities/speaker.dart';
import 'package:devcon_hub/features/speakers/domain/usecases/get_speakers.dart';
import 'package:devcon_hub/features/speakers/presentation/view/speakers_card.dart';
import 'package:devcon_hub/features/speakers/presentation/view/speakers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockSpeakersCubit extends Mock implements GenericCubit<List<Speaker>, void> {}

class MockGetSpeakersUseCase extends Mock implements GetSpeakersUseCase {}

void main() {
  late MockSpeakersCubit mockCubit;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    final mockUseCase = MockGetSpeakersUseCase();
    mockCubit = MockSpeakersCubit();

    GetIt.instance.registerSingleton<GetSpeakersUseCase>(mockUseCase);

    final speakers = [
      Speaker(
          id: '1',
          name: 'John Doe',
          bio: 'Flutter Developer',
          imageUrl: 'https://picsum.photos/200',
          company: 'company',
          jobTitle: 'jobTitle'),
      Speaker(
          id: '2',
          name: 'Jane Smith',
          bio: 'Dart Developer',
          imageUrl: 'https://picsum.photos/200',
          company: 'company',
          jobTitle: 'jobTitle'),
    ];

    when(() => mockUseCase.call(null)).thenAnswer((_) async => speakers);
    when(() => mockCubit.execute()).thenAnswer((_) async {});
    when(() => mockCubit.close()).thenAnswer((_) async {});
  });

  tearDownAll(() {
    mockCubit.close();
    GetIt.instance.reset();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<GenericCubit<List<Speaker>, void>>.value(
        value: mockCubit,
        child: const SpeakerListPage(),
      ),
    );
  }

  testWidgets('displays loading indicator when state is GenericLoading', (tester) async {
    when(() => mockCubit.state).thenReturn(GenericLoading());

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays list of speakers when state is GenericLoaded', (tester) async {
    await tester.pumpWidget(createTestWidget());

    final speakers = [
      Speaker(
          id: '1',
          name: 'John Doe',
          bio: 'Flutter Developer',
          imageUrl: 'imageUrl',
          company: 'company',
          jobTitle: 'jobTitle'),
      Speaker(
          id: '2',
          name: 'Jane Smith',
          bio: 'Dart Developer',
          imageUrl: 'imageUrl',
          company: 'company',
          jobTitle: 'jobTitle'),
    ];

    when(() => mockCubit.state).thenReturn(GenericLoaded(speakers));

    await mockNetworkImages(() async {
      await tester.pumpAndSettle();

      await tester.drag(find.byType(ListView), const Offset(0, -500));
      await tester.pumpAndSettle();

      expect(find.byType(SpeakerCard), findsNWidgets(speakers.length));
    });
  });

  testWidgets('displays empty state when state is GenericInitial', (tester) async {
    when(() => mockCubit.state).thenReturn(GenericInitial());

    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(SpeakerCard), findsNothing);
    expect(find.byType(SizedBox), findsAtLeast(1));
  });
}
