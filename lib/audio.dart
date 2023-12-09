import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spotify_clone/Utils/notify.dart';

import 'Home/Widgets/favourate.dart';
import 'data.dart';

class AudioPlayerPro extends StatefulWidget {
  AudioPlayerPro({required this.audioURL, required this.image, required this.name, required this.favI, required this.idx});

  final String audioURL;
  final String image;
  final String name;
  final String favI;
  final String idx;

  @override
  State<AudioPlayerPro> createState() => _AudioPlayerProState();
}

class _AudioPlayerProState extends State<AudioPlayerPro> {

  int indx=0;

  Notify notify = Get.find();

  Duration _duration = Duration();
  Duration _position = Duration();

  static AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    notify.isHeartPressed.value = false;
    super.dispose();
  }

  void initPlayer(){
    advancedPlayer = AudioPlayer();
    advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    if(widget.favI == 'true'){
      notify.isHeartPressed.value = true;
      print('*****************************  true  *****************************');
    }
    else{
        notify.isHeartPressed.value = false;
        print('*****************************  false  *****************************');
    }
    print("#############  BEFORE:  ${indx} and ${widget.idx}");
    indx = int.parse(widget.idx);
    print("#############  AFTER:  ${indx} and ${widget.idx}");
  }


  void seekToSecond(second){
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  double setChange(){
    Duration duration = Duration(seconds: 0);
    advancedPlayer.seek(duration);
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 40,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.brown,
              Colors.black87,
            ]
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                      LineIcons.angleDown,
                    color: Colors.white,
                    size: 24,
                  ),
                  Column(
                    children: [
                      Text(
                        'PLAYING FROM AUDIO',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 13,
                          fontFamily: 'LibProximaNova',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    LineIcons.verticalEllipsis,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Container(
                width: 325,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.image
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            wordSpacing: 0.2,
                            fontSize: 24,
                            fontFamily: 'LibProximaNova',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Classics',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            letterSpacing: 0.1,
                            fontSize: 16,
                            fontFamily: 'LibProximaNovaThin',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){
                        if(notify.isHeartPressed.value == true){
                          notify.isHeartPressed.value = false;
                          Map<String, Object> mp = {
                            'name': widget.name,
                            'image': widget.image,
                            'shape': GFAvatarShape.square,
                            'alignment': CrossAxisAlignment.start,
                            'audio': widget.audioURL,
                            'fav': 'true'
                          };
                          favList.removeAt(indx);
                          print('~~~~~~~~~~~  REMOVED:  ${favList.toString()}');
                        }
                        else{
                          notify.isHeartPressed.value = true;
                          Map<String, Object> mp = {
                            'name': widget.name,
                            'image': widget.image,
                            'shape': GFAvatarShape.square,
                            'alignment': CrossAxisAlignment.start,
                            'audio': widget.audioURL,
                            'fav': 'true'
                          };
                          favList.add(mp);
                          print('~~~~~~~~~~~  ADDED:  ${favList.toString()}');
                        }
                        print('    ------------>     ${notify.isHeartPressed.value} ');
                      },
                      icon: Obx(()=> (notify.isHeartPressed.value) ?
                        Icon(
                          Icons.favorite,
                          color: Colors.green,
                          size: 24,
                        ):
                        Icon(
                          LineIcons.heart,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Colors.grey.shade600,
                        activeTickMarkColor: Colors.white,
                        trackHeight: 3,
                        thumbColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 4
                        )
                      ),
                      child: Slider(
                        value: (_position.inSeconds.toDouble() != _duration.inSeconds.toDouble())?
                          _position.inSeconds.toDouble() : setChange(),
                        onChanged: (value){
                          setState(() {
                            seekToSecond(value.toInt());
                            value = value;
                          });
                        },
                        max: _duration.inSeconds.toDouble(),
                        min: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_position.inMinutes.toInt()}:${_position.inSeconds%60}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'LibProximaNovaThin',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "${_duration.inMinutes.toInt()}:${(_duration.inSeconds%60).toString().padLeft(2,"0")}",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontFamily: 'LibProximaNovaThin',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 22,
                  right: 22,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      LineIcons.random,
                      color: Colors.grey.shade400,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Container(
                      child: Center(
                        child: IconButton(
                          iconSize: 70,
                          alignment: Alignment.center,
                          onPressed: (){
                            notify.isIconPlay.value = notify.isIconPlay.value ? false: true;
                            if(notify.isIconPlay.value){
                              advancedPlayer.play(UrlSource(widget.audioURL));
                            }
                            else{
                              advancedPlayer.pause();
                            }
                            AwesomeNotifications().createNotification(
                                content: NotificationContent(
                                  id: 123,
                                  channelKey: 'Spotify',
                                  title: 'Now playing - ${widget.name}',
                                  autoDismissible: false,
                                  displayOnBackground: true,
                                ),
                              actionButtons: [
                                NotificationActionButton(
                                  key: 'play',
                                  label: 'play',
                                  autoDismissible: false,
                                  showInCompactView: true,
                                  actionType: ActionType.KeepOnTop,
                                ),
                                NotificationActionButton(
                                  key: 'pause',
                                  label: 'pause',
                                  autoDismissible: false,
                                  showInCompactView: true,
                                  actionType: ActionType.KeepOnTop,
                                ),
                                NotificationActionButton(
                                  key: 'stop',
                                  label: 'stop',
                                  autoDismissible: false,
                                  showInCompactView: true,
                                  actionType: ActionType.KeepOnTop,
                                ),
                              ]
                            );
                            //TODO: NOTIFICATION NOT YET DONE
                            // AwesomeNotifications().setListeners(onActionReceivedMethod: (action){
                            //   if (action.buttonKeyPressed == "play") {
                            //     print("Open button is pressed");
                            //     advancedPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/2e/e2/7d/2ee27d35-5e1e-0fd0-42ea-359b5256403e/mzaf_9335390342361255150.plus.aac.p.m4a'));
                            //     notify.setIconPlay(true);
                            //   } else if (action.buttonKeyPressed ==
                            //       "pause") {
                            //     advancedPlayer.pause();
                            //     notify.setIconPlay(false);
                            //     print("Delete button is pressed.");
                            //   } else if (action.buttonKeyPressed ==
                            //       "stop") {
                            //     advancedPlayer.stop();
                            //     notify.setIconPlay(false);
                            //     print(action
                            //         .payload); //notification was pressed
                            //   }
                            // }
                            // );
                          },
                          icon: Obx(()=> (notify.isIconPlay.value) ?
                            Icon(
                              Icons.pause_circle_filled,
                              color: Colors.white,
                            ):
                            Icon(
                              Icons.play_circle_filled,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Icon(
                      Icons.repeat,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 22,
                  right: 22,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.speaker_group_outlined,
                      color: Colors.grey.shade400,
                    ),
                    Spacer(flex: 5,),
                    InkWell(
                      onTap: (){
                        Share.share("${widget.name}\n${widget.audioURL}");
                      },
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.line_weight_sharp,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

