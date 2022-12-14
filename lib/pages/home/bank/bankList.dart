import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extension/build_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/firebase/firebase_auth_process.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import 'bankList_view_model.dart';
import 'banks_model.dart';

class BankList extends ConsumerStatefulWidget {
  const BankList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BankListState();
}

class _BankListState extends BankListViewModel {
  @override
  Widget build(BuildContext context) {
    //initState içinde olmasa bile 1 kez indirme işlemi yapar!
    //https://riverpod.dev/docs/providers/future_provider
    final data = ref.watch(bankaListProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorStyle.instance.brightGrey,
        appBar: AppBar(
          actions: [
            bildirim(context),
            ayarlar(context),
          ],
          leading: signOut(context),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: context.horizantalPaddingSmall,
          child: ListView(
            children: [
              bakiye(),
              context.sizedBoxHeightBoxLow3x,
              textFormFieldAciklamalari("Türk lirası yatırmak için banka seçiniz."),
              data.when(
                skipError: false,
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                data: ((data) => ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            showModalBottomSheetInfos(context, data, index);
                          },
                          child: Card(
                            child: ListTile(
                              leading: bankaLogoSec(data![index].bankName.toString()),
                              title: Text(
                                data[index].bankName ?? "",
                                style: AppTextStyle.instance.semiBold13TextStyle,
                              ),
                              subtitle: Text(
                                "Havale / EFT ile para gönderdadin.",
                                style: AppTextStyle.instance.regular12TextStyle.copyWith(color: AppColorStyle.instance.twinkleBlue),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
                error: ((error, stackTrace) => const Text("İnterneti Kontrol Ediniz")),
                loading: (() => const Center(child: CircularProgressIndicator())),
              )
            ],
          ),
        ),
      ),
    );
  }

  Card bakiye() {
    return Card(
      child: ListTile(
        trailing: Text(
          "234₺",
          style: AppTextStyle.instance.semiBold16TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
        ),
        leading: Image.asset('turkeyFlag'.toImagesPng),
        title: const Text("Türk Lirası"),
        subtitle: Text(
          "TL",
          style: AppTextStyle.instance.regular12TextStyle.copyWith(color: AppColorStyle.instance.twinkleBlue),
        ),
      ),
    );
  }

  IconButton signOut(BuildContext context) {
    return IconButton(
      onPressed: (() {
        ref.read(fireBaseAuthProvider.notifier).signOut();
      }),
      icon: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColorStyle.instance.white,
          borderRadius: context.buttonRadius,
        ),
        child: Icon(
          Icons.arrow_back,
          color: AppColorStyle.instance.darkKnight,
        ),
      ),
    );
  }

  IconButton ayarlar(BuildContext context) {
    return IconButton(
      onPressed: (() {}),
      icon: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColorStyle.instance.white,
          borderRadius: context.buttonRadius,
        ),
        child: Icon(
          Icons.settings,
          color: AppColorStyle.instance.darkKnight,
        ),
      ),
    );
  }

  IconButton bildirim(BuildContext context) {
    return IconButton(
      onPressed: (() {}),
      icon: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColorStyle.instance.white,
          borderRadius: context.buttonRadius,
        ),
        child: Icon(
          Icons.notifications_none_outlined,
          color: AppColorStyle.instance.darkKnight,
        ),
      ),
    );
  }

  Future<dynamic> showModalBottomSheetInfos(BuildContext context, List<Banks> data, int index) {
    return showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: ((context) {
          return Padding(
            padding: context.horizantalPaddingSmall,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                context.sizedBoxHeightBoxLow2x,
                Divider(
                  thickness: 3.h,
                  indent: MediaQuery.of(context).size.width / 2.5,
                  endIndent: MediaQuery.of(context).size.width / 2.5,
                  color: AppColorStyle.instance.darkKnight,
                ),
                context.sizedBoxHeightBoxLow3x,
                textFormFieldAciklamalari("Hesap Adı"),
                context.sizedBoxHeightBoxLow2x,
                Container(
                  decoration: ShapeDecoration(
                    color: AppColorStyle.instance.brightGrey,
                    shape: const StadiumBorder(),
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    trailing: const Icon(Icons.copy),
                    title: Text(data[index].bankAccountName.toString()),
                  ),
                ),
                context.sizedBoxHeightBoxLow3x,
                textFormFieldAciklamalari("IBAN"),
                context.sizedBoxHeightBoxLow2x,
                Container(
                  decoration: ShapeDecoration(
                    color: AppColorStyle.instance.brightGrey,
                    shape: const StadiumBorder(),
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    trailing: const Icon(Icons.copy),
                    title: Text(data[index].bankIban.toString()),
                  ),
                ),
                context.sizedBoxHeightBoxLow3x,
                textFormFieldAciklamalari("Açıklama"),
                context.sizedBoxHeightBoxLow2x,
                Container(
                  decoration: ShapeDecoration(
                    color: AppColorStyle.instance.brightGrey,
                    shape: const StadiumBorder(),
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    trailing: const Icon(Icons.copy),
                    title: Text(data[index].descriptionNo.toString()),
                  ),
                ),
                context.sizedBoxHeightBoxLow2x,
                Container(
                  decoration: ShapeDecoration(
                    color: AppColorStyle.instance.brightGrey,
                    shape: const StadiumBorder(),
                  ),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.",
                      style: AppTextStyle.instance.regular10TextStyle.copyWith(),
                    ),
                  ),
                ),
                context.sizedBoxHeightBoxLow2x,
                Container(
                  decoration: ShapeDecoration(
                    color: AppColorStyle.instance.lightRed,
                    shape: const StadiumBorder(),
                  ),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      "Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.",
                      style: AppTextStyle.instance.regular10TextStyle.copyWith(color: AppColorStyle.instance.red),
                    ),
                  ),
                ),
                context.sizedBoxHeightBoxLow3x,
              ],
            ),
          );
        }));
  }
}

Text textFormFieldAciklamalari(String aciklayiciText) {
  return Text(
    aciklayiciText,
    style: AppTextStyle.instance.regular12TextStyle.copyWith(color: AppColorStyle.instance.twinkleBlue),
  );
}
