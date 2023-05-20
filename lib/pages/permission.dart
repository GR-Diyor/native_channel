import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  void initState() {
    super.initState();
  }

  next(){
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) {
      return const Home();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(80, 107, 154, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Davom etish uchun ilovaga huxsat berishingiz kerak!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white38),
                  softWrap: true),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: ()async{
                  if( await DevicePolicyManager.isPermissionGranted()) {
                    next();
                  }else {
                    await DevicePolicyManager.requestPermession(
                        "Sizni telefoningiz ilova tomonidan boshqariladi");
                  }
                },
                child: const Text("Tasdiqlash",style: TextStyle(color: Color.fromRGBO(200,198,219,1))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

