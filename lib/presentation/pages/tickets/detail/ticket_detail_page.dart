import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';

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
            onPressed: () async {},
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
