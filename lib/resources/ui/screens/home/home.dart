import 'package:flutter/material.dart';
import 'package:gamesrecommendation/resources/ui/screens/home/widgets/header%20widget/header.dart';
import 'widgets/allgameswidget/allgames.dart';
import 'widgets/category widget/body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[400],
        body: Column(
          children: [
            const Header(),
            const Expanded(
              flex: 2,
              child: Body(),
            ),
            Container(
              height: 15,
              color: Colors.white,
            ),
            const Expanded(
              flex: 8,
              child: AllGamesList(),
            ),
          ],
        ),
      ),
    );
  }
}
