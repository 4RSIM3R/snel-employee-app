import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:readmore/readmore.dart';

@RoutePage()
class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Ticket Detail'),
        actions: [
          IconButton(
            onPressed: ()  {
              context.router.push(const TicketHistoryRoute());
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              'Fixing Broken Pipe In Sector',
              style: CustomTextTheme.paragraph2,
            ),
            const SizedBox(height: 8),
            Text('Information', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            ReadMoreText(
              'Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
              trimLines: 2,
              style: CustomTextTheme.paragraph1,
              colorClickableText: ColorTheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: CustomTextTheme.paragraph1.copyWith(color: ColorTheme.primary),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Customer', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.phone_fill),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Mr John Doe',
              style: CustomTextTheme.paragraph2,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Site', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.location_solid),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Blok Rokan Hulu',
              style: CustomTextTheme.paragraph2,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Photos', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.add),
                )
              ],
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                7,
                (index) => Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image:
                          CachedNetworkImageProvider('https://www.pymnts.com/wp-content/uploads/2022/04/car-repair.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.primary,
        onPressed: () {
          context.router.push(const TicketFormRoute());
        },
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}
