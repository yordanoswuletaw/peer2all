import 'package:peer2all/palette.dart';
import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.contentType,
    required this.inputType,
    required this.addLink,
    this.linkHintErrorText = '',
  }) : super(key: key);

  final String contentType, linkHintErrorText;
  final TextInputType inputType;
  final Function(bool, Map<String, dynamic>) addLink;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: '');
    TextEditingController _linkHint = TextEditingController(text: '');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: inputType,
                  validator: (val) {
                    if (contentType == 'title') {
                      if (val!.isEmpty) return 'title should not be empty';
                    }
                    return null;
                  },
                  controller: _controller,
                  onSaved: (val) {
                    if (contentType == 'link') {
                      if (_controller.text.isEmpty) {
                        addLink(false, {});
                      } else if (_controller.text.isNotEmpty) {
                        if (_controller.text.isEmpty) {
                          addLink(false, {});
                        } else {
                          addLink(true, {
                            'link': _controller.text,
                            'hint': _linkHint.text
                          });
                        }
                      }
                    }
                    _controller.text = '';
                  },
                  maxLines: inputType == TextInputType.multiline ? 5 : 1,
                  decoration: InputDecoration(
                      label: Text(contentType),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ],
          ),
          if (contentType == 'link') ...[
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.text,
              validator: (val) {
                if (val!.isEmpty) {
                  if (_controller.text.isNotEmpty) {
                    return 'a link should have link hint!';
                  }
                }
                return null;
              },
              controller: _linkHint,
              onSaved: (val) {
                if (_controller.text.isEmpty) {
                  addLink(false, {});
                } else if (_controller.text.isNotEmpty) {
                  if (_controller.text.isEmpty) {
                    addLink(false, {});
                  } else {
                    addLink(true,
                        {'link': _controller.text, 'hint': _linkHint.text});
                  }
                }
                _linkHint.text = '';
              },
              // maxLines: 2,
              decoration: InputDecoration(
                  label: const Text('about link'),
                  errorText:
                      linkHintErrorText.isEmpty ? null : linkHintErrorText,
                  // border: OutlineInputBorder(),
                  focusedBorder: InputBorder.none),
            ),
            TextButton.icon(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  addLink(false, {});
                } else if (_controller.text.isNotEmpty) {
                  if (_controller.text.isEmpty) {
                    addLink(false, {});
                  } else {
                    addLink(true,
                        {'link': _controller.text, 'hint': _linkHint.text});
                  }
                }
              },
              label: const Text('Add Link'),
              icon: const Icon(
                Icons.add_link_rounded,
                color: kGreen,
                size: 24,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
