import 'package:app/challenge_page.dart';
import 'package:app/create_challenge_page.dart';
import 'package:app/create_spend_page.dart';
import 'package:app/create_user_page.dart';
import 'package:app/invite_user_page.dart';
import 'package:app/main_page.dart';
import 'package:app/ranking_page.dart';
import 'package:app/share_challenge_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/create-challenge': (context) => const CreateChallengePage(),
        '/challenge': (context) => const ChallengePage(),
        '/share-challenge': (context) => const ShareChallengePage(),
        '/create-user': (context) => const CreateUserPage(),
        '/invite-user': (context) => const InviteUserPage(),
        '/create-spend': (context) => const CreateSpendPage(),
        '/ranking': (context) => const RankingPage(),
      },
    );
  }
}
