import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/primary_button.dart';
import '../../core/extension/build_extension.dart';
import '../../core/extension/string_extension.dart';
import '../../core/theme/app_color.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/validator/validator.dart';
import 'authentication_view_model.dart';

class AuthenticationPage extends ConsumerStatefulWidget {
  const AuthenticationPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends AuthenticationViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            backGroundColor(),
            sanaLiraLogo(),
            Positioned(
              top: 154.h,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColorStyle.instance.white,
                  borderRadius: context.sanalLiraRadius40,
                ),
                child: Padding(
                  padding: context.sanalLiraPadding,
                  child: ListView(
                    children: <Widget>[
                      const FormBaslik(renkliFirmaAdi: "SanaLira'ya ", yeniUyelik: "Yeni Üyelik"),
                      context.sizedBoxHeightBoxLow,
                      textFormFieldAciklamalari("Bilgilerinizi girip sözleşmeyi onaylayın."),
                      context.sizedBoxHeightBoxLow4x,
                      Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              textFormFieldAciklamalari("Ad"),
                              context.sizedBoxHeightBoxLow,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: context.sanalLiraTextFormFielRadius,
                                  color: AppColorStyle.instance.brightGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: TextFormField(
                                      onSaved: (newValue) => ad = newValue,
                                      style: AppTextStyle.instance.semiBold12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validator.instance.validateAd(value),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Ad",
                                      )),
                                ),
                              ),
                              context.sizedBoxHeightBoxLow2x,
                              textFormFieldAciklamalari("Soyad"),
                              context.sizedBoxHeightBoxLow,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: context.sanalLiraTextFormFielRadius,
                                  color: AppColorStyle.instance.brightGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: TextFormField(
                                      onSaved: (newValue) => soyadi = newValue,
                                      style: AppTextStyle.instance.semiBold12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validator.instance.validateSoyad(value),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Soyad",
                                      )),
                                ),
                              ),
                              context.sizedBoxHeightBoxLow2x,
                              textFormFieldAciklamalari("Şifre"),
                              context.sizedBoxHeightBoxLow,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: context.sanalLiraTextFormFielRadius,
                                  color: AppColorStyle.instance.brightGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: TextFormField(
                                      onSaved: (newValue) => sifre = newValue,
                                      style: AppTextStyle.instance.semiBold12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                      obscuringCharacter: '*', //
                                      obscureText: ref.watch(isVisibilityChangeProvider), //
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validator.instance.validatePassword(value),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red),
                                        hintText: "Şifre",
                                        border: InputBorder.none,
                                        suffixIconColor: AppColorStyle.instance.darkKnight,
                                        suffixIcon: IconButton(
                                            focusColor: AppColorStyle.instance.darkKnight,
                                            onPressed: (() {
                                              ref.read(isVisibilityChangeProvider.notifier).update((state) => !state);
                                            }),
                                            icon: AnimatedCrossFade(
                                                firstChild: Icon(
                                                  color: AppColorStyle.instance.darkKnight,
                                                  Icons.visibility_off_outlined,
                                                ),
                                                secondChild: Icon(
                                                  Icons.visibility_outlined,
                                                  color: AppColorStyle.instance.darkKnight,
                                                ),
                                                crossFadeState:
                                                    ref.watch(isVisibilityChangeProvider) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                                duration: const Duration(seconds: 1))),
                                      )),
                                ),
                              ),
                              context.sizedBoxHeightBoxLow2x,
                              textFormFieldAciklamalari("E-posta"),
                              context.sizedBoxHeightBoxLow,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: context.sanalLiraTextFormFielRadius,
                                  color: AppColorStyle.instance.brightGrey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: TextFormField(
                                      onSaved: (newValue) => email = newValue,
                                      style: AppTextStyle.instance.semiBold12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value) => Validator.instance.validateEmail(value),
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red),
                                        hintText: "E-posta",
                                        border: InputBorder.none,
                                        suffixIconColor: AppColorStyle.instance.darkKnight,
                                      )),
                                ),
                              ),
                              context.sizedBoxHeightBoxLow2x,
                              textFormFieldAciklamalari("Cep Teleefon Numaranız"),
                              context.sizedBoxHeightBoxLow,
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: context.sanalLiraTextFormFielRadius,
                                          color: AppColorStyle.instance.brightGrey,
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 10.r,
                                              child: Image.asset("turkeyFlag".toImagesPng),
                                            ),
                                            context.sizedBoxWidthBoxLow,
                                            Center(
                                                child: Text(
                                              "+90",
                                              style: AppTextStyle.instance.semiBold13TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    context.sizedBoxWidthBoxLow2x,
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: context.sanalLiraTextFormFielRadius,
                                          color: AppColorStyle.instance.brightGrey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: TextFormField(
                                              onSaved: (newValue) => telNum = newValue,
                                              style: AppTextStyle.instance.semiBold12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              validator: (value) => Validator.instance.validateTelNumber(value),
                                              keyboardType: TextInputType.phone,
                                              textInputAction: TextInputAction.next,
                                              decoration: InputDecoration(
                                                errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red),
                                                hintText: "554...",
                                                border: InputBorder.none,
                                                suffixIconColor: AppColorStyle.instance.darkKnight,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Checkbox(
                                      activeColor: AppColorStyle.instance.twinkleBlue,
                                      checkColor: AppColorStyle.instance.bouncyBallGreen,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                      value: ref.watch(isCheckChangeProvider),
                                      onChanged: ((value) {
                                        ref.read(isCheckChangeProvider.notifier).update((state) => state = !state);
                                        verify = value;
                                      })),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: "Hesabınızı oluştururken",
                                          style: AppTextStyle.instance.regular12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: " sözleşme ve koşulları",
                                                style:
                                                    AppTextStyle.instance.semiBold12TextStyle.copyWith(color: AppColorStyle.instance.samphireGreen)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "kabul etmeniz gerekir.",
                                        style: AppTextStyle.instance.regular12TextStyle.copyWith(color: AppColorStyle.instance.darkKnight),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              verify == false ? Text("onaylaaa") : SizedBox.shrink(),
                              CustomPrimaryButton(
                                  buttonHeight: 47.h,
                                  description: "Giriş Yap",
                                  customButtonColor: AppColorStyle.instance.snowPea,
                                  onPressed: (() async {
                                    verify = ref.watch(isCheckChangeProvider);
                                    setState(() {});
                                    if (formKey.currentState!.validate() && verify != null && verify != false) {
                                      formKey.currentState?.save();
                                      print(ad);
                                      print(soyadi);
                                      print(email);
                                      print(telNum);
                                      print(sifre);
                                      print(verify);
                                    }
                                  }))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text textFormFieldAciklamalari(String aciklayiciText) {
    return Text(
      aciklayiciText,
      style: AppTextStyle.instance.regular12TextStyle.copyWith(color: AppColorStyle.instance.twinkleBlue),
    );
  }

  Positioned sanaLiraLogo() {
    return Positioned(
      top: 55.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "sanaLiraLogo".toImagesPng,
          ),
        ],
      ),
    );
  }

  Positioned backGroundColor() {
    return Positioned(
      child: Container(
        color: AppColorStyle.instance.bouncyBallGreen,
      ),
    );
  }
}

class FormBaslik extends StatelessWidget {
  final String renkliFirmaAdi;
  final String yeniUyelik;
  const FormBaslik({
    Key? key,
    required this.renkliFirmaAdi,
    required this.yeniUyelik,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: renkliFirmaAdi,
        style: AppTextStyle.instance.semiBold16TextStyle.copyWith(color: AppColorStyle.instance.bouncyBallGreen),
        children: <TextSpan>[
          TextSpan(text: yeniUyelik, style: AppTextStyle.instance.semiBold16TextStyle.copyWith(color: AppColorStyle.instance.darkKnight)),
        ],
      ),
    );
  }
}
