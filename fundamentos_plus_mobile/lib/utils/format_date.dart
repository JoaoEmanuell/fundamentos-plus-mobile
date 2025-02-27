String formatDate(DateTime date) {
  String day = date.day < 10 ? "0${date.day}" : date.day.toString();
  String month = date.month < 10 ? "0${date.month}" : date.month.toString();
  return "$day/$month/${date.year}";
}
