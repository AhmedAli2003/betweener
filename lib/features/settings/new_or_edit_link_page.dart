import 'package:betweener/core/helper/context_extenition.dart';
import 'package:betweener/core/network/models/link_model.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:betweener/features/settings/link_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/network/models/api_response.dart';
import '../../core/provider/link_provider_controller.dart';

class NewOrEditLinkPage extends StatefulWidget {
  final bool isNew;
  final LinkData linkData;

  const NewOrEditLinkPage({
    super.key,
    LinkData? linkData,
    required this.isNew,
  }) : linkData =
            !isNew && linkData != null ? linkData : const LinkData.empty();

  @override
  State<NewOrEditLinkPage> createState() => _NewOrEditLinkPageState();
}

class _NewOrEditLinkPageState extends State<NewOrEditLinkPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _linkController;
  late final FocusScopeNode _node;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.isNew ? null : widget.linkData.title,
    );
    _linkController = TextEditingController(
      text: widget.isNew ? null : widget.linkData.link,
    );
    _node = FocusScopeNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _linkController.dispose();
    _node.dispose();
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
        child: Form(
          child: FocusScope(
            node: _node,
            child: Column(
              children: [
                const Spacer(),
                PrimaryLabeledTextFieldWidget(
                  controller: _titleController,
                  label: 'Title',
                  hint: titleHint,
                  onEditingComplete: _node.nextFocus,
                ),
                const SizedBox(height: 24),
                PrimaryLabeledTextFieldWidget(
                  controller: _linkController,
                  label: 'Link',
                  hint: linkHint,
                  keyboardType: TextInputType.url,
                  onEditingComplete: _node.nextFocus,
                ),
                const SizedBox(height: 48),
                SecondaryButtonWidget(
                  onTap: () async {
                    //TODO: save or add
                    ApiResponse apiResponse = await Provider.of<LinkProviderController>(context,listen: false)
                        .addLink(links: Links(title: 'ahmed',link: 'adsfdf'));
                    if (apiResponse.success) {
                      AppRouter.homePage;
                    }
                    context.showSnackBar(
                        message: apiResponse.message,
                        error: !apiResponse.success);
                  },
                  text: isNew ? 'Add' : 'Save',
                  width: 120,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
