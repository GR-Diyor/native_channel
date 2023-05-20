import 'dart:async';
import 'dart:developer';

import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
   StreamSubscription? _volumeButtonSubscription;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }
  @override
  void didChangeDependencies() {
   // hardwarebutton();
    super.didChangeDependencies();
  }
   @override
   void didChangeAppLifecycleState(AppLifecycleState state) {
     // setState(() {
     //   _volumeButtonSubscription = volumeButtonEvents?.listen((VolumeButtonEvent event) {
     //     log(event.name);
     //     // do something
     //     // event is either VolumeButtonEvent.VOLUME_UP or VolumeButtonEvent.VOLUME_DOWN
     //   });
     // });

     super.didChangeAppLifecycleState(state);
     print("State Flutterrrr:  $state");
   }
  system() {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }

  @override
  void dispose() {
    _volumeButtonSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,
        body: Shortcuts(
          shortcuts: const {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/matrix.jpg"), fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.green,
                    onPressed: () async {
                      final res = await DevicePolicyManager.isCameraDisabled();
                      log("Is camera disabled: $res");
                    },
                    child: const Text("kamerani o'chirish",style:TextStyle(color: Colors.white))),
                MaterialButton(
                    color: Colors.green,
                    onPressed: ()async=>await DevicePolicyManager.lockNow(),
                    child: const Text("Bloklash",style:TextStyle(color: Colors.white))),
                Focus(
                  autofocus: true,
                  onKeyEvent: (node, event) {
                    if (event.physicalKey == PhysicalKeyboardKey.fnLock) {
                      Navigator.of(context).pop();
                      if (event is KeyDownEvent) {
                        // the user started pressing the key A
                      } else if (event is KeyRepeatEvent) {
                        // the user is pressing the key A
                      } else if (event is KeyUpEvent) {
                        // the user stopped pressing the key A
                      }
                      // if you handled the event (prevent propagating the events further)
                      return KeyEventResult.handled;
                    }
                    // otherwise return this (propagates the events further to be handled elsewhere)
                   // return KeyEventResult.ignored;
                    print(event.logicalKey.debugName);
                    return KeyEventResult.handled;
                  },
                  child: MaterialButton(
                      color: Colors.green,
                      onPressed: ()async=>await DevicePolicyManager.removeActiveAdmin(),
                      child: const Text("Bloklashni o'chirish",style:TextStyle(color: Colors.white),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
