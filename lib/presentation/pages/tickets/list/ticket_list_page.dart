import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/components/card/ticket_card.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:next_starter/presentation/routes/app_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class TicketListPage extends StatefulWidget {
  const TicketListPage({super.key});

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
  final form = fb.group({
    'status': [''],
  });

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
      body: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return Column(
            children: [
              const DropdownInput(
                title: 'Status',
                formControlName: 'status',
                hint: 'Ticket Status',
                items: [
                  {
                    'text': 'Customer Approved',
                    'value': 'CUSTOMER_APPROVED',
                  }
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: List.generate(
                  10,
                  (index) => TicketCard(
                    title: 'Fixing Something In Pipeline',
                    status: index % 3 == 0 ? 'CUSTOMER_APPROVED' : 'WORKING',
                    onTap: () {
                      context.router.push(const TicketDetailRoute());
                    },
                  ),
                ),
              ).scrollVertical().expand(),
            ],
          ).p(16);
        },
      ),
    );
  }
}
