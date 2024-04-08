import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/application/auth/auth_cubit.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/profile/main/cubit/profile_main_cubit.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({super.key});

  @override
  State<ProfileMainPage> createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  final auth = locator<AuthCubit>();
  final bloc = locator<ProfileMainCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => auth),
        BlocProvider(create: (_) => bloc),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () => context.showLoadingIndicator(),
            error: (msg) {
              context.hideLoading();
              context.showSnackbar(title: "Error", message: msg, error: true);
            },
            successLogout: (msg) {
              context.hideLoading();

              context.showSnackbar(title: "Sukses", message: msg);
              context.route.replace(LoginRoute());
            },
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Profile'),
            actions: [
              IconButton(
                onPressed: () {
                  auth.logout();
                },
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
        ),
      ),
    );
  }
}
