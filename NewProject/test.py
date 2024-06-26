from TextSumarization import TextRankSummarizer


summarizer = TextRankSummarizer(max_sentences=3)
text = """ Với hành vi vi phạm hành chính trong lĩnh vực chứng khoán và thị trường chứng khoán, Hoàng Anh Gia Lai của bầu Đức đã bị xử phạt 60 triệu đồng.
Ngày 3/2, Thanh tra Uỷ ban Chứng khoán Nhà nước (UBCKNN) cho biết cơ quan này vừa ban hành quyết định xử phạt hành chính đối với Công ty cổ phần Hoàng Anh Gia Lai (HAGL), số tiền xử phạt là 60 triệu đồng.
Công ty của ông Đoàn Nguyên Đức (bầu Đức) bị xử phạt vì công bố thông tin không đúng thời hạn theo quy định trên trang thông tin điện tử của Sở giao dịch Chứng khoán TP.HCM và trên phương tiện công bố thông tin của UBCKNN.
Cụ thể, Hoàng Anh Gia Lai đã công bố thông tin không đúng thời hạn với các tài liệu như báo cáo tài chính (BCTC) riêng và hợp nhất quý IV/2015; BCTC riêng và hợp nhất năm 2015 kiểm toán; báo cáo thường niên năm 2015; BCTC riêng và hợp nhất quý I, quý II và quý IV/2016; giải trình kết quả kinh doanh trên BCTC riêng và hợp nhất quý II/2016…
Trước đó, cả hai doanh nghiệp cảu bầu Đức là Hoành Anh Gia Lai và Hoàng Anh Gia Lai Agrico đều được UBCKNN chấp thuận việc hoãn công bố thông tin BCTC quý và bán niên trong năm 2018. Lý do được doanh nghiệp này đưa ra là có nhiều công ty con, liên kết ở nước ngoài.
Cả Hoàng Anh Gia Lai và Hoàng Anh Gia Lai Agrico được chấp thuận việc chậm công bố BCTC quý và BCTC soát xét quý (nếu có) trong thời hạn 30 ngày kể từ ngày kết thúc quý, nhưng không quá 5 ngày kể từ ngày đơn vị kiểm toán ký báo cáo soát xét BCTC.
Đối với BCTC bán niên đã được soát xét trong năm 2018, công ty phải công bố trong vòng 60 ngày kể từ ngày kết thúc quý II/2018.
Như vậy, thay vì phải công bố thông tin tài chính hàng quý trong vòng 20 ngày kể từ ngày kết thúc quý, hai công ty của bầu Đức sẽ được gia hạn công bố thông tin chậm nhất là 30 ngày.
Đối với BCTC bán niên soát xét được phép công bố chậm nhất là 60 ngày kể từ ngày kết thúc quý II, thay vì 45 ngày như quy định.
Hoàng Anh Gia Lai cũng vừa công bố BCTC hợp nhất quý IV/2017 với nhiều thông tin khả quan. Đáng chú ý là lợi nhuận gộp đã tăng gấp 2,5 lần (tăng 91% kế hoạch), đạt 1.850 tỷ đồng.
Doanh thu của doanh nghiệp năm 2017 tăng ở một số mảng như trái cây đạt hơn 1.650 tỷ đồng, dịch vụ cho thuê là 792 tỷ đồng (năm 2016 đạt hơn 460 tỷ), mủ cao su hơn 419 tỷ (năm 2016 đạt hơn 114 tỷ)... Kết thúc năm 2017, HAGL ghi nhận 1.032 tỷ đồng lợi nhuận sau thuế. Một năm trước đó, tập đoàn này lỗ tới 2.182 tỷ đồng.
Ngoài điểm sáng về lợi nhuận, tình hình nợ vay của doanh nghiệp bầu Đức cũng chuyển biến rất tích cực. Tính đến hết ngày 31/12/2017, tổng nợ vay (cả ngắn hạn và dài hạn) của tập đoàn này ở mức 22.819 tỷ đồng, giảm 4.517 tỷ đồng sau một năm. """
summary = summarizer.summarize(text)
print(summary)