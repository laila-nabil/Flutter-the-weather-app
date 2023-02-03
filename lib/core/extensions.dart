extension ElementAtNullableOrEmpty<T> on List<T>?{
  T? get tryFirst{
    if(this!=null && this?.isNotEmpty == true){
      return this?.first;
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