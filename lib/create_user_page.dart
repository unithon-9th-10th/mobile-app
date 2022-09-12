import 'package:app/widgets/beggar_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BeggarAppBar(
        title: const Text('프로필 생성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('images/peopleImg.svg'),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '닉네임',
                hintText: '닉네임을 입력해주세요.',
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(
                  Size.fromWidth(MediaQuery.of(context).size.width),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '상대 초대',
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
