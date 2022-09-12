import 'package:app/widgets/beggar_app_bar.dart';
import 'package:app/widgets/spend_daily_summary.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final challenge = _getChallenge();
    final memberNames = ['나나나', '꿀꿀이', '도레미'];
    return Scaffold(
      appBar: BeggarAppBar(
        title: Text(challenge.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/ranking');
            },
            icon: const Text('랭킹'),
          )
        ],
        // 23시간 남음
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Row(
            children: const [
              SizedBox(width: 18),
              Text('23시간 남음'),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 멤버 목록
              _getMemberListWidget(context, memberNames),
              // 내 정보
              _getMemberInfoWidget(context),
              // 지출 내역 추가
              Row(
                children: [
                  const Text('지출내역'),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/create-spend');
                    },
                    child: const Text('지출 내역 추가'),
                  ),
                ],
              ),
              // 일별 지출 내역
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return SpendDailySummary(
                      date: DateTime.now().subtract(
                        Duration(days: index),
                      ),
                      amount: 34000,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 멤버 목록
  Widget _getMemberListWidget(BuildContext context, List<String> memberNames) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 20,
      children: memberNames.map((e) => _getMemberWidget(context, e)).toList() +
          [_getInvitationWidget(context)],
    );
  }

  /// 멤버 버튼
  Widget _getMemberWidget(BuildContext context, String name) {
    return GestureDetector(
      onTapUp: (_) {
        // TODO: 각 멤버에 맞는 데이터 조회해서 화면 다시 그리기
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(name),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(name.characters.first),
            ),
          ),
          Text(name),
        ],
      ),
    );
  }

  /// 초대 버튼
  Widget _getInvitationWidget(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('초대'),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('+'),
            ),
          ),
          const Text('초대'),
        ],
      ),
    );
  }

  /// 멤버 상태
  Widget _getMemberInfoWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text('나나나'),
            Text('1위'),
            Text('중거지'),
          ],
        ),
        Row(
          children: [
            const Text('그림1'),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('남은 금액'),
                const Text('100,000원'),
                Row(
                  children: const [
                    Text('목표 총 지출'),
                    Text('100,000원'),
                  ],
                ),
                Row(
                  children: const [
                    Text('누적 지출'),
                    Text('-51,200원'),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Text('상거지력 그림'),
          ],
        )
      ],
    );
  }

  // TODO: api 로 데이터 가져오기
  Challenge _getChallenge() {
    return Challenge(
      title: '돈모아서 여행가자',
      startDate: DateTime.now(),
      challengeDays: 3,
      amount: 10000,
    );
  }
}

class Challenge {
  String title;
  DateTime startDate;
  int challengeDays;
  int amount;

  Challenge({
    required this.title,
    required this.startDate,
    required this.challengeDays,
    required this.amount,
  });

  DateTime endDate() => startDate.add(Duration(days: challengeDays));
}
