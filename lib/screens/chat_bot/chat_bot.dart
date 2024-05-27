import 'dart:async';

 import 'package:flutter/material.dart';

import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lahint/components/text/custom_text.dart';
import 'package:lahint/components/custom_app_bar/custom_app_bar.dart';
import 'package:lahint/components/custom_image/custom_image.dart';
import 'package:lahint/components/text_filed/text_filed_custom.dart';
import 'package:lahint/helper/validation_form.dart';
import 'package:lahint/routes/routes.dart';
import 'package:lahint/screens/home/components/navigation_bar/custom_navigation_bar.dart';
import 'package:lahint/utility/all_app_words.dart';
import 'package:lahint/utility/app_theme.dart';

class ChatBotScreen extends StatefulWidget {
  static String routeName = '/ChatBotScreen';

  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/chatservicesbot.json").build();
    DialogFlow dialogflow =
        DialogFlow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()![0]["text"]["text"][0].toString()
      });
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuApp(MenuState.support),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          backgroundColor: AppColors.green,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomImage(assetImg: AppImage.whatsApp),
          ),
        ),
      ),
      appBar: CustomAppBar(
        customTitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: GlobalWords.support_assistance.tr,
              fontSize: 17,
              fontFamily: AppFonts.bold,
            ),
            const SizedBox(height: 8),
            const CustomText(text: "اعداد عقد عمل لوافد", fontSize: 14),
            const SizedBox(height: 4),
            const CustomText(
              text: "#245637",
              fontSize: 14,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const Divider(
            height: 5.0,
            color: AppColors.grey,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) => chat(
                  messages[index]["message"].toString(),
                  messages[index]["data"]),
            ),
          ),
          // const Divider(
          //   height: 5.0,
          //   color: Colors.deepOrange,
          // ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: CustomTextField(
                      controller: messageInsert,
                      inputType: TextInputType.text,
                      labelText: "",
                      hintText: "Send your message",
                      fillColor: AppColors.lightGrey,
                      borderRadius: 46,
                      fillBorderColor: AppColors.lightGrey,
                      textFieldVaidType: TextFieldValidatorType.Optional),
                ),
                IconButton(
                  icon: const CustomImage(
                    assetImg: AppImage.send_file,
                    height: 30.0,
                    color: AppColors.mainColor,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: Get.context!,
                      constraints: BoxConstraints(maxHeight: 0.85.sh),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) => SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 32.0, horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              InkWell(
                                onTap: (){
                                  goToScreen(screenNames: ScreenNames.attachmentsScreen);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.greyF3F3F3,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      const CustomImage(
                                        assetImg: AppImage.send_file,
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      CustomText(
                                        text: "من المحلقات السابقة",
                                        fontSize: 16.sp,
                                        fontFamily: AppFonts.medium,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.greyF3F3F3,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const CustomImage(
                                      assetImg: AppImage.camera,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    CustomText(
                                      text: "استخدم الكاميرا",
                                      fontSize: 16.sp,
                                      fontFamily: AppFonts.medium,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.greyF3F3F3,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const CustomImage(
                                      assetImg: AppImage.upload,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    CustomText(
                                      text: "من جهازك",
                                      fontSize: 16.sp,
                                      fontFamily: AppFonts.medium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                    icon: const Icon(
                      Icons.send,
                      size: 30.0,
                      color: AppColors.mainColor,
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messages.insert(
                              0, {"data": 1, "message": messageInsert.text});
                        });

                        Future.delayed(const Duration(milliseconds: 1500), () {
                          setState(() {
                            messages.insert(0, {
                              "data": 0,
                              "message":
                                  messageInsert.text + ", Test chatBot replay "
                            });
                          });
                        });

                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                    }),
              ],
            ),
          ),
          // const SizedBox(height: 16)
        ],
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            data == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (data == 1)
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                AppImage.logo,
              ),
            ),
          const SizedBox(width: 8),

          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              // width: 0.7.sw,
              alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: data == 0
                    ? const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(24),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (data == 0) const CustomImage(assetImg: AppImage.sended),
                  Expanded(
                    child: CustomText(
                      text: message,
                      fontSize: 16,
                      textAlign: data == 0 ? TextAlign.end : TextAlign.start,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (data == 1) const CustomImage(assetImg: AppImage.sended)
                ],
              ),
            ),
          ),
          if (data == 0)
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage(AppImage.chatbot),
            ),
          // Bubble(
          //   radius: const Radius.circular(15.0),
          //   color: data == 0 ? Colors.deepOrange : Colors.orangeAccent,
          //   elevation: 0.0,
          //   alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          //   nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          //   child: Container(
          //     width: 0.7.sw,
          //     padding: const EdgeInsets.all(2.0),
          //     child: CustomText(
          //       text: message,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
