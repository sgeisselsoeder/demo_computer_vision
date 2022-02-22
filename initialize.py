# TODO: download yolo model if not available
# https://github.com/OlafenwaMoses/ImageAI/releases/tag/1.0/

import requests
url = 'https://github.com/OlafenwaMoses/ImageAI/releases/download/1.0/yolo.h5'
r = requests.get(url, allow_redirects=True)
open('./models/yolo.h5', 'wb').write(r.content)