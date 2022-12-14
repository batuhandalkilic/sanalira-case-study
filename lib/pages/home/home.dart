import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extension/string_extension.dart';
import '../../core/theme/app_color.dart';
import 'account/accountPage.dart';
import 'anasayfa/homeview.dart';
import 'bank/bankList.dart';
import 'hesap/hesap.dart';
import 'home_view_model.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final currentpagee = ref.watch<int>(MarketPlaceChangePageProvider);
    return SafeArea(
      child: Scaffold(
        body: selectedPage(currentpagee),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          onTap: (value) {
            ref.read(MarketPlaceChangePageProvider.notifier).update((state) => state = value);
          },
          currentIndex: currentpagee,
          unselectedItemColor: AppColorStyle.instance.twinkleBlue,
          selectedItemColor: AppColorStyle.instance.bouncyBallGreen,
          showUnselectedLabels: true,
          enableFeedback: false,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 21.r,
              ),
              label: Currentpage.home.label,
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "transaction".toImagesPng,
                  color: currentpagee == 1 ? AppColorStyle.instance.bouncyBallGreen : AppColorStyle.instance.twinkleBlue,
                  width: 21.r,
                ),
                label: Currentpage.market.label),
            BottomNavigationBarItem(
                icon: FloatingActionButton.small(
                    backgroundColor: AppColorStyle.instance.darkKnight,
                    onPressed: (() {}),
                    child: Image.asset(
                      "layer".toImagesPng,
                      width: 21.r,
                    )),
                label: Currentpage.floating.label),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
                size: 21.r,
              ),
              label: Currentpage.pay.label,
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "user".toImagesPng,
                  color: currentpagee == 4 ? AppColorStyle.instance.bouncyBallGreen : AppColorStyle.instance.twinkleBlue,
                  width: 21.r,
                ),
                label: Currentpage.account.label),
          ],
        ),
      ),
    );
  }

  Widget? selectedPage(int currentpageIndex) {
    if (currentpageIndex == Currentpage.home.index) {
      return const HomeView();
    } else if (currentpageIndex == Currentpage.market.index) {
      return const Hesap();
    } else if (currentpageIndex == Currentpage.pay.index) {
      return const BankList();
    } else {
      return const AccountPage();
    }
  }
}

enum Currentpage {
  home(''),
  market(''),
  floating(''),
  pay(''),
  account('');

  final String label;

  const Currentpage(this.label);
}
