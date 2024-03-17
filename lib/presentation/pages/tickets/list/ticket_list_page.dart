import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TicketListPage extends StatelessWidget {
  const TicketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Ticket Task'),
        actions: [
          IconButton(
            onPressed: () async {
              DateTime now = DateTime.now();
              await showDateRangePicker(
                context: context,
                initialDateRange: DateTimeRange(
                  start: DateTime(now.year, now.month, 1),
                  end: DateTime(now.year, now.month + 1, 0),
                ),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }
}
