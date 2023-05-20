import 'dart:async';

import 'package:flutter/services.dart';

const _VOLUME_BUTTON_CHANNEL_NAME = 'https://github.com/GR-Diyor.volume';
const _HOME_BUTTON_CHANNEL_NAME = 'https://github.com/GR-Diyor.home';
const _LOCK_BUTTON_CHANNEL_NAME = 'https://github.com/GR-Diyor.lock';

const EventChannel _volumeButtonEventChannel =
EventChannel(_VOLUME_BUTTON_CHANNEL_NAME);
const EventChannel _homeButtonEventChannel =
EventChannel(_HOME_BUTTON_CHANNEL_NAME);
const EventChannel _lockButtonEventChannel =
EventChannel(_LOCK_BUTTON_CHANNEL_NAME);

 Stream<VolumeButtonEvent>? _volumeButtonEvents;

//volume button events
Stream<VolumeButtonEvent>? get volumeButtonEvents {
  _volumeButtonEvents ??= _volumeButtonEventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => _eventToVolumeButtonEvent(event));
  return _volumeButtonEvents;
}

 Stream<HomeButtonEvent>? _homeButtonEvents;

//home button events
Stream<HomeButtonEvent>? get homeButtonEvents {
  _homeButtonEvents ??= _homeButtonEventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => HomeButtonEvent.INSTANCE);
  return _homeButtonEvents;
}

 Stream<LockButtonEvent>? _lockButtonEvents;

//lock button events
Stream<LockButtonEvent>? get lockButtonEvents {
  _lockButtonEvents ??= _lockButtonEventChannel
        .receiveBroadcastStream()
        .map((dynamic event) => LockButtonEvent.INSTANCE);
  return _lockButtonEvents;
}


enum VolumeButtonEvent {
  // Volume Up button event
  VOLUME_UP,

  // Volume Down button event
  VOLUME_DOWN,
}

VolumeButtonEvent _eventToVolumeButtonEvent(dynamic event) {
  if (event == 24) {
    return VolumeButtonEvent.VOLUME_UP;
  } else if (event == 25) {
    return VolumeButtonEvent.VOLUME_DOWN;
  } else {
    throw Exception('Invalid volume button event');
  }
}

class HomeButtonEvent {
  static const INSTANCE = HomeButtonEvent();

  const HomeButtonEvent();
}

// Lock button event
class LockButtonEvent {
  static const INSTANCE = LockButtonEvent();

  const LockButtonEvent();
}