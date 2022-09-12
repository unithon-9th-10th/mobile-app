import 'package:app/widgets/beggar_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InviteUserPage extends StatelessWidget {
  const InviteUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BeggarAppBar(
        title: const Text('챌린지 친구 초대'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),

            /// 결투신청서
            SvgPicture.asset('images/fightPaper.svg'),
            const Spacer(),
            const Text('초대링크를 보내'),
            const Text('대결할 친구를 초대하세요!'),
            const SizedBox(height: 8),

            /// 초대링크 복사
            ElevatedButton(
              onPressed: () {
                // TODO: 초대링크 복사
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('초대링크 복사'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(0, 150, 159, 1.0),
                ),
              ),
              child: const Text('초대링크 복사'),
            ),
            const SizedBox(height: 8),
            const Text('초대링크는 챌린지 화면의 초대하기 버튼을 눌러'),
            const Text('다시 복사할 수 있어요.'),
            const Spacer(),

            /// 챌린지 화면으로
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/challenge');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(
                  Size.fromWidth(MediaQuery.of(context).size.width),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '챌린지 화면으로!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
