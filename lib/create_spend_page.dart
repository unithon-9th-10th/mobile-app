import 'package:app/widgets/beggar_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CreateSpendPage extends StatelessWidget {
  const CreateSpendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BeggarAppBar(
        title: Text('지출 내역 추가'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: validation, api call
              Navigator.pop(context);
            },
            icon: const Text('추가'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(children: [
                const Text('카테고리'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    _showSpendTypes(context);
                  },
                  child: Text('카테고리 선택'),
                ),
              ]),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '지출 금액',
                  hintText: '0원',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '지출처',
                  hintText: '지출처를 입력하세요',
                ),
              ),
              Row(
                children: [
                  Text('지출 일시'),
                  Spacer(),
                  Text(DateFormat('M월 d일 HH:mm').format(DateTime.now())),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _showSpendTypes(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: height / 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '카테고리 선택',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: SpendType.values
                      .map((e) => _getSpendTypeButton(context, e))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      expand: false,
    );
  }

  Widget _getSpendTypeButton(BuildContext context, SpendType spendType) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).popUntil(
          (route) {
            if (route.settings.name == '/create-spend') {
              // TODO: argument 전달
              if (kDebugMode) {
                print(spendType);
              }
              return true;
            } else {
              return false;
            }
          },
        );
      },
      icon: SvgPicture.asset(
        spendType.getImagePath(),
      ),
    );
  }
}

enum SpendType {
  RICE,
  SNACK,
  CAR,
  SHOPPING,
  ENTER,
  ETC,
  ;

  String getImagePath() {
    switch (this) {
      case SpendType.RICE:
        return 'images/expend/rice.svg';
      case SpendType.SNACK:
        return 'images/expend/snack.svg';
      case SpendType.CAR:
        return 'images/expend/car.svg';
      case SpendType.SHOPPING:
        return 'images/expend/shopping.svg';
      case SpendType.ENTER:
        return 'images/expend/enter.svg';
      case SpendType.ETC:
        return 'images/expend/etc.svg';
    }
  }
}
