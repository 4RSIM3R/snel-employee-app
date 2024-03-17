import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:next_starter/presentation/pages/catalog/form/catalog_form_page.dart';
import 'package:next_starter/presentation/pages/catalog/list/catalog_list_page.dart';
import 'package:next_starter/presentation/pages/profile/main/profile_main_page.dart';
import 'package:next_starter/presentation/pages/tickets/detail/ticket_detail_page.dart';
import 'package:next_starter/presentation/pages/tickets/form/ticket_form_page.dart';
import 'package:next_starter/presentation/pages/tickets/list/ticket_list_page.dart';

import '../pages/pages.dart';

part 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    // Auth
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: OtpRoute.page),
    // Home
    AutoRoute(
      page: HomeRoute.page,
      children: [
        AutoRoute(page: TicketListRoute.page),
        AutoRoute(page: CatalogListRoute.page),
        AutoRoute(page: ProfileMainRoute.page),
      ],
    ),
    // Ticket
    AutoRoute(page: TicketDetailRoute.page),
    AutoRoute(page: TicketFormRoute.page),
    // Catalog
    AutoRoute(page: CatalogFormRoute.page),
    // Profile
  ];
}
