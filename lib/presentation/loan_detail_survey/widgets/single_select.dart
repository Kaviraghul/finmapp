import 'package:fin_mapp/models/single_select/single_select.dart';
import 'package:fin_mapp/presentation/loan_detail_survey/loan_detail_survey_view.model.dart';
import 'package:flutter/material.dart';

class SingleSelectCard extends StatefulWidget {
  final SingleSelectModel questionData;
  final UserResponseCallback userResponseCallback;

  const SingleSelectCard({
    super.key,
    required this.questionData,
    required this.userResponseCallback,
  });

  @override
  State<SingleSelectCard> createState() => _SingleSelectCardState();
}

class _SingleSelectCardState extends State<SingleSelectCard> {
  late String? _character = widget.questionData.selectedOption;

  @override
  void initState() {
    super.initState();
    _character = widget.questionData.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.questionData.mcq.label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20.0);
            },
            itemCount: widget.questionData.mcq.options!.length,
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                shape: ContinuousRectangleBorder(
                  side: BorderSide(
                    color: _character ==
                            widget.questionData.mcq.options![index].key
                        ? Colors.orange
                        : Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                selected:
                    _character == widget.questionData.mcq.options![index].key,
                selectedColor: Colors.orange,
                title: Text(widget.questionData.mcq.options![index].value),
                leading: Radio<String?>(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.orange,
                  value: widget.questionData.mcq.options![index].value,
                  groupValue: _character,
                  onChanged: (String? value) {
                    setState(() {
                      _character = value;
                      widget.questionData.selectedOption = value;
                      widget.userResponseCallback(
                        widget.questionData.mcq.label,
                        value!,
                      );
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
