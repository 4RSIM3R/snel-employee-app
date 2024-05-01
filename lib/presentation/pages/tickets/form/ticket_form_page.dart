import 'dart:io';

import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/data/models/ticket/ticket_model.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/components/input/text_input.dart';
import 'package:next_starter/presentation/pages/tickets/form/cubit/ticket_form_cubit.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

@RoutePage()
class TicketFormPage extends StatefulWidget {
  const TicketFormPage({super.key, required this.model});

  final TicketModel model;

  @override
  State<TicketFormPage> createState() => _TicketFormPageState();
}

class _TicketFormPageState extends State<TicketFormPage> {
  final form = fb.group({
    'title': ['', Validators.required],
    'information': ['', Validators.required],
  });

  final picker = ImagePicker();
  List<XFile?> image = [];

  final bloc = locator<TicketFormCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Ticket Working Form'),
      ),
      body: ReactiveFormBuilder(
          form: () => form,
          builder: (context, form, child) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const TextInput(
                    title: 'Summary',
                    formControlName: 'title',
                    hint: 'Short Description About Your Task',
                  ),
                  const SizedBox(height: 16),
                  const TextInput(
                    title: 'Information',
                    formControlName: 'information',
                    hint: 'Describe your problem here',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unit Photos',
                        style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w700),
                      ),
                      6.verticalSpace,
                      InkWell(
                        onTap: () async {
                          var file = await picker.pickImage(source: ImageSource.camera, imageQuality: 25);
                          setState(() => image.add(file));
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTheme.primary),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.camera, color: ColorTheme.primary),
                              SizedBox(width: 8),
                              Text('Add Image', style: TextStyle(color: ColorTheme.primary))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  image.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Attachment Image',
                              style: CustomTextTheme.paragraph1,
                            ),
                            InkWell(
                              onTap: () {
                                var assets = image.map((e) => Image(image: FileImage(File(e!.path)))).toList();
                                SwipeImageGallery(context: context, children: assets).show();
                              },
                              child: Text(
                                'See All',
                                style: CustomTextTheme.paragraph1.copyWith(color: Colors.blue),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  Expanded(child: Container()),
                  ReactiveFormBuilder(
                    form: () => form,
                    builder: (context, form, child) {
                      return ReactiveFormConsumer(
                        builder: (context, form, child) {
                          return PrimaryButton(
                            title: 'Submit',
                            isEnable: form.valid,
                            onTap: () {
                              var data = Map.of(form.value);
                              data['ticket_id'] = widget.model.id;
                              bloc.submit(payload: form.value, image: image);
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            );
          }),
    );
  }
}
