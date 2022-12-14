import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Hesap extends ConsumerStatefulWidget {
  const Hesap({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HesapState();
}

class _HesapState extends ConsumerState<Hesap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
