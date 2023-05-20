package com.example.untitled7


//class HardwareButtonsPlugin {
//    companion object {
//        const val VOLUME_BUTTON_CHANNEL_NAME = "https://github.com/GR-Diyor.volume"
//        const val HOME_BUTTON_CHANNEL_NAME = "https://github.com/GR-Diyor.home"
//        const val LOCK_BUTTON_CHANNEL_NAME = "https://github.com/GR-Diyor.lock"
//
//        @JvmStatic
//        fun registerWith(registrar: PluginRegistry.Registrar) {
//            val activity = registrar.activity()
//            val application = activity.application
//
//            registrar.addActivityResultListener(HardwareButtonsWatcherManager.getInstance(application, activity))
//
//            val volumeButtonChannel = EventChannel(registrar.messenger(), VOLUME_BUTTON_CHANNEL_NAME)
//            volumeButtonChannel.setStreamHandler(VolumeButtonStreamHandler(activity))
//
//            val homeButtonChannel = EventChannel(registrar.messenger(), HOME_BUTTON_CHANNEL_NAME)
//            homeButtonChannel.setStreamHandler(HomeButtonStreamHandler(activity))
//
//            val lockButtonChannel = EventChannel(registrar.messenger(), LOCK_BUTTON_CHANNEL_NAME)
//            lockButtonChannel.setStreamHandler(LockButtonStreamHandler(activity))
//        }
//    }
//}