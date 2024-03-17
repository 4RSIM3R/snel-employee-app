import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/theme/theme.dart';

@RoutePage()
class TicketHistoryPage extends StatefulWidget {
  const TicketHistoryPage({super.key});

  @override
  State<TicketHistoryPage> createState() => _TicketHistoryPageState();
}

class _TicketHistoryPageState extends State<TicketHistoryPage> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Ticket Information'),
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: ColorTheme.primary),
        ),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: currentStep,
          margin: const EdgeInsetsDirectional.only(start: 60.0),
          controlsBuilder: (context, details) => Container(),
          onStepTapped: (index) {
            setState(() => currentStep = index);
          },
          steps: [
            Step(
              title: Text('13 March 2024', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
              isActive: true,
              state: StepState.indexed,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Action', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 4),
                  Text(
                    'Fixing Broken Pipe In Sector',
                    style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text('Employee', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 4),
                  Text('MR John Doe', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    style: CustomTextTheme.paragraph1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        child: PrimaryButton(
                          title: 'See Photos',
                          isSmall: true,
                          isFullWidth: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Step(
              title: const Text('17 March 2024'),
              isActive: true,
              state: StepState.indexed,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Action', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 4),
                  Text('Fixing Broken Pipe In Sector',
                      style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text('Employee', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 4),
                  Text('MR John Doe', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    style: CustomTextTheme.paragraph1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        child: PrimaryButton(
                          title: 'See Photos',
                          isSmall: true,
                          isFullWidth: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Step(
              title: const Text('Done'),
              isActive: true,
              state: StepState.complete,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Action', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 4),
                  Text('Fixing Broken Pipe In Sector',
                      style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text('Employee', style: CustomTextTheme.paragraph1),
                  const SizedBox(height: 4),
                  Text('MR John Doe', style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    style: CustomTextTheme.paragraph1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        child: PrimaryButton(
                          title: 'See Photos',
                          isSmall: true,
                          isFullWidth: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
