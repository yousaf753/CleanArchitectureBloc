import 'package:clean_arch_cubit/res/app_colors.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String? name;
  final String? email;
  final String? imageUrl;

  const HomeItem({
    super.key,
    this.name,
    this.email,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: AppColors.colorWhite,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(name ?? ""),
              const SizedBox(
                height: 5,
              ),
              Text(email ?? "")
            ],
          ),
        ),
      ),
    );
  }
}
