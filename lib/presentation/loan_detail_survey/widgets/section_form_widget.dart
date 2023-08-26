
import 'package:fin_mapp/models/form/field.dart';
import 'package:fin_mapp/models/section/section_factory_model.dart';
import 'package:fin_mapp/presentation/loan_detail_survey/loan_detail_survey_view.model.dart';
import 'package:flutter/material.dart';

class SectionFormWidget extends StatefulWidget {
  final SectionFormWrapper formData;
  final UserResponseCallback userResponseCallback;

  const SectionFormWidget({
    super.key,
    required this.formData,
    required this.userResponseCallback,
  });

  @override
  State<SectionFormWidget> createState() => _SectionFormWidgetState();
}

class _SectionFormWidgetState extends State<SectionFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.formData.model.label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                // final TextEditingController textEditingController =
                //     TextEditingController();
                FieldModel field =
                    widget.formData.model.formFields[index].field;
                String? userInput = field.userInput;
                return TextFormField(
                  // controller:  textEditingController,
                  initialValue: userInput,
                  decoration: InputDecoration(
                    labelText: field.name,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter ';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    field.userInput = value;
                    widget.userResponseCallback(field.name, value);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20.0);
              },
              itemCount: widget.formData.model.formFields.length),
        ),
      ],
    );
  }
}
