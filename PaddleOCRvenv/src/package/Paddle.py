from paddleocr import PaddleOCR, draw_ocr
from PIL import Image
import matplotlib.pyplot as plt
import fitz
import cv2
import numpy as np



def image_paddle_ocr(img_path, lang="en", font_path = ""):
  """
  Thực hiện OCR trên ảnh và hiển thị kết quả với bounding box.

  Args:
      img_path (str): Đường dẫn đến ảnh.
      lang (str, optional): Ngôn ngữ cho OCR. Mặc định là 'en' (tiếng Anh).
  """

  # Khởi tạo PaddleOCR (chỉ cần chạy một lần)
  ocr = PaddleOCR(use_angle_cls=True, lang=lang)

  # Nhận dạng ký tự
  result = ocr.ocr(img_path, cls=True)
  result = result[0]

  # Xử lý kết quả
  image = Image.open(img_path).convert('RGB')
  boxes = [line[0] for line in result]
  txts = [line[1][0] for line in result]
  scores = [line[1][1] for line in result]

  # Vẽ bounding box và text lên ảnh
  im_show = draw_ocr(image, boxes, txts, scores=scores, font_path=font_path)
  im_show = Image.fromarray(im_show)

  # Hiển thị ảnh với kết quả OCR
  plt.figure()
  plt.imshow(im_show)
  plt.show()

def pdf_paddle_ocr(img_path, lang="en", page_num=2, font_path =""):
  """
  Performs OCR on a PDF document, processes each page, and saves results.

  Args:
      img_path (str): Path to the PDF document.
      lang (str, optional): Language for OCR. 
      page_num (int, optional): Number of pages to process (default: 2).

  Returns:
      None
  """

  # Initialize PaddleOCR engine
  ocr = PaddleOCR(use_angle_cls=True, lang=lang, page_num=page_num)
  # Process each page
  imgs = []
  with fitz.open(img_path) as pdf:
    for pg in range(0, pdf.page_count):
      page = pdf[pg]
      mat = fitz.Matrix(2, 2)
      pm = page.get_pixmap(matrix=mat, alpha=False)

      # Downscale large images for efficiency
      if pm.width > 2000 or pm.height > 2000:
        pm = page.get_pixmap(matrix=fitz.Matrix(1, 1), alpha=False)

      img = Image.frombytes("RGB", [pm.width, pm.height], pm.samples)
      img = cv2.cvtColor(np.array(img), cv2.COLOR_RGB2BGR)
      imgs.append(img)

  result = ocr.ocr(img_path, cls=True)
  for idx in range(len(result)):
    res = result[idx]
    for line in res:
        print(line)  
  for idx in range(len(result)):
    res = result[idx]
    image = imgs[idx]
    boxes = [line[0] for line in res]
    txts = [line[1][0] for line in res]
    scores = [line[1][1] for line in res]
    im_show = draw_ocr(image, boxes, txts, scores, font_path=font_path)
    im_show = Image.fromarray(im_show)
    im_show.save('result_page_{}.jpg'.format(idx))

    