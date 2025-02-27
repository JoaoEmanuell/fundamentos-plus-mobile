String clearQueryStrings(String query) {
  List<String> clearQuery = [
    'green-title',
    'text-bold',
    'bible-text',
    'green-separator',
    'green-sub-title',
    'table-with-index',
    'text-italic',
    'list-with-number-green-button-with',
    'text-for-complement-reading',
    'text-green',
    'table-with-green-header',
    'list-with-gray-background',
    'check-list',
    'text-highlight',
    'green-background-title',
    'frame-with-title-and-border',
    'list-with-arrow',
    'multi-text',
    'multi-bible',
    "text",
    'image',
    '{',
    '}',
    '[',
    ']',
    '|',
  ];
  for (String clear in clearQuery) {
    if (query.contains(clear)) {
      query = query.replaceAll(clear, "");
    }
  }
  return query;
}
