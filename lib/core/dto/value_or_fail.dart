class ValueOrFail<T> {
  T? value;
  String? errorMessage;
  ValueOrFail({this.value, this.errorMessage = 'Unknown'});
  bool get hasValue => value != null;
}
