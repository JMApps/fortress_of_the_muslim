import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/widget/about_us_app_item.dart';

class AboutUsAppList extends StatelessWidget {
  const AboutUsAppList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 8),
            children: [
              AboutUsAppItem(
                  title: 'Крепость мусульманина',
                  subTitle: 'Из слов поминания встречающихся в Коране и Сунне',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.fortressofthemuslim'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Мольбы из Корана',
                  subTitle: 'Из слов поминания встречающихся в Коране',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.supplicationsfromquran'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Жемчужины Тарифи',
                  subTitle:
                      'Высказывания достопочтенного шейха Абдуль-Азиза ат-Тарифи',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.gemstarifi'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Имена Аллаха',
                  subTitle:
                      'Толкование прекрасных имён Аллаха в свете Корана и Сунны',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.thenamesof'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: '200 вопросов',
                  subTitle: '200 вопросов по вероучению Ислама',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.questions200'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: '40 хадисов',
                  subTitle: '40 хадисов имама ан-Навави',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.hadith40'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Сила воли',
                  subTitle: 'Свет знаний делает человека человеком',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.strengthofwill'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Бейна Ядейк',
                  subTitle: 'Арабский в твоих руках',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.arabicinyourhands'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Ракъаикъ Къуран',
                  subTitle: 'Смягчение сердец Кораном',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.raqaiqquran'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: '3 основы',
                  subTitle: '7 рубежей Единобожия',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.fundamentals'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Мой блокнот PRO',
                  subTitle: 'Словарь. Задачи. Заметки',
                  appLink:
                      'https://play.google.com/store/apps/details?id=jmapps.addmyfavoriteword'),
              Divider(indent: 16, endIndent: 16),
            ],
          )
        : ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 8),
            children: [
              AboutUsAppItem(
                  title: 'Крепость верующего',
                  subTitle: 'Из слов поминания встречающихся в Коране и Сунне',
                  appLink:
                      'https://apps.apple.com/ru/app/крепость-верующего/id1564920951'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Мольбы из Корана',
                  subTitle: 'Из слов поминания встречающихся в Коране',
                  appLink:
                      'https://apps.apple.com/ru/app/мольбы-из-корана/id1578687261'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Жемчужины Тарифи',
                  subTitle:
                      'Высказывания достопочтенного шейха Абдуль-Азиза ат-Тарифи',
                  appLink:
                      'https://apps.apple.com/ru/app/жемчужины-тарифи/id1579165434'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: 'Имена Аллаха',
                  subTitle:
                      'Толкование прекрасных имён Аллаха в свете Корана и Сунны',
                  appLink:
                      'https://apps.apple.com/ru/app/имена-аллаха/id1584057836'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: '200 вопросов',
                  subTitle: '200 вопросов по вероучению Ислама',
                  appLink:
                      'https://apps.apple.com/ru/app/200-вопросов/id1585935857'),
              Divider(indent: 16, endIndent: 16),
              AboutUsAppItem(
                  title: '40 хадисов',
                  subTitle: '40 хадисов имама ан-Навави',
                  appLink:
                      'https://apps.apple.com/ru/app/40-хадисов/id1590150115'),
              Divider(indent: 16, endIndent: 16),
            ],
          );
  }
}
