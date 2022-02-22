# example modified from https://towardsdatascience.com/how-to-detect-objects-with-your-webcam-82693c47bd8

from imageai import Detection
import cv2

yolo = Detection.ObjectDetection()

modelpath = "./models/yolo.h5"

yolo.setModelTypeAsYOLOv3()
yolo.setModelPath(modelpath)
yolo.loadModel()

cam = cv2.VideoCapture(0)  # 0=front-cam, 1=back-cam
cam.set(cv2.CAP_PROP_FRAME_WIDTH, 1300)
cam.set(cv2.CAP_PROP_FRAME_HEIGHT, 1500)

while True:  # read frames
    ret, img = cam.read()  # predict yolo
    img, preds = yolo.detectCustomObjectsFromImage(input_image=img,
                                                   custom_objects=None, input_type="array",
                                                   output_type="array",
                                                   minimum_percentage_probability=70,
                                                   display_percentage_probability=False,
                                                   display_object_name=True)  # display predictions
    cv2.imshow("", img)  # press q or Esc to quit
    if (cv2.waitKey(1) & 0xFF == ord("q")) or (cv2.waitKey(1) == 27):
        break  # close camera

cam.release()
cv2.destroyAllWindows()
