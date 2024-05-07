import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../repositories/pacings_repository.dart';
import '../../services/toaster_service.dart';
import 'cubits/pacings_search_cubit.dart';
import 'pacings_search_page_view.dart';

class PacingsSearchPageShell extends StatelessWidget {
  const PacingsSearchPageShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => PacingsSearchCubit(
        pacingsRepository: blocContext.read<PacingsRepository>(),
        toasterService: blocContext.read<ToasterService>(),
        settingsCubit: blocContext.read<SettingsCubit>(),
      ),
      child: const PacingsSearchPageView(),
    );
  }
}
