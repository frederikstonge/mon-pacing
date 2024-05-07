import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../router/routes.dart';
import 'cubits/pacings_search_cubit.dart';
import 'cubits/pacings_search_state.dart';

class PacingsSearchPageView extends StatelessWidget {
  const PacingsSearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          textInputAction: TextInputAction.search,
          autofocus: true,
          decoration: InputDecoration(
              hintText: S.of(context).search,
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              border: InputBorder.none),
          onChanged: (value) {
            context.read<PacingsSearchCubit>().fetch(value);
          },
          onFieldSubmitted: (value) {
            context.read<PacingsSearchCubit>().fetch(value);
          },
        ),
      ),
      body: BlocBuilder<PacingsSearchCubit, PacingsSearchState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.hasMore ? state.pacings.length + 1 : state.pacings.length,
            itemBuilder: (context, index) {
              if (state.hasMore && index != 0 && index == state.pacings.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final pacing = state.pacings.elementAtOrNull(index);
              if (pacing == null) {
                return const SizedBox.shrink();
              }

              return InkWell(
                onTap: () => GoRouter.of(context).goNamed(Routes.pacing, pathParameters: {'id': '${pacing.id}'}),
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    pacing.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).improvisationCount(pacing.improvisations.length),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        S.of(context).modifiedDate(pacing.modifiedDate!),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}