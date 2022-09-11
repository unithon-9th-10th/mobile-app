import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: (height * 0.02)),
              const Text(
                '어짜피 거지라면\n상거지가 되어 보자!',
                style: TextStyle(
                  fontSize: 24,
                  height: 1.0,
                ),
              ),
              const Text(
                '무소비\n챌린지',
                style: TextStyle(
                  fontSize: 50,
                  height: 1.0,
                ),
              ),
              const Spacer(),
              SvgPicture.asset('images/startmain.svg'),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/create-challenge');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  fixedSize: MaterialStateProperty.all(
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: (height * 0.02)),
                  child: const Text(
                    '챌린지 만들기',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '챌린지를 개설한 친구에게 링크를\n바로 열어주시면 연결됩니다!',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).popUntil(
                                  (route) => route.settings.name == '/');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              fixedSize: MaterialStateProperty.all(
                                Size.fromWidth(
                                    MediaQuery.of(context).size.width * 0.9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: (height * 0.02)),
                              child: const Text(
                                'ㅇㅋ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    expand: false,
                  );
                },
                child: const Text(
                  '초대받은 챌린지가 있나요?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
