import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.model});

  final TicketModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.grey[200]!, offset: const Offset(3, 3), blurRadius: 5),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  backgroundColor: Colors.blue.withOpacity(0.3),
                  side: BorderSide.none,
                  label: Text(
                    '${model.status}',
                    style: CustomTextTheme.paragraph1.copyWith(
                      color: ColorTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  DateFormat('dd MM yyyy').format(model.date!),
                  style: CustomTextTheme.paragraph1,
                )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${model.title}',
              style: CustomTextTheme.paragraph2.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            ReadMoreText(
              '${model.information}',
              trimLines: 2,
              style: CustomTextTheme.paragraph1,
              colorClickableText: ColorTheme.primary,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: CustomTextTheme.paragraph1.copyWith(color: ColorTheme.primary),
            ),
            Divider(color: Colors.grey[100]).py(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(
                  side: BorderSide.none,
                  backgroundColor: Colors.blue.withOpacity(0.3),
                  label: Text(
                    '${model.site?.name}',
                    style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
                Chip(
                  side: BorderSide.none,
                  backgroundColor: Colors.blue.withOpacity(0.3),
                  label: Text(
                    '${model.customer?.name}',
                    style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            model.status == 'CUSTOMER_APPROVED'
                ? PrimaryButton(
                    title: 'Check In',
                    onTap: () {},
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
