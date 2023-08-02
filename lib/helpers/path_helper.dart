class PathHelper {
  static String removeIllegalCharacters(String input) {
    return input.replaceAll(RegExp('[~"#%&*:<>?/\\{|}]+'), '-');
  }
}
