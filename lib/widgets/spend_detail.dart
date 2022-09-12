import 'package:flutter/material.dart';

class SpendDetail extends StatefulWidget {
  SpendDetail({
    required this.name,
    required this.amount,
    this.upCount = 0,
    this.downCount = 0,
    this.upPressed = false,
    this.downPressed = false,
    super.key,
  });

  final String name;
  final int amount;
  final int upCount;
  final int downCount;
  final bool upPressed;
  final bool downPressed;

  @override
  State<StatefulWidget> createState() {
    return _SpendDetailState();
  }
}

class _SpendDetailState extends State<SpendDetail> {
  late int upCount;
  late int downCount;
  late bool upPressed;
  late bool downPressed;

  @override
  void initState() {
    super.initState();
    upCount = widget.upCount;
    downCount = widget.downCount;
    upPressed = widget.upPressed;
    downPressed = widget.downPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('아이콘'),
            Column(
              children: [
                Text('-${widget.amount}원'),
                Text(widget.name),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (upPressed) {
                    upCount -= 1;
                  } else {
                    upCount += 1;
                  }
                  upPressed = !upPressed;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('상거지 특'),
                  ),
                );
              },
              child: Text('상거지 특 $upCount'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (downPressed) {
                    downCount -= 1;
                  } else {
                    downCount += 1;
                  }
                  downPressed = !downPressed;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('하거지 특'),
                  ),
                );
              },
              child: Text('하거지 특 $downCount'),
            ),
          ],
        ),
      ],
    );
  }
}
