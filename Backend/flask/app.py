# Welcome to A7 Flask Backend Server
import glob, os, sys
print("🌐📁🅰️7⃣️👨‍💻️🤖 A7 Flask Server running !")
print("Now running server on directory: ", os.getcwd())
# print(sys.path)

from flask import Flask, request, jsonify
from flask_restful import Resource, Api
from flask_cors import CORS
from PIL import Image
import base64
from io import BytesIO
import torch
from datetime import datetime

model_file = "Backend/flask/Models/yolov5/weights/yasin_ds7_27042021.pt"
model = torch.hub.load('ultralytics/yolov5', 'custom', path_or_model=model_file)

app = Flask(__name__)
app.config["DEBUG"] = True
api = Api(app)
CORS(app)

save_location = "Backend/flask/data/"

# ////////////////////// main page ///////////////////////////
@app.route('/', methods=['GET'])
def home():
    message = "<h1>A7 Server</h1><p>Welcome to A7 Backend OCR Server.\
                Please send a POST request with your image to /urdu_ocr for results.</p>"
    return message
# ////////////////////// check server ////////////////////////
@app.route('/ping', methods=['GET'])
def ping():
    dateTimeObj = datetime.now()
    timestampStr = dateTimeObj.strftime("%d-%b-%Y (%H:%M:%S.%f)")
    message = "Hi ! Server is running at: {}".format(timestampStr)
    app.logger.info("A7 Flask Server was pinged for diags !")
    return message
# ////////////////////// im_size API ////////////////////////
@app.route("/im_size", methods=["POST"])
def process_image():
    print("Recieved JSON data as bytes in HTTP post request")
    data = request.get_json()
    b64enc_img = data['image']
    req_type = data['type'] # incase of filenames
    print("Request type: ", req_type)
    img = Image.open(BytesIO(base64.b64decode(b64enc_img)))
    img = img.convert('RGB')
    img.save(save_location+'im-received.jpg')
    return jsonify({'msg': 'Server Recieved the Image'})
# /////////////////////////////////////////////////////
@app.route("/api/data")
def get_data():
    return app.send_static_file("data.json")
# /////////////////////////////////////////////////////
@app.route("/urdu_ocr", methods=["POST"])
def urdu_ocr():
    print("Recieved JSON data as bytes in HTTP post request")
    data = request.get_json()
    b64enc_img = data['image']
    req_type = data['type'] # incase of filenames
    print("Request type: ", req_type)
    img = Image.open(BytesIO(base64.b64decode(b64enc_img)))
    img = img.convert('RGB')
    # some mumbo jumbo because yolo overwrites main file
    org_file_path = save_location+'original.jpg'
    img.save(org_file_path)
    pred_file_path = save_location+'prediction.jpg'
    img.save(pred_file_path)
    result = model(pred_file_path)
    result.save(save_location)
    result = result.pandas().xyxy[0]
    rtl_df = result.sort_values(by=['xmax'], ascending=False)
    word = rtl_df["name"].tolist()
    print("Found characters from RTL:")
    print(word)
    word = "".join(word)
    print("Combining Word as:")
    print(word)
    return jsonify({'results': word, 'status': 'ocr complete ! 🕺'})

app.logger.info("A7 Flask Server Loading complete !")

if __name__ == '__app__':
    app.run(debug=True)