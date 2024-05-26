import 'package:equatable/equatable.dart';

class counterstate extends Equatable{
  final int counter;
  const counterstate({
     this.counter=0,
});
  counterstate copyWith({
    int? counter,
  }){
    return counterstate(
      counter: counter ?? this.counter,
    );
}
  @override
  List<Object>get props=>[counter];
}