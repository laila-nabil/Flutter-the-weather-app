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

extension toStringNull on Object?{
  String? nullableToString(){
    if(this == null){
      return null;
    }else{
      return this.toString();
    }
  }
}

extension isSameDayE on DateTime{
  bool isSameDay(DateTime otherDate){
    return otherDate.year == this.year &&
        otherDate.month == this.month &&
        otherDate.day == this.day;
  }
}