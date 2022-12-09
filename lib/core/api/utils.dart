class Utils {
  static List<T> jsonArrayToList<T>(List<dynamic> jsonArray, Function mapper) {
    return (jsonArray).map((dynamic json) => mapper(json) as T).toList();
  }
}
