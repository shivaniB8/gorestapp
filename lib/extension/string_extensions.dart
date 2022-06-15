extension StringExtensions on String {
  String getInitials() {
    String name = this;
    String trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      return '';
    }
    var nameParts = trimmedName.split(' ');

    if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    }
    return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
  }
}
