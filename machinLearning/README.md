# Prediction_boneageModel

### 개발자
* 조우연 qt5828@ajou.ac.kr
* 최아림 chldkfla@ajou.ac.kr

### Boneage Prediction Model using MachineLearning

1. 학습데이터 구축

  - 학습데이터 
    RSNA(북미영상의학회) bone-age dataset으로 0-18세 수골 x-ray

    < Total data > 
      - Male : 6833
      - Female : 5778

    < train set >
      - Male
        80% of total male
      - Female
        80% of total female

    < validation set >
      - Male
        20% of total male
      - Female
        20% of total female

    < test set >
      - Male : 324
      - Female : 289


2. 데이터 기계학습 및 모델링

  - 수골의료영상을 이용한 골연령의 분류에 대한 성능평가를 위해 Inception V3 딥러닝 모델 사용
  - GP(Greulich-Pyle)기법을 통한 골연령 측정방법 사용
  - 0.5년 단위로 classification 하는 분류모델 생성

    < 모델 선정 >
      - Keras callback 함수를 활용하여 남/녀 모델 각각 validation loss가 최소가 되는 check point 선정
      - Validation loss(Mae) of male : 1.1414(year)
      - Validation loss(Mae) of female : 1.2567(year)
      - Train Epochs of male : 76 of 86 epochs
      - Train Epochs of female : 69 of 79 epochs

    < 모델 성능분석 >
      - 남/녀 수골 x-ray이미지 각각 324, 289장의 test set을 활용하여 테스트 수행 및 MAE계산
      - Test MAE of male : 3.6543 (year)
      - Test MAE of female : 3.3269 (year)


3. 성인예측키 측정

  - 예측된 골연령과 현재키, 성별을 활용하여 성인예측키를 계산
  - 질병관리청에서 제공된 “2017_소아 청소년 성장도표”를 활용하여 18세 기준 예상 신장을 도출하였으며, 성인예측키 계산 공식은 수정된 L,M,S 공식을 활용함 
    ( L : Box-cox-power, M : Median, S :Coefficient of Variation )
  - L,M,X의 값은 2017 소아 청소년 성장도표에 포함되어 있으며, L,M,S값으로 평균정규분포(Z)를 구하고, 18세 기준 L,M,S값과 평균정규분포(Z)로 검사자의 18세 예측 신장값을 도출
