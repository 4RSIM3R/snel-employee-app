import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class ProfileMainPage extends StatelessWidget {
  const ProfileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app, color: Colors.red),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: ColorTheme.primary,
                  borderRadius: BorderRadius.circular(45),
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider("https://i.pravatar.cc/300"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nadiem Makarim', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  Text('PT Sukses Bersama', style: CustomTextTheme.paragraph1),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
        ],
      ).p(16),
    );
  }
}
