import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:betweener/features/settings/link_data.dart';
import 'package:flutter/material.dart';

class NewOrEditLinkPage extends StatefulWidget {
  final bool isNew;
  final LinkData linkData;
  const NewOrEditLinkPage({
    super.key,
    LinkData? linkData,
    required this.isNew,
  }) : linkData = !isNew && linkData != null ? linkData : const LinkData.empty();

  @override
  State<NewOrEditLinkPage> createState() => _NewOrEditLinkPageState();
}

class _NewOrEditLinkPageState extends State<NewOrEditLinkPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.isNew ? null : widget.linkData.title,
    );
    _linkController = TextEditingController(
      text: widget.isNew ? null : widget.linkData.link,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNew = widget.isNew;
    final String appBarTitle = isNew ? 'Add Link' : 'Edit';
    final String? titleHint = isNew ? 'Enter a title' : null;
    final String? linkHint = isNew ? 'https://example.com' : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const Spacer(),
            PrimaryLabeledTextFieldWidget(
              controller: _titleController,
              label: 'Title',
              hint: titleHint,
            ),
            const SizedBox(height: 24),
            PrimaryLabeledTextFieldWidget(
              controller: _linkController,
              label: 'Link',
              hint: linkHint,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 48),
            SecondaryButtonWidget(
              onTap: () {
                //TODO: save or add
              },
              text: isNew ? 'Add' : 'Save',
              width: 120,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
