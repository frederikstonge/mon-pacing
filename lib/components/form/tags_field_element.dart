import 'dart:async';

import 'package:material_ui/material_ui.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/tag_model.dart';
import '../../validators/validators.dart';

class TagsFieldElement extends StatefulWidget {
  final String label;
  final String? hintText;
  final List<TagModel> initialTags;
  final bool autoFocus;
  final bool autoUnfocus;
  final FutureOr<void> Function(List<TagModel> value)? onChanged;
  final FocusNode? focusNode;
  final Future<List<String>> Function(String search) getAllTags;

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
  final _controller = TextEditingController();
  late final FocusNode _focusNode;
  late final List<TagModel> _tags;
  late final List<TagModel> _originalTags;
  Future<List<String>>? _suggestions;
  String? _error;

  @override
  void initState() {
    super.initState();
    _tags = List.of(widget.initialTags);
    _originalTags = List.of(widget.initialTags);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    if (widget.focusNode == null) _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {});
  }

  void _onTextChanged(String value) {
    if (value.contains(',')) {
      final parts = value.split(',');
      for (var index = 0; index < parts.length - 1; index++) {
        if (!_addTag(parts[index])) {
          _controller.text = parts.skip(index).join(',');
          _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
          return;
        }
      }
      _controller.text = parts.last;
      _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
      value = parts.last;
    }
    setState(() {
      _error = null;
      _suggestions = value.trim().isEmpty ? null : widget.getAllTags(value.trim());
    });
  }

  bool _addTag(String value) {
    final name = value.trim();
    if (name.isEmpty) return true;
    final error =
        Validators.minimumLength(name, 3) ?? Validators.duplicateTag(name, _tags.map((tag) => tag.name).toList());
    if (error != null) {
      setState(() => _error = error);
      return false;
    }
    setState(() {
      final original = _originalTags.where((tag) => tag.name == name);
      _tags.add(original.isEmpty ? TagModel(id: 0, name: name) : original.first);
      _error = null;
      _controller.clear();
      _suggestions = null;
    });
    widget.onChanged?.call(List.of(_tags));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(widget.label, style: Theme.of(context).textTheme.labelMedium),
          ),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: widget.autoFocus,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: widget.hintText, errorText: _error),
            onChanged: _onTextChanged,
            onSubmitted: _addTag,
            onTapOutside: (_) {
              if (widget.autoUnfocus) {
                _addTag(_controller.text);
                _focusNode.unfocus();
              }
            },
          ),
          if (_focusNode.hasFocus && _suggestions != null)
            FutureBuilder<List<String>>(
              future: _suggestions,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    S.of(context).toasterGenericError,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  );
                }
                if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) {
                  return const SizedBox.shrink();
                }
                final suggestions = snapshot.data!.where((name) => !_tags.any((tag) => tag.name == name)).take(5);
                return Wrap(
                  spacing: 8,
                  children: suggestions
                      .map((name) => ActionChip(label: Text(name), onPressed: () => _addTag(name)))
                      .toList(),
                );
              },
            ),
          if (_tags.isNotEmpty)
            Wrap(
              spacing: 8,
              children: _tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag.name),
                      onDeleted: () {
                        setState(() => _tags.remove(tag));
                        widget.onChanged?.call(List.of(_tags));
                      },
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
