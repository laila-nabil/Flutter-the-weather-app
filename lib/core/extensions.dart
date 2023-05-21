extension ElementAtNullableOrEmpty<T> on List<T>?{
  T? get tryFirst{
    if(this!=null && this?.isNotEmpty == true){
      return this?.first;
    }else{
      return null;
    }
  }

  T?  tryElementAt(int index){
    if(this!=null && this?.isNotEmpty == true && (index < (this?.length ??0) == true)){
      return this?.elementAt(index);
    }else{
      return null;
    }
  }
}

extension ToStringNull on Object?{
  String? nullableToString(){
    if(this == null){
      return null;
    }else{
      return toString();
    }
  }
}

extension IsSameDayE on DateTime{
  bool isSameDay(DateTime otherDate){
    return otherDate.year == year &&
        otherDate.month == month &&
        otherDate.day == day;
  }
}

extension DateTimeExtensions on DateTime {
  DateTime addDays(int daysToAdd) {
    return DateTime(
      year,
      month,
      day + daysToAdd,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  DateTime subDays(int daysToSubtract) {
    return DateTime(
      year,
      month,
      day - daysToSubtract,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }
}