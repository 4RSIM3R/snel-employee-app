import 'package:adaptive_sizer/adaptive_sizer.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:next_starter/common/storage/storage.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/button/primary_button.dart';
import 'package:next_starter/presentation/components/input/text_input.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class CatalogFormPage extends StatefulWidget {
  const CatalogFormPage({super.key});

  @override
  State<CatalogFormPage> createState() => _CatalogFormPageState();
}

class _CatalogFormPageState extends State<CatalogFormPage> {
  final form = fb.group({
    'name': ['', Validators.required],
    'description': ['', Validators.required],
    'specification': ['', Validators.required],
    'identifier': ['', Validators.required],
  });

  final picker = ImagePicker();
  List<XFile?> image = [];
  XFile? excels;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cataloging Form'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(CupertinoIcons.download_circle),
          ),
        ],
      ),
      body: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const TextInput(
                  title: 'Unit Identifier',
                  formControlName: 'identifier',
                  hint: 'UNIT_ID',
                ),
                const SizedBox(height: 8),
                const TextInput(
                  title: 'Unit Name',
                  formControlName: 'name',
                  hint: 'PC200-10M0 CE ',
                ),
                const SizedBox(height: 8),
                const TextInput(
                  title: 'Unit Description',
                  formControlName: 'description',
                  hint: 'Komatsu PC200-10M0 CE Hydraulic Excavator',
                  maxLines: 5,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Specification", style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w600)),
                      8.verticalSpace,
                      
                      8.verticalSpace,
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTheme.border),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unit Photos',
                      style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w700),
                    ),
                    6.verticalSpaceRadius,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unit Detailed Data',
                      style: CustomTextTheme.paragraph1.copyWith(fontWeight: FontWeight.w700),
                    ),
                    6.verticalSpaceRadius,
                    InkWell(
                      onTap: () async {
                        await locator<Storage>().pickFile(extensions: ['xlsx', 'csv']);
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
                            Icon(CupertinoIcons.doc_append, color: ColorTheme.primary),
                            SizedBox(width: 8),
                            Text('Add Data', style: TextStyle(color: ColorTheme.primary))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ReactiveFormBuilder(
                  form: () => form,
                  builder: (context, form, child) {
                    return ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return PrimaryButton(
                          title: 'Submit',
                          isEnable: form.valid && image.isNotEmpty && excels != null,
                          onTap: () {},
                        );
                      },
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
