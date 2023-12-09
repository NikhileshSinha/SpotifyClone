import 'package:get/get.dart';


class Notify{
  final isIconPlay = false.obs;
  final isHeartPressed = false.obs;

  void setIconPlay(bool value){
    isIconPlay.value = value;
  }

  void setHeartPressed(bool value){
    isHeartPressed.value = value ;
  }
}