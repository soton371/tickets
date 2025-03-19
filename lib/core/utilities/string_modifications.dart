String? nameSplit(String? name) {
  if(name == null)return null;
  try{
    return name
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase())
        .take(2)
        .join();
  }catch(e){
    return null;
  }

}