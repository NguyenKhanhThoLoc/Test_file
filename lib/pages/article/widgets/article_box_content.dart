import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:first_app/apps/utils/const.dart';
import 'package:first_app/apps/utils/parse_htlm.dart';
import 'package:first_app/models/question_model.dart';
import 'package:first_app/pages/article/widgets/article_modal.dart';
import 'package:first_app/providers/question_provider.dart';
import 'package:first_app/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlighting/flutter_highlighting.dart';
import 'package:flutter_highlighting/themes/a11y-dark.dart';
import 'package:highlighting/languages/dart.dart';
import 'package:provider/provider.dart';


class ArticleBoxContent extends StatefulWidget {
  int idTopic;
  ArticleBoxContent({super.key, required this.idTopic});

  @override
  State<ArticleBoxContent> createState() => _ArticleBoxContentState();
}

class _ArticleBoxContentState extends State<ArticleBoxContent> {
  final PageController pageController = PageController();
  String valueInput = '';

  void handleSubmit(Question data) async {
    if (valueInput.isEmpty) return;
    await showModal(context, valueInput, data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<QuestionProvider>().getQuestionList(widget.idTopic),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Question> data = snapshot.data as List<Question>;
          return ExpandablePageView.builder(
            onPageChanged: (value) {
              context.read<QuestionProvider>().setCurrentData(value);
            },
            controller: pageController,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      data[index].title.toString(),
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getHeight(context) * 0.02),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Color(0xff333333),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      width: getWidth(context),
                      child: HighlightView(
                        parseHtmlString(data[index].question),
                        theme: a11yDarkTheme,
                        languageId: dart.id,
                        padding: const EdgeInsets.all(12),
                        // Specify text style
                        textStyle: const TextStyle(
                          fontFamily: 'My awesome monospace font',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(context) * 0.02),
                    const Text(
                      'Đáp án của bạn :',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: getHeight(context) * 0.02),
                    TextFormField(
                      onChanged: (value) => valueInput = value,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Nhập đáp án của bạn tại đây'),
                    ),
                    SizedBox(height: getHeight(context) * 0.04),
                    ButtonCustom(
                      onTap: () => handleSubmit(data[index]),
                      title: 'Xem kết quả',
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Container(
            child: const Center(
              child: Text('No Data'),
            ),
          );
        }
      },
    );
  }
}
