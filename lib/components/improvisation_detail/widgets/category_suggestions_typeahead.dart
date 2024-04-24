import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../l10n/app_localizations.dart';
import '../../../models/category_suggestion_model.dart';
import '../../../models/improvisation_model.dart';
import '../../../repositories/category_suggestion_repository.dart';
import '../../actions/loading_icon_button.dart';
import '../../form/text_field_element.dart';

class CategorySuggestionsTypeahead extends StatefulWidget {
  final ImprovisationModel improvisation;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;
  final TextEditingController categoryController;

  const CategorySuggestionsTypeahead({
    super.key,
    required this.improvisation,
    required this.onChanged,
    required this.categoryController,
  });

  @override
  State<CategorySuggestionsTypeahead> createState() => _CategorySuggestionsTypeaheadState();
}

class _CategorySuggestionsTypeaheadState extends State<CategorySuggestionsTypeahead> {
  late final SuggestionsController<CategorySuggestionModel> _suggestionsController;

  @override
  void initState() {
    _suggestionsController = SuggestionsController<CategorySuggestionModel>();
    super.initState();
  }

  @override
  void dispose() {
    _suggestionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<CategorySuggestionModel>(
      suggestionsController: _suggestionsController,
      controller: widget.categoryController,
      builder: (context, controller, focusNode) => TextFieldElement(
        label: S.of(context).category,
        controller: controller,
        focusNode: focusNode,
        onTapOutside: () async => await context.read<CategorySuggestionRepository>().add(widget.categoryController.text),
        onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(category: value)),
      ),
      onSelected: (value) async {
        widget.categoryController.text = value.name;
        await widget.onChanged.call(widget.improvisation.copyWith(category: value.name));
      },
      emptyBuilder: (context) => const SizedBox(),
      hideOnLoading: false,
      itemBuilder: (BuildContext context, CategorySuggestionModel value) => ListTile(
        title: Text(value.name),
        trailing: LoadingIconButton(
          icon: const Icon(Icons.remove),
          onPressed: () async {
            await context.read<CategorySuggestionRepository>().delete(value.id);
            _suggestionsController.refresh();
          },
        ),
      ),
      suggestionsCallback: (String search) async => await context.read<CategorySuggestionRepository>().search(search, 0, 5),
    );
  }
}
