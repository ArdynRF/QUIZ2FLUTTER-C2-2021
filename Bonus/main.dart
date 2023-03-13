
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  MyAppState createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  String _namaKelompok = "";


  void _setNamaKelompok(String value) {
    setState(() {
      _namaKelompok = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
          leading: FlutterLogo(),
          backgroundColor: Colors.blueGrey,
          title: Text('Quiz Flutter'),
          actions: <Widget>[
            ButtonNamaKelompok(
              setNamaKelompok: _setNamaKelompok,
            ),
            ButtonPerjanjian(),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/200'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.black26,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Activity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.grey,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'No New Notifications',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  'you\'re caught up! Checkback for notifications, campus alert and more',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.phone_forwarded,
                      color: Colors.red,
                    ),
                    title: Text(
                      'CAMPUS ALERT',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Power Restored to Stanford Campus',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          '49 days ago',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    // tileColor: Colors.grey[300],
                    shape: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Compass',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}


class ButtonNamaKelompok extends StatelessWidget {
  final Function(String) setNamaKelompok;
  const ButtonNamaKelompok({
    Key? key,
    required this.setNamaKelompok,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 8'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Anggota kelompok: '),
                Text('Ardyn Rezky Fahreza'),
                Text('M Fadhillah Nursyawal'),
                Text(''),
                Text('Email Anggota Kelompok:'),
                Text('ardynrezky@upi.edu'),
                Text('fadilahnursyawal@upi.edu')
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}


class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting di tap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
            'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang.',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
