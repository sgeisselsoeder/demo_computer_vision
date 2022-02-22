import requests
import os.path

print("Don't forget to:")
print("python3 -m venv .venvthis ")
print("source .venvthis/bin/activate")
print("pip install -r requirements.txt")

yolo_model_file = './models/yolo.h5'
if not os.path.isfile(yolo_model_file):
    print("Downloading model file. This may take a while.")
    url = 'https://github.com/OlafenwaMoses/ImageAI/releases/download/1.0/yolo.h5'
    r = requests.get(url, allow_redirects=True)
    open(yolo_model_file, 'wb').write(r.content)
else:
    print("Yolo model file already found at " + str(yolo_model_file))
