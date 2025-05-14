import 'dart:async';

import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/tag_model.dart';
import '../../pages/tags_search/tags_search_page_view.dart';
import '../../validators/validators.dart';
import '../buttons/loading_icon_button.dart';

class TagsFieldElement extends StatefulWidget {
  final String label;
  final String? hintText;
  final List<TagModel> initialTags;
  final bool autoFocus;
  final bool autoUnfocus;
  final FutureOr<void> Function(List<TagModel> value)? onChanged;
  final FocusNode? focusNode;
  final Future<List<TagModel>> Function(String search) getAllTags;

  const TagsFieldElement({
    super.key,
    required this.label,
    required this.initialTags,
    required this.getAllTags,
    this.hintText,
    this.autoFocus = false,
    this.autoUnfocus = true,
    this.onChanged,
    this.focusNode,
  });

  @override
  State<TagsFieldElement> createState() => _TagsFieldElementState();
}

class _TagsFieldElementState extends State<TagsFieldElement> {
  late final StringTagController _tagController;

  @override
  void initState() {
    _tagController = StringTagController();
    _tagController.addListener(_onChange);
    super.initState();
  }

  @override
  void dispose() {
    _tagController.dispose();
    _tagController.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    final tags = _tagController.getTags ?? [];
    final tagModels = widget.initialTags.where((e) => tags.contains(e.name)).toList();
    final newTags = tags.where((e) => !widget.initialTags.any((t) => t.name == e)).toList();
    tagModels.addAll(newTags.map((e) => TagModel(id: 0, name: e)));
    widget.onChanged?.call(tagModels);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextFieldTags<String>(
          textSeparators: const [','],
          validator: (value) => Validators.duplicateTag(value, widget.initialTags.map((e) => e.name).toList()),
          textfieldTagsController: _tagController,
          initialTags: widget.initialTags.map((e) => e.name).toList(),
          letterCase: LetterCase.normal,
          inputFieldBuilder:
              (context, textFieldValues) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      suffixIcon: LoadingIconButton(
                        tooltip: S.of(context).search(category: widget.label),
                        icon: const Icon(Icons.search),
                        onPressed: () => TagsSearchPageView.showDialog(context),
                      ),
                      hintText: widget.hintText,
                      errorText: textFieldValues.error,
                    ),
                    autofocus: widget.autoFocus,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    onTapOutside: (event) {
                      if (widget.autoUnfocus) {
                        if (textFieldValues.textEditingController.text.isNotEmpty) {
                          textFieldValues.onTagSubmitted(textFieldValues.textEditingController.text);
                        }

                        FocusScope.of(context).unfocus();
                      }
                    },
                    controller: textFieldValues.textEditingController,
                    focusNode: textFieldValues.focusNode,
                    onChanged: textFieldValues.onTagChanged,
                    onSubmitted: textFieldValues.onTagSubmitted,
                  ),
                  if (textFieldValues.tags.isNotEmpty) ...[
                    Wrap(
                      spacing: 8.0,
                      children:
                          textFieldValues.tags.map((String tag) {
                            return Chip(
                              label: Text(tag),
                              deleteIcon: const Icon(Icons.cancel, size: 20),
                              onDeleted: () {
                                textFieldValues.onTagRemoved(tag);
                              },
                            );
                          }).toList(),
                    ),
                  ],
                ],
              ),
        ),
      ],
    );
  }
}
