import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'firstblock_event.dart';
part 'firstblock_state.dart';

class FirstblockBloc extends Bloc<FirstblockEvent, FirstblockState> {
  FirstblockBloc() : super(FirstblockInitial()) {
    on<FirstblockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
