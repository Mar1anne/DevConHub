import 'package:devcon_hub/features/speakers/presentation/view/speakers_page.dart';
import 'package:go_router/go_router.dart';

class SpeakersRoute {
  static const String path = '/speakers';
  static const String speakerDetailsPath = '/speaker_details';

  static GoRoute route = GoRoute(
    path: path,
    builder: (context, state) => const SpeakerListPage(),
  );

  static GoRoute speakerDetailsRoute = GoRoute(
    path: speakerDetailsPath,
    builder: (context, state) => const SpeakerListPage(),
  );
}
