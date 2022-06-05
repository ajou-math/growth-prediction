# -*- coding: utf-8 -*-

import scipy
from flask import Flask, jsonify #간단히 플라스크 서버를 만든다
import urllib.request

import tensorflow as tf
import pandas as pd #이미지 불러오기
from tensorflow.keras.preprocessing.image import ImageDataGenerator
import keras
import numpy as np

#개월->년
def changeYear(ARR) :
  NewARR = []
  for num in ARR :  
    year = num / 12
    remainder = year % 1
    
    if remainder <= 0.25 :
      remainder = 0
      NewARR.append(int(year) + remainder)
    elif remainder <= 0.75 :
      remainder = 0.5
      NewARR.append(int(year) + remainder)
    else :
      remainder = 1
      NewARR.append(int(year) + remainder)
  return NewARR

#성인예측키
def Height_prediction ( male, BA, current_H) :
    import pandas as pd
    lms_df = pd.read_csv('2017_growth.csv', encoding = "utf-8")

    month_age = np.round(BA * 12)
    if male == True:
        lms_index = month_age                                              
        L_18, M_18, S_18 = lms_df.iloc[226,3], lms_df.iloc[226,4], lms_df.iloc[226,5]
    elif male == False:
        lms_index = month_age 
        L_18, M_18, S_18 = lms_df.iloc[454,3], lms_df.iloc[454,4], lms_df.iloc[454,5]

    L,M,S = lms_df.iloc[lms_index,3], lms_df.iloc[lms_index,4],lms_df.iloc[lms_index,5]
    x = current_H
    
    Z = (((x/M)**L)-1)/(L*S)
    Z = round(Z,4)

    pred_height = M_18 * (1 + (L_18 * S_18 * Z)) ** (1 / L_18)
    pred_height = round(pred_height, 1)
    return pred_height

app = Flask(__name__)

import base64
import pymysql
import io
import PIL.Image as Image

@app.route('/')
def home():
    return 'home'

@app.route('/tospring/<string:filename>/<string:male>/<string:height>')
def spring(filename, male, height):

    conn = pymysql.connect(host="growthprediction.c2gjats5bppi.ap-northeast-2.rds.amazonaws.com", user="root", password="choibecode21!",port=3306, db="growthprediction", charset="utf8")
    curs = conn.cursor()
    sql = "select * from image where filename=%s"
    curs.execute(sql, filename)
    rows = curs.fetchall()
    imgbytes = base64.decodebytes(rows[0][1])
    print(rows[0][1])
    img = Image.open(io.BytesIO(imgbytes))
    #img.show()
    img.save('image/'+filename)

    print(img.size)
    print(img.height)
    print(img.width)
    print(img.format)
    print(img.mode)

    conn.close()

    #type변환
    if male == 'True' :
      male = True
    else :
      male = False
    height = float(height)

    #환자정보 csv파일 저장
    information = {'id' : filename,
                   'height' : height,
                   'male' : male
                   }
    
    info_df = pd.DataFrame(information, index=[0])
    info_df.to_csv("./information.csv")

    csv_test=pd.read_csv('./information.csv')

    for i in range(len(csv_test['id'])) :
      csv_test.loc[i,"id"] = f"{csv_test['id'][i]}"

    if csv_test['male'].bool() == True:
      test_df = csv_test.loc[csv_test.male == True]
    elif csv_test['male'].bool() == False:
      test_df = csv_test.loc[csv_test.male == False]

    testDatagen = ImageDataGenerator(rescale=1./255, validation_split=0.1)
    test_generator = testDatagen.flow_from_dataframe(test_df, directory='./image', 
                                                      x_col='id', y_col = 'male',#='boneage',
                                                      target_size=(224,224), color_mode='grayscale',
                                                      class_mode='raw',
                                                     validate_filenames=False
                                                     ) 
    
    # 모델 불러오기
    if csv_test['male'].bool() == True:
      load_model = tf.keras.models.load_model("./check_point_m", custom_objects=None, compile=True, options=None)
    elif csv_test['male'].bool() == False:
      load_model = tf.keras.models.load_model("./check_point_f", custom_objects=None, compile=True, options=None)
    predict = load_model.predict_generator(test_generator).flatten()
    predict_year = changeYear(predict)

  
    #성인예측키
    predict_height = Height_prediction ( male, predict_year[0], height )
    
    return jsonify(BA = predict_year[0], PH = predict_height)


    
if __name__ == '__main__':
    app.run(debug=False,host="0.0.0.0",port=5000)

