import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          margin: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            child: Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер текста',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CupertinoSlider(
                            activeColor: Colors.blue,
                            min: 14,
                            max: 40,
                            value: 16,
                            onChanged: (value) {},
                            onChangeEnd: (value) {},
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '14',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Цвет арабского текста',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: Colors.black,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Цвет текста транскрипции',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: Colors.black,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: Colors.black,
                      ),
                      title: const Text(
                        'Цвет текста перевода',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: Colors.black,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      leading: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text('Отображение арабского текста'),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      leading: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text('Отображение текста транскрипции'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}