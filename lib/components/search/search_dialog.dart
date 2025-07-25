import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../extensions/iterable_extensions.dart';
import '../../models/tag_base_model.dart';
import '../tag_filters/tag_filters.dart';

class SearchDialog<T> extends StatefulWidget {
  final FutureOr<List<T>> Function(String query, List<String> selectedTags) onChanged;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String hintText;

  const SearchDialog({super.key, required this.onChanged, required this.itemBuilder, required this.hintText});

  @override
  State<SearchDialog<T>> createState() => _SearchDialogState<T>();
}

class _SearchDialogState<T> extends State<SearchDialog<T>> {
  String query = '';
  List<T> items = [];
  List<String> tags = [];
  List<String> selectedTags = [];
  Timer? _debounce;

  @override
  void initState() {
    _onChanged(query, selectedTags);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.search,
          autofocus: true,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 18),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            _onChanged(value, selectedTags);
          },
          onFieldSubmitted: (value) {
            _onChanged(value, selectedTags);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (tags.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TagFilters(
                    allTags: tags,
                    selectedTags: selectedTags,
                    onTagSelected: (tag, selected) async {
                      final tags = List<String>.from(selectedTags);
                      if (selected) {
                        tags.add(tag);
                      } else {
                        tags.remove(tag);
                      }

                      _onChanged(query, tags);
                    },
                  ),
                ),
              ],
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items.elementAt(index);
                  return widget.itemBuilder(context, item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChanged(String value, List<String> tags) {
    if (mounted) {
      setState(() {
        query = value;
        selectedTags = tags;
      });
    }

    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 250), () async {
      final newItems = await widget.onChanged(value, tags);
      if (mounted) {
        setState(() {
          items = newItems;
          this.tags = newItems
              .whereType<TagBaseModel>()
              .selectMany((e) => e.tags)
              .map((e) => e.name)
              .groupListsBy((e) => e)
              .values
              .sorted((a, b) => b.length - a.length)
              .map((e) => e.first)
              .toList();
        });
      }
    });
  }
}
