import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../repositories/matches_repository.dart';
import '../../services/toaster_service.dart';
import 'cubits/matches_search_cubit.dart';
import 'matches_search_page_view.dart';

class MatchesSearchPageShell extends StatelessWidget {
  const MatchesSearchPageShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => MatchesSearchCubit(
        matchesRepository: blocContext.read<MatchesRepository>(),
        toasterService: blocContext.read<ToasterService>(),
        settingsCubit: blocContext.read<SettingsCubit>(),
      ),
      child: const MatchesSearchPageView(),
    );
  }
}
