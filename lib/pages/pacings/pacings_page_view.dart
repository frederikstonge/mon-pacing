import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/pacings/pacings_state.dart';
import '../../l10n/app_localizations.dart';
import '../../models/constants.dart';
import '../../router/routes.dart';
import '../pacing/widgets/pacing_detail_view.dart';
import 'widgets/pacing_card.dart';

class PacingsPageView extends StatefulWidget {
  const PacingsPageView({super.key});

  @override
  State<PacingsPageView> createState() => _PacingsPageViewState();
}

class _PacingsPageViewState extends State<PacingsPageView> {
  late ScrollController _scrollController;
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingsCubit, PacingsState>(
      builder: (context, state) {
        return RefreshIndicator(
          edgeOffset: MediaQuery.of(context).padding.top + Constants.expandedAppbarHeight,
          onRefresh: context.read<PacingsCubit>().refresh,
          child: SliverScaffold(
            scrollController: _scrollController,
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BottomSheetDialog.showDialog(
                  context: context,
                  child: PacingDetailView(
                    onConfirm: (pacing) async {
                      final router = GoRouter.of(context);
                      final pacingModel = await context.read<PacingsCubit>().add(pacing);
                      router.goNamed(Routes.pacing, pathParameters: {'id': '${pacingModel.id}'});
                    },
                  ),
                );
              },
              tooltip: S.of(context).createNewPacingTooltip,
              child: const Icon(Icons.add),
            ),
            slivers: [
              SliverLogoAppbar(
                title: S.of(context).pacings,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: IconButton(
                      icon: const Icon(Icons.download),
                      tooltip: S.of(context).importPacingTooltip,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              state.when(
                initial: () => const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error) => SliverFillRemaining(
                  child: Center(
                    child: Text(error),
                  ),
                ),
                success: (pacings, hasMore) => SliverList.builder(
                  itemCount: hasMore ? pacings.length + 1 : pacings.length,
                  itemBuilder: (context, index) {
                    if (hasMore && index != 0 && index == pacings.length) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return PacingCard(pacing: pacings.elementAt(index));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      await context.read<PacingsCubit>().fetch();
    }
  }
}
