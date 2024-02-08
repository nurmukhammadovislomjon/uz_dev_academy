import 'package:flutter/material.dart';
import 'package:uz_dev_academy/home/pages/kurslar_elements/listview_kurslar.dart';

class KurslarPage extends StatefulWidget {
  const KurslarPage({super.key});

  @override
  State<KurslarPage> createState() => _KurslarPageState();
}

class _KurslarPageState extends State<KurslarPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ListViewWidgetKurslar()
      ],
    );
  }
}
