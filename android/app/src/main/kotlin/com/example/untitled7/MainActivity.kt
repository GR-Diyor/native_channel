package com.example.untitled7

import android.app.Activity
import android.app.Application
import android.app.Dialog
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.MethodChannel.Result;


class MainActivity: FlutterActivity(){
    private var homeButtonWatcher: HomeButtonWatcher? = null
    private var hardwareButtonsWatcherManager: HardwareButtonsWatcherManager? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
         val VOLUME_BUTTON_CHANNEL_NAME = "https://github.com/GR-Diyor.volume"
         val HOME_BUTTON_CHANNEL_NAME = "https://github.com/GR-Diyor.home"
         val LOCK_BUTTON_CHANNEL_NAME = "https://github.com/GR-Diyor.lock"

        val volumeButtonChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, VOLUME_BUTTON_CHANNEL_NAME)
        volumeButtonChannel.setStreamHandler(VolumeButtonStreamHandler(activity))

        val homeButtonChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, HOME_BUTTON_CHANNEL_NAME)
        homeButtonChannel.setStreamHandler(HomeButtonStreamHandler(activity))

        val lockButtonChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, LOCK_BUTTON_CHANNEL_NAME)
        lockButtonChannel.setStreamHandler(LockButtonStreamHandler(activity))

    }


}