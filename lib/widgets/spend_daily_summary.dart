import 'package:app/widgets/point_painter.dart';
import 'package:app/widgets/spend_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpendDailySummary extends StatelessWidget {
  const SpendDailySummary({
    super.key,
    required this.date,
    required this.amount,
  });

  final DateTime date;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MM월 dd일 E요일', 'ko_KR');
    return Column(
      children: [
        Row(
          children: [
            Text(dateFormat.format(date)),
            Expanded(
              child: CustomPaint(
                painter: PointPainter(),
              ),
            ),
            Text('- $amount원'),
          ],
        ),
        Column(
          children: [
            SpendDetail(
              name: '가을 옷',
              amount: 10000,
              upCount: 10,
              downCount: 10,
            ),
            SpendDetail(
              name: '치킨',
              amount: 19000,
              downCount: 10,
            ),
            SpendDetail(
              name: '커피',
              amount: 5000,
              downCount: 10,
            ),
          ],
        ),
      ],
    );
  }
}
