abstract class Dao<T> {
  // QUERIES
  String get createTableQuery;

  // abstract mapping method
  T fromMap(Map<String, dynamic> query);
  List<T> fromList(List<Map<String, dynamic>> query);
  Map<String, dynamic> toMap(T object);
}
