## 1. INSTALL PADDLEOCR
### 1.1. Install PaddlePaddle
- If you have CUDA 9 or CUDA 10 installed on your machine, please run the following command to install
```python
python -m pip install paddlepaddle-gpu -i https://pypi.tuna.tsinghua.edu.cn/simple
```
- If you have no available GPU on your machine, please run the following command to install the CPU version
```python
python -m pip install paddlepaddle -i https://pypi.tuna.tsinghua.edu.cn/simple
```
### 1.2. Install PaddleOCR Whl Package
```python
pip install "paddleocr>=2.0.1" # Recommend to use version 2.0.1+
```
## 2. USE PADDLEOCR

- PaddleOCR provides a series of test images and font text, click [here](https://paddleocr.bj.bcebos.com/dygraph_v2.1/ppocr_img.zip) to download, and then switch to the corresponding directory in the terminal
### 2.1. With command
- Detection, direction classification and recognition: set the parameter `--use_gpu false` to disable the gpu device, change `./imgs_en/img_12.jpg` to your image path
```python
paddleocr --image_dir ./imgs_en/img_12.jpg --use_angle_cls true --lang en --use_gpu false
```
- Pdf file is also supported, you can infer the first few pages by using the `page_num` parameter, the default is 0, which means infer all pages:
```python
paddleocr --image_dir ./xxx.pdf --use_angle_cls true --use_gpu false --page_num 2
```
- you can change `./xxx.pdf` to your pdf path
### 2.2. With Code
- Image:

```python
def image_paddle_ocr(img_path, lang="en", font_path = ""):
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
```
- file PDF:
```python
def pdf_paddle_ocr(img_path, lang="en", page_num=2, font_path =""):
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
```
- Note:
Default value of PaddleOCR for GPU is True, you would need to disable it if you don't have GPU:
```python
ocr = PaddleOCR(use_angle_cls=True, lang='en', use_gpu=False)
``` 
If you get error `cannot import name 'PaddleOCR' from partially initialized module 'paddleocr'` you can uninstall `paddleocr>=2.0.1` and reinstall it.