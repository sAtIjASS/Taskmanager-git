//Event in bloc pattern
import 'package:equatable/equatable.dart';

abstract class counterevent extends Equatable{
 const counterevent();
  @override
 List<Object>get props=>[];
}
class incerementcounter extends counterevent{


}



class Decerementcounter extends counterevent {
}