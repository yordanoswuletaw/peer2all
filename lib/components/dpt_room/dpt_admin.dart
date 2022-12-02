import 'package:peer2all/components/dpt_room/dpt_room.dart';
import 'package:peer2all/const_pattern.dart';
import 'package:peer2all/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DptAdmin extends StatefulWidget {
  const DptAdmin({Key? key}) : super(key: key);

  @override
  State<DptAdmin> createState() => _DptAdminState();
}

class _DptAdminState extends State<DptAdmin> {
  List<Map<String, dynamic>> links = [];
  String linkHintErrorText = '';
  int _currentStep = 0;
  void deleteLink(link) {
    setState(() {
      links.remove(link);
    });
  }

  void clearLink() {
    setState(() {
      links.clear();
      linkHintErrorText = '';
    });
  }

  void addLink(bool status, Map<String, dynamic> link) {
    setState(() {
      if (status) {
        if (link.isNotEmpty) {
          if (link['link'].isNotEmpty && link['hint'].isNotEmpty) {
            links.add(link);
            linkHintErrorText = '';
          } else {
            linkHintErrorText =
                'link and about link fields should not be empty!';
          }
        } else {
          linkHintErrorText = 'link and about link fields should not be empty!';
        }
      } else {
        linkHintErrorText = 'link and about link fields should not be empty!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_down),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Create Post',
          style: textStyle(context, 1.0, 16.0, FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Stepper(
            margin: const EdgeInsets.only(left: 38, right: 2),
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepTapped: (index) => setState(() {
              _currentStep = index;
            }),
            onStepContinue: () {
              if (_currentStep != 3) {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  clearLink();
                  setState(() {
                    _currentStep += 1;
                  });
                }
              }
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep != 0) {
                  _currentStep -= 1;
                }
              });
            },
            steps: [
              Step(
                title: Text(
                  'Post Tittle',
                  style: textStyle(context, .9, 14.0, FontWeight.w500),
                ),
                content: FormInput(
                    contentType: 'title',
                    inputType: TextInputType.text,
                    addLink: addLink),
              ),
              Step(
                title: Text(
                  'Post Links',
                  style: textStyle(context, .9, 14.0, FontWeight.w500),
                ),
                content: Column(
                  children: [
                    FormInput(
                      contentType: 'link',
                      inputType: TextInputType.url,
                      addLink: addLink,
                      linkHintErrorText: linkHintErrorText,
                    ),
                    ...links
                        .map((link) => AddedLinks(
                              link: link,
                              deleteLink: deleteLink,
                            ))
                        .toList(),
                  ],
                ),
              ),
              Step(
                title: Text(
                  'Post Description',
                  style: textStyle(context, .9, 14.0, FontWeight.w500),
                ),
                content: FormInput(
                    contentType: 'description',
                    inputType: TextInputType.multiline,
                    addLink: addLink),
              ),
              Step(
                title: Text(
                  'File Sharing | Post',
                  style: textStyle(context, .9, 14.0, FontWeight.w500),
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FormButton(
                      text: 'attach image',
                      icon: Icons.attachment,
                      gKey: _key,
                      clearLink: clearLink,
                    ),
                    const SizedBox(width: 16),
                    FormButton(
                      text: 'post',
                      icon: Icons.post_add,
                      gKey: _key,
                      clearLink: clearLink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddedLinks extends StatelessWidget {
  const AddedLinks({
    Key? key,
    required this.link,
    required this.deleteLink,
  }) : super(key: key);

  final Map<String, dynamic> link;
  final Function(Map<String, dynamic>) deleteLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.link_rounded,
            color: kGreen,
            size: 32,
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  link['hint'],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SelectableText(
                  link['link'],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => deleteLink(link),
            icon: const Icon(Icons.delete_forever_rounded,
                color: kGreen, size: 24),
          ),
        ],
      ),
    );
  }
}
