import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/pacing_cubit.dart';
import '../models/pacing_model.dart';

class PacingView extends StatelessWidget {
  static const double kExpandedHeight = 150.0;
  static const double kBottomHeight = 36.0;

  const PacingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingCubit, PacingModel>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: "Add improvisation",
            child: const Icon(Icons.add),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: kExpandedHeight,
                pinned: true,
                snap: true,
                floating: true,
                title: Text(state.name ?? "New pacing"),
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  titlePadding: const EdgeInsets.fromLTRB(10, 10, 10, kBottomHeight),
                  title: TextField(
                    controller: TextEditingController(text: state.name),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kBottomHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Improvisations: ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    (state.improvisations?.length ?? 0).toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Time: ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    ((state.improvisations?.fold(Duration.zero, (Duration p, v) => p + v.duration) ?? Duration.zero).inSeconds / 60.0)
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    " min",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text('Place ${index + 1}'),
                    );
                  },
                  childCount: state.improvisations?.length ?? 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
