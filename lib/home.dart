import 'package:flutter/material.dart';
import 'login.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<void> initPlatform() async {
  await OneSignal.shared.setAppId('00df04ad-9a2a-4e6f-86bf-798f859e9dab');
  await OneSignal.shared.getDeviceState().then((value) => {});
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initPlatform();
  }

  @override
  Widget build(BuildContext context) {
    String bgImage = 'logo.png';
    //Color bgColor = const Color.fromARGB(255, 12, 201, 21);
    const c = Color(0xffebc002);
    return Scaffold(
      backgroundColor: c,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 550.0, 0, 0),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    )
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
