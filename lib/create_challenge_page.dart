import 'package:app/widgets/beggar_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateChallengePage extends StatefulWidget {
  const CreateChallengePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateChallengePageState();
  }
}

class _CreateChallengePageState extends State<CreateChallengePage> {
  static const challengeDays = [1, 3, 7];
  int dropdownValue = challengeDays.first;

  @override
  void initState() {
    super.initState();
    dropdownValue = challengeDays.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BeggarAppBar(
        title: const Text('챌린지 생성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 제목
            TextFormField(
              decoration: const InputDecoration(
                labelText: '챌린지 제목',
                hintText: '돈모아서 여행가자',
              ),
            ),

            /// 지출금액
            TextFormField(
              decoration: const InputDecoration(
                labelText: '목표 총지출 금액',
                hintText: '기간 동안 총 사용할 수 있는 금액을 입력해주세요.',
              ),
            ),

            /// 기간
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('챌린지 기간'),
                    Text(_resolveDateText(dropdownValue)),
                  ],
                ),
                const Spacer(),
                DropdownButton(
                  value: dropdownValue,
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('1일차'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('3일차'),
                    ),
                    DropdownMenuItem(
                      value: 7,
                      child: Text('일주일'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        dropdownValue = value;
                      });
                    }
                  },
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/create-user');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                backgroundColor: Colors.black,
              ),
              child: const Text('다음'),
            ),
          ],
        ),
      ),
    );
  }

  String _resolveDateText(int challengeDays) {
    final from = DateTime.now();
    final dateFormat = DateFormat('MM월 dd일');
    final to = from.add(Duration(days: challengeDays - 1));
    return '오늘 ~ ${dateFormat.format(to)}';
  }
}
