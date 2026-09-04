import 'package:flutter/widgets.dart';

enum LetterCase { normal, small, capital }

typedef Validator<T> = String? Function(T tag);
typedef InputFieldBuilder<T> = Widget Function(BuildContext context, InputFieldValues<T> textFieldTagValues);

class ObjIder<O> {
  final O object;
  final bool origin;
  const ObjIder(this.object, this.origin);
}

class InputFieldValues<T> {
  final void Function(T tag) onTagChanged;
  final void Function(T tag) onTagSubmitted;
  final void Function(T tag) onTagRemoved;
  final ScrollController tagScrollController;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  List<T> tags;
  String? error;

  InputFieldValues({
    required this.textEditingController,
    required this.focusNode,
    required this.error,
    required this.onTagChanged,
    required this.onTagSubmitted,
    required this.onTagRemoved,
    required this.tags,
    required this.tagScrollController,
  });
}

abstract class TextfieldTagsNotifier<T> extends ChangeNotifier {
  late ObjIder<ScrollController>? _scrollController;
  late ObjIder<FocusNode>? _focusNode;
  late ObjIder<TextEditingController>? _textEditingController;

  late LetterCase? _letterCase;
  late Set<String>? _textSeparators;
  late List<T>? _tags;
  late Validator<T>? _validator;

  TextfieldTagsNotifier({
    List<T>? initialTags,
    Set<String>? textSeparators,
    LetterCase? letterCase,
    Validator<T>? validator,
    ObjIder<FocusNode>? focusNode,
    ObjIder<TextEditingController>? textEditingController,
    ObjIder<ScrollController>? scrollController,
  }) {
    _tags = initialTags;
    _textSeparators = textSeparators;
    _letterCase = letterCase;
    _validator = validator;

    _scrollController = scrollController;
    _textEditingController = textEditingController;
    _focusNode = focusNode;
  }

  bool? addTag(T tag) {
    if (_tags != null) {
      _tags!.add(tag);
      return true;
    }
    return null;
  }

  bool? removeTag(T tag) {
    if (_tags != null) {
      final removed = _tags!.remove(tag);
      return removed;
    }
    return null;
  }

  bool? clearTags() {
    if (_tags != null) {
      _tags!.clear();
      return true;
    }
    return null;
  }

  bool? onTagChanged(T tag);
  bool? onTagSubmitted(T tag);
  bool? onTagRemoved(T tag);

  @override
  void dispose() {
    super.dispose();
    if (_textEditingController != null && _textEditingController!.origin == true) {
      _textEditingController!.object.dispose();
    }
    if (_focusNode != null && _focusNode!.origin == true) {
      _focusNode!.object.dispose();
    }
    if (_scrollController != null && _scrollController!.origin == true) {
      _scrollController!.object.dispose();
    }
  }
}

class TextfieldTagsController<T> extends TextfieldTagsNotifier<T> {
  late int _tagScrollAnimationSpeedInMs;
  late String? _error;

  TextfieldTagsController() : _tagScrollAnimationSpeedInMs = 300, _error = null, super();

  List<T>? get getTags => _tags?.toList();
  String? get getError => _error;
  int get getTagScrollAnimationSpeedInMs => _tagScrollAnimationSpeedInMs;
  LetterCase? get getLetterCase => _letterCase;
  Set<String>? get getTextSeparators => _textSeparators;
  Validator<T>? get getValidator => _validator;
  ScrollController? get getScrollController => _scrollController?.object;
  FocusNode? get getFocusNode => _focusNode?.object;
  TextEditingController? get getTextEditingController => _textEditingController?.object;

  set setTagScrollAnimationSpeedInMs(int tsas) {
    _tagScrollAnimationSpeedInMs = tsas;
  }

  set setError(String? error) {
    _error = error;
  }

  void scrollTags() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController != null && _scrollController!.object.hasClients) {
        _scrollController!.object.animateTo(
          _scrollController!.object.position.maxScrollExtent,
          duration: Duration(milliseconds: _tagScrollAnimationSpeedInMs),
          curve: Curves.linear,
        );
      }
    });
  }

  void registerController(
    List<T>? initialTags,
    List<String>? textSeparators,
    LetterCase? letterCase,
    Validator<T>? validator,
    FocusNode? focusNode,
    TextEditingController? textEditingController,
    ScrollController? scrollController,
  ) {
    assert(
      (_tags == null && _textSeparators == null && _letterCase == null && _validator == null),
      'You\'ve already registered a tag controller',
    );
    _tags = initialTags != null ? initialTags.toList() : [];
    _textSeparators = textSeparators != null ? textSeparators.toSet() : {};
    _letterCase = letterCase ?? LetterCase.normal;
    _validator = validator;
    _focusNode = focusNode != null ? ObjIder<FocusNode>(focusNode, false) : ObjIder<FocusNode>(FocusNode(), true);
    _textEditingController = textEditingController != null
        ? ObjIder<TextEditingController>(textEditingController, false)
        : ObjIder<TextEditingController>(TextEditingController(), true);
    _scrollController = scrollController != null
        ? ObjIder<ScrollController>(scrollController, false)
        : ObjIder<ScrollController>(ScrollController(), true);
  }

  @override
  bool? clearTags() {
    final clear = super.clearTags();
    if (clear == true) {
      _error = null;
      _textEditingController?.object.clear();
      _focusNode?.object.requestFocus();
      notifyListeners();
    }
    return clear;
  }

  @override
  bool? onTagChanged(T tag) => null;

  @override
  bool? onTagSubmitted(T tag) {
    final add = super.addTag(tag);
    if (add == true) {
      _error = null;
      _textEditingController?.object.clear();
      notifyListeners();
    }
    return add;
  }

  @override
  bool? onTagRemoved(T tag) {
    final remove = super.removeTag(tag);
    if (remove == true) {
      _error = null;
      notifyListeners();
    }
    return remove;
  }
}

///[StringTagController] is a simpler version of dynamic controller offering a
///straight forward solution to store string tags (might be deprecated in the future as its somehow redundant in light of what is offered in dynamic controller).
class StringTagController<T extends String> extends TextfieldTagsController<T> {
  bool? _tagOperation(T tag) {
    bool? added;
    if (tag.isNotEmpty) {
      getTextEditingController?.clear();
      super.setError = getValidator?.call(tag);
      if (getError == null) {
        added = super.addTag(tag);
        if (added == true) {
          scrollTags();
        }
      }
      notifyListeners();
    }
    return added;
  }

  @override
  bool? onTagChanged(T tag) {
    final ts = getTextSeparators;
    final lc = getLetterCase;
    final separator = ts?.cast<String?>().firstWhere(
      (element) => tag.contains(element!) && tag.indexOf(element) != 0,
      orElse: () => null,
    );
    if (separator != null) {
      final splits = tag.split(separator);
      final indexer = splits.length > 1 ? splits.length - 2 : splits.length - 1;
      final tsv = lc == LetterCase.small
          ? splits.elementAt(indexer).trim().toLowerCase()
          : lc == LetterCase.capital
          ? splits.elementAt(indexer).trim().toUpperCase()
          : splits.elementAt(indexer).trim();
      return _tagOperation(tsv as T);
    }
    return null;
  }

  @override
  bool? onTagSubmitted(T tag) {
    final lc = getLetterCase;
    final tsv = lc == LetterCase.small
        ? tag.trim().toLowerCase()
        : lc == LetterCase.capital
        ? tag.trim().toUpperCase()
        : tag.trim();
    return _tagOperation(tsv as T);
  }

  @override
  set setError(String? error) {
    super.setError = error;
    notifyListeners();
  }
}

///[DynamicTagController] is a controller for managing dynamic tag entries
class DynamicTagController<T extends DynamicTagData> extends TextfieldTagsController<T> {
  bool? _tagOperation(T tag) {
    bool? added;
    if (tag.tag.isNotEmpty) {
      getTextEditingController?.clear();
      super.setError = getValidator?.call(tag);
      if (getError == null) {
        added = super.addTag(tag);
        if (added == true) {
          scrollTags();
        }
      }
      notifyListeners();
    }
    return added;
  }

  @override
  bool? onTagChanged(T tag) {
    final ts = getTextSeparators;
    final lc = getLetterCase;
    final separator = ts?.cast<String?>().firstWhere(
      (element) => tag.tag.contains(element!) && tag.tag.indexOf(element) != 0,
      orElse: () => null,
    );
    if (separator != null) {
      final splits = tag.tag.split(separator);
      final indexer = splits.length > 1 ? splits.length - 2 : splits.length - 1;
      final tsv = lc == LetterCase.small
          ? splits.elementAt(indexer).trim().toLowerCase()
          : lc == LetterCase.capital
          ? splits.elementAt(indexer).trim().toUpperCase()
          : splits.elementAt(indexer).trim();
      tag.tag = tsv;
      return _tagOperation(tag);
    }
    return null;
  }

  @override
  bool? onTagSubmitted(T tag) {
    final lc = getLetterCase;
    final tsv = lc == LetterCase.small
        ? tag.tag.trim().toLowerCase()
        : lc == LetterCase.capital
        ? tag.tag.trim().toUpperCase()
        : tag.tag.trim();
    tag.tag = tsv;
    return _tagOperation(tag);
  }

  @override
  set setError(String? error) {
    super.setError = error;
    notifyListeners();
  }
}

///[DynamicTagData] offers a model to store additional data with each tags
class DynamicTagData<D> {
  String tag;
  final D data;
  DynamicTagData(this.tag, this.data);
}

class TextFieldTags<T> extends StatefulWidget {
  ///[validator] allows you to validate the tag that has been entered
  final Validator<T>? validator;

  ///[initialTags] are optional initial tags that show up on the text field. Default is set to empty list.
  final List<T>? initialTags;

  ///Enter optional String separators to split the tags. Default is set to [","," "]
  final List<String>? textSeparators;

  ///Change the letter case of the text entered by user. Default is set to normal letter[LetterCase.normal]
  final LetterCase? letterCase;

  ///Use this to utilize your own [TextEditingController] instance created by you or by other widgets outside of this widget.
  ///If no controller is provider by you, the widget will use its own built in default controller.
  final TextEditingController? textEditingController;

  ///Use this to utilize your own [FocusNode] instance created by you or by other widgets outside of this widget.
  ///If no focus node is provider by you, the widget will use its own built in default one.
  final FocusNode? focusNode;

  ///Use this to utilize your own [ScrollController] instance created by you or by other widgets outside of this widget.
  ///If no scroll controller is provider, the widget will use a default one.
  final ScrollController? scrollController;

  ///This [InputFieldBuilder] allows you to build your own custom widget
  ///Note that this field is required
  final InputFieldBuilder<T> inputFieldBuilder;

  ///[TextfieldTagsController] is the controller that houses the control for tags, textfield properties and other properties.
  ///Note that this field is required to be initialized in your class
  ///and must have the same type as the [TextFieldTags] widget
  final TextfieldTagsController<T> textfieldTagsController;

  const TextFieldTags({
    super.key,
    this.validator,
    this.initialTags,
    this.textSeparators,
    this.letterCase,
    this.textEditingController,
    this.focusNode,
    this.scrollController,
    required this.textfieldTagsController,
    required this.inputFieldBuilder,
  });

  @override
  State<TextFieldTags<T>> createState() => _TextFieldTagsState<T>();
}

class _TextFieldTagsState<T> extends State<TextFieldTags<T>> {
  late TextfieldTagsController<T> _ttc;
  late InputFieldValues<T> _ifb;

  @override
  void initState() {
    super.initState();
    _ttc = widget.textfieldTagsController
      ..registerController(
        widget.initialTags,
        widget.textSeparators,
        widget.letterCase,
        widget.validator,
        widget.focusNode,
        widget.textEditingController,
        widget.scrollController,
      )
      ..scrollTags();

    _ifb = InputFieldValues(
      onTagChanged: _ttc.onTagChanged,
      onTagSubmitted: _ttc.onTagSubmitted,
      onTagRemoved: _ttc.onTagRemoved,
      tags: _ttc.getTags!,
      error: _ttc.getError,
      tagScrollController: _ttc.getScrollController!,
      textEditingController: _ttc.getTextEditingController!,
      focusNode: _ttc.getFocusNode!,
    );

    _ttc.addListener(() {
      if (mounted) {
        setState(() {
          _ifb.error = _ttc.getError;
          _ifb.tags = _ttc.getTags!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final build = widget.inputFieldBuilder(context, _ifb);
    return build;
  }
}
