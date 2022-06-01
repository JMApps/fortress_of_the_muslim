import 'package:flutter/material.dart';

class MainItem extends StatelessWidget {
  const MainItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.route,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String route;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
