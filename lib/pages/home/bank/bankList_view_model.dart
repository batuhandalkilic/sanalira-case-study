import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extension/string_extension.dart';
import 'bankList.dart';
import 'banks_model.dart';

abstract class BankListViewModel extends ConsumerState<BankList> {
  final bankaListProvider = FutureProvider.autoDispose<List<Banks>?>((ref) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get("https://api.sanalira.com/assignment");
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map) {
          List jsonBodyList = jsonBody["data"];
          return jsonBodyList.map((e) => Banks.fromJson(e)).toList();
        } else {
          return null;
        }
      } else {
        return [];
      }
    } catch (e) {
      print(e);
    }
    return null;
  });

  Column? bankaLogoSec(String bankAdi) {
    switch (bankAdi) {
      case "T.C. ZİRAAT BANKASI A.Ş.":
        return logoCenter("ziraatLogo");
      case "ALBARAKA TÜRK KATILIM BANKASI A.Ş.":
        return logoCenter("albaraka");
      case "TÜRKİYE VAKIFLAR BANKASI T.A.O.":
        return logoCenter("vakifLogo");
      case "AKBANK T.A.Ş.":
        return logoCenter("akbank");
      case "KUVEYT TÜRK KATILIM BANKASI A.Ş.":
        return logoCenter("küveyt");
      case "TÜRKİYE GARANTİ BANKASI A.Ş.":
        return logoCenter("garanti");
      case "QNB FİNANSBANK A.Ş.":
        return logoCenter("qnb");
      default:
        null;
    }
    return null;
  }

  Column logoCenter(String logoName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 50.h,
          height: 50.h,
          child: Image.asset(
            fit: BoxFit.contain,
            logoName.toImagesPng,
          ),
        ),
      ],
    );
  }
}
