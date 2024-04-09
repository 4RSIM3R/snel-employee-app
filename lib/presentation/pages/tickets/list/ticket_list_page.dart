import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/common/utils/date.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/ticket_card.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:next_starter/presentation/pages/tickets/list/cubit/ticket_list_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class TicketListPage extends StatefulWidget {
  const TicketListPage({super.key});

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
  final bloc = locator<TicketListCubit>();

  var start = DateTime(DateTime.now().year, DateTime.now().month, 1);
  var end = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  final form = fb.group({
    'status': FormControl<String>(value: 'CUSTOMER_APPROVED'),
  });

  @override
  void initState() {
    super.initState();
    bloc.get(
      start: toMysqlDate(start),
      end: toMysqlDate(start),
      status: form.controls['status']!.value.toString(),
    );

    form.controls['status']!.valueChanges.listen((event) {
      bloc.get(
        start: toMysqlDate(start),
        end: toMysqlDate(start),
        status: event.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Ticket Task'),
          actions: [
            IconButton(
              onPressed: () async {
                var picked = await showDateRangePicker(
                  context: context,
                  initialDateRange: DateTimeRange(start: start, end: end),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                setState(() {
                  start = picked?.start ?? start;
                  end = picked?.end ?? end;
                });

                bloc.get(
                  start: toMysqlDate(start),
                  end: toMysqlDate(end),
                  status: form.controls['status']!.value.toString(),
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
                    },
                    {
                      'text': 'Working',
                      'value': 'WORKING',
                    },
                    {
                      'text': 'Need Admin Review',
                      'value': 'NEED_ADMIN_REVIEW',
                    }
                  ],
                ),
                const SizedBox(height: 16),
                BlocBuilder<TicketListCubit, TicketListState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
                      failure: (failure) => Center(child: Text(failure.message)),
                      success: (success) => Column(
                        children: success.payload.isNotEmpty
                            ? success.payload.map((e) => TicketCard(model: e)).toList()
                            : [
                                const Center(child: Text('No Ticket, Relax')),
                              ],
                      ),
                    );
                  },
                ).scrollVertical().expand(),
              ],
            ).p(16);
          },
        ),
      ),
    );
  }
}
