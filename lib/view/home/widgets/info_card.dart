import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:provider/provider.dart';
import '../../../utilities/color/colors.dart';
import '../../pie_chart/pie_chart_screen.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [indigColor, indigoLightColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'User name',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'Mvelopes',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
              ),
              const CardContent(
                title: 'BALANCE',
                alinment: CrossAxisAlignment.start,
                index: 0,
              ),
              const CardContent(
                title: 'INCOME',
                alinment: CrossAxisAlignment.start,
                index: 1,
              ),
              const CardContent(
                title: 'EXPENSE',
                alinment: CrossAxisAlignment.start,
                index: 2,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChartScreen(),
                    ),
                  );
                },
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/presentation.png',
                    height: 60,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const CardContent(
                title: 'BORROW',
                alinment: CrossAxisAlignment.end,
                index: 3,
              ),
              const CardContent(
                title: 'LEND',
                alinment: CrossAxisAlignment.end,
                index: 4,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final dynamic alinment;
  final String title;
  final int index;
  const CardContent({
    Key? key,
    required this.alinment,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alinment,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontFamily: 'redhat',
          ),
        ),
        const SizedBox(height: 8),
        Consumer<HiveImpl>(
          builder: (context, value, child) {
            return Text(
              index == 0
                  ? '₹ ${value.recentTotal}'
                  : index == 1
                      ? '₹ ${value.incomeTotal}'
                      : index == 2
                          ? '₹ ${value.expenseTotal}'
                          : index == 3
                              ? '₹ ${value.borrowTotal}'
                              : '₹ ${value.lendTotal}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'redhat',
              ),
            );
          },
        )
      ],
    );
  }
}
