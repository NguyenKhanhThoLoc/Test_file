import 'package:first_app/apps/utils/const.dart';
import 'package:first_app/models/question_model.dart';
import 'package:first_app/pages/article/widgets/article_yotube.dart';
import 'package:flutter/material.dart';

Future<void> showModal(context, String valueInput, Question data) =>
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.8,
        child: Container(
          width: getWidth(context),
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                20,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    (valueInput == data.answer)
                        ? successAnswer(valueInput)
                        : errorAnswer(valueInput, data.answer),
                    SizedBox(height: getHeight(context) * 0.02),
                    data.youtube_id_result!.isNotEmpty ||
                            data.youtube_id_result == null
                        ? RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(text: 'Bạn xem thêm video giải đáp  '),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(height: getHeight(context) * 0.02),
                    data.youtube_id_result!.isNotEmpty ||
                            data.youtube_id_result == null
                        ? Expanded(
                            child: ArticleYoutube(id: data.youtube_id_result))
                        : const SizedBox()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

RichText errorAnswer(String valueInput, answer) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      children: [
        const TextSpan(text: 'Đáp án '),
        TextSpan(
            text: valueInput,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 22,
            )),
        const TextSpan(text: ' của bạn chưa chính xác! Đáp án đúng là: '),
        TextSpan(
            text: answer.toString(),
            style: const TextStyle(
              color: Colors.green,
              fontSize: 22,
            )),
      ],
    ),
  );
}

RichText successAnswer(String valueInput) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      children: [
        const TextSpan(text: 'Đáp án '),
        TextSpan(
            text: valueInput,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 22,
            )),
        const TextSpan(text: ' của bạn  chính xác!'),
      ],
    ),
  );
}
