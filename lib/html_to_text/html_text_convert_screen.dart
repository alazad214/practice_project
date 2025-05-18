import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlTextConvertScreen extends StatelessWidget {
  const HtmlTextConvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive HTML")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Html(
          data: _responsiveHtmlData,
          style: {
            "div": Style(
              width: Width.auto(),
              display: Display.block,
            ),
            "p": Style(
              fontSize: FontSize(16),
              color: Colors.black87,
            ),
            "img": Style(
              width: Width.auto(),
              lineHeight: LineHeight.normal,
              height: Height.auto(),
            ),
          },
        ),
      ),
    );
  }

  final String _responsiveHtmlData = '''
  <div class=\"flex xl:flex-row flex-col-reverse justify-center items-center xl:gap-16 gap-5  xl:mt-10 mt-5 w-full\" style=\"border: 0px solid; margin: 40px 0px 0px; padding: 0px; display: flex; width: 1504px; flex-direction: row; align-items: center; justify-content: center; gap: 64px; color: rgb(0, 0, 0); font-family: rubik, sans-serif; font-size: medium;\"><div class=\"h-full w-full flex flex-col gap-5 text-left \" style=\"border: 0px solid; margin: 0px; padding: 0px; display: flex; height: 368.469px; width: 720px; flex-direction: column; gap: 20px;\"><p class=\"xl:w-[70%] lg:text-[32px] md:text-[28px] text-xl font-medium xl:leading-[132%] leading-6\" style=\"border: 0px solid; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; font-size: 32px; line-height: 42.24px; --tw-leading: 132%; --tw-font-weight: 500; width: 504px;\">Campagin Announcement in Galaxy Stadium</p><p class=\"text-blackMedium font-normal lg:w-[95%] w-full lg:text-lg text-base\" style=\"border: 0px solid; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; width: 684px; font-size: 18px; line-height: 1.55556; --tw-font-weight: 400; color: rgb(107, 107, 107);\">Lorem ipsum dolor sit amet consectetur. Pulvinar pulvinar nibh lobortis suspendisse consectetur vitae arcu. Tortor senectus montes pellentesque nascetur at. Tincidunt venenatis id iaculis vitae turpis dictum libero. Purus faucibus est nisl tellus. Lacinia ultrices faucibus et sollicitudin est pellentesque. Ornare malesuada massa gravida mi. Quis elementum maecenas in hendrerit proin. Turpis curabitur ullamcorper tellus aliquet magna eget nec nulla. Aenean sed sed sed.</p></div><div class=\"w-full xl:h-[450px] h-[400px]\" style=\"border: 0px solid; margin: 0px; padding: 0px; height: 450px; width: 720px;\"><img alt=\"event image\" class=\"w-full h-full object-cover rounded-xl\" src=\"https://citizen-movement-for-change.netlify.app/assets/news2-CLSyTq2O.png\" style=\"border: 0px solid; margin: 0px; padding: 0px; display: block; height: 450px; width: 720px; border-radius: 12px; object-fit: cover;\"></div></div><div class=\"py-10\" style=\"border: 0px solid; margin: 0px; padding: 0px; padding-block: 40px; color: rgb(0, 0, 0); font-family: rubik, sans-serif; font-size: medium;\"><p class=\"text-blackDark font-semibold mb-5 lg:text-2xl text-xl\" style=\"border: 0px solid; margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; font-size: 24px; line-height: 1.33333; --tw-font-weight: 600; font-weight: 600; color: rgb(63, 63, 70);\">Loreum</p><p class=\"text-blackMedium font-normal lg:w-[95%] w-full mb-3 lg:text-lg text-base\" style=\"border: 0px solid; margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; width: 1428.8px; font-size: 18px; line-height: 1.55556; --tw-font-weight: 400; color: rgb(107, 107, 107);\">Lorem ipsum dolor sit amet consectetur. Pulvinar pulvinar nibh lobortis suspendisse consectetur vitae arcu. Tortor senectus montes pellentesque nascetur at. Tincidunt venenatis id iaculis vitae turpis dictum libero. Purus faucibus est nisl tellus. Lacinia ultrices faucibus et sollicitudin est pellentesque. Ornare malesuada massa gravida mi. Quis elementum maecenas in hendrerit proin. Turpis curabitur ullamcorper tellus aliquet magna eget nec nulla. Aenean sed sed sed.</p><p class=\"text-blackMedium font-normal lg:w-[95%] w-full mb-3 lg:text-lg text-base\" style=\"border: 0px solid; margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; width: 1428.8px; font-size: 18px; line-height: 1.55556; --tw-font-weight: 400; color: rgb(107, 107, 107);\">Lorem ipsum dolor sit amet consectetur. Pulvinar pulvinar nibh lobortis suspendisse consectetur vitae arcu. Tortor senectus montes pellentesque nascetur at. Tincidunt venenatis id iaculis vitae turpis dictum libero. Purus faucibus est nisl tellus. Lacinia ultrices faucibus et sollicitudin est pellentesque. Ornare malesuada massa gravida mi. Quis elementum maecenas in hendrerit proin. Turpis curabitur ullamcorper tellus aliquet magna eget nec nulla. Aenean sed sed sed.</p><p class=\"text-blackMedium font-normal lg:w-[95%] w-full mb-3 lg:text-lg text-base\" style=\"border: 0px solid; margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; width: 1428.8px; font-size: 18px; line-height: 1.55556; --tw-font-weight: 400; color: rgb(107, 107, 107);\">Lorem ipsum dolor sit amet consectetur. Pulvinar pulvinar nibh lobortis suspendisse consectetur vitae arcu. Tortor senectus montes pellentesque nascetur at. Tincidunt venenatis id iaculis vitae turpis dictum libero. Purus faucibus est nisl tellus. Lacinia ultrices faucibus et sollicitudin est pellentesque. Ornare malesuada massa gravida mi. Quis elementum maecenas in hendrerit proin. Turpis curabitur ullamcorper tellus aliquet magna eget nec nulla. Aenean sed sed sed.</p></div>
  ''';
}
