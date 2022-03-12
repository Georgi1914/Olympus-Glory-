import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 50.0,
              child: Image(image: AssetImage('assets/avatar.png')),
            ),
          ),
          Divider(
            height: 60,
            thickness: 3.0,
            color: Colors.grey[800],
          ),
          SizedBox(height: 20.0),
          Text(
            'NAME',
            style: TextStyle(
              color: Colors.grey[900],
              letterSpacing: 2.0,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '${_currentUser.displayName}',
            style: TextStyle(
              color: Colors.grey[900],
              //fontWeight: FontWeight.bold,
              fontSize: 28.0,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 60.0),
          Row(
            children: [
              Icon(Icons.mail_sharp),
              SizedBox(width: 10.0),
              Text(
                '${_currentUser.email}',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            children: [
              Icon(
                Icons.verified,
                color: Colors.green,
              ),
              SizedBox(width: 10.0),
              Text(
                'Your email is verified',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ]),
      ),
    );

    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(
    //         'NAME: ${_currentUser.displayName}',
    //         style: Theme.of(context).textTheme.bodyText1,
    //       ),
    //       SizedBox(height: 16.0),
    //       Text(
    //         'EMAIL: ${_currentUser.email}',
    //         style: Theme.of(context).textTheme.bodyText1,
    //       ),
    //       SizedBox(height: 16.0),
    //       _currentUser.emailVerified
    //           ? Text(
    //               'Email verified',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .bodyText1!
    //                   .copyWith(color: Colors.green),
    //             )
    //           : Text(
    //               'Email not verified',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .bodyText1!
    //                   .copyWith(color: Colors.red),
    //             ),
    //       ElevatedButton(
    //           onPressed: () async {
    //             await FirebaseAuth.instance.signOut();
    //             Navigator.pushNamedAndRemoveUntil(
    //                 context, "/login", (r) => false);
    //           },
    //           child: Text('Sign out'))
    //       // Add widgets for verifying email
    //       // and, signing out the user
    //     ],
    //   ),
    // ),
  }
}
