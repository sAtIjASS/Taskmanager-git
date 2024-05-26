import 'package:flutter/material.dart';
import 'counterbloc1.dart';
import 'counterstate1.dart';
import 'package:bloc/bloc.dart';

class counterbloc extends Bloc<counterevent,counterstate>{
  counterbloc():super(const counterstate()){
on<incerementcounter>(increment);
on<Decerementcounter>(decrement);
  }
  void increment(incerementcounter event,Emitter<counterstate>emit ){
 emit(state.copyWith(counter: state.counter+1));
  }



  void decrement(Decerementcounter event,Emitter<counterstate>emit ){
    emit(state.copyWith(counter: state.counter-1));
  }
}