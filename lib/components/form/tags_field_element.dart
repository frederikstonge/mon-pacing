import 'dart:async';

import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TagsFieldElement extends StatefulWidget {
  final String label;
  final List<String> initialTags;
  final bool autoFocus;
  final bool autoUnfocus;
  final FutureOr<void> Function(List<String> value)? onChanged;
  final FocusNode? focusNode;

  const TagsFieldElement({
    super.key,
    required this.label,
    required this.initialTags,
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
    widget.onChanged?.call(tags);
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
          textfieldTagsController: _tagController,
          initialTags: widget.initialTags,
          letterCase: LetterCase.normal,
          inputFieldBuilder: (context, textFieldValues) => TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              helper: textFieldValues.tags.isNotEmpty
                  ? Wrap(
                      spacing: 8.0,
                      children: textFieldValues.tags.map((String tag) {
                        return Chip(
                          label: Text(tag),
                          deleteIcon: const Icon(Icons.cancel, size: 20),
                          onDeleted: () {
                            textFieldValues.onTagRemoved(tag);
                          },
                        );
                      }).toList(),
                    )
                  : null,
            ),
            autofocus: widget.autoFocus,
            maxLines: 1,
            keyboardType: TextInputType.text,
            onTapOutside: (event) {
              if (widget.autoUnfocus) {
                FocusScope.of(context).unfocus();
              }
            },
            controller: textFieldValues.textEditingController,
            focusNode: textFieldValues.focusNode,
            onChanged: textFieldValues.onTagChanged,
            onSubmitted: textFieldValues.onTagSubmitted,
          ),
        ),
      ],
    );
  }
}
