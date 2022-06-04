# Backend Spring boot

* spring boot로 백엔드 개발
* web frontend 로 jsp를 사용하기 때문에 war파일로 배포

MVC
V
* web frontend 로 jsp를 사용하기 때문에 webapp폴더를 만들어 WEB-INF에 view 설정
* views 폴더에서 error 폴더는 로그인 후 접근 권한이 없을 때 보여주는 화면
* signin 폴더는 로그인 후 의사가 보는 화면
* 밖에 있는 파일은 로그인화면, 회원가입화면으로 사용됨
* css, js, img는 resources -> static에 정적 파일로 보관

#M (경로 혹시모르니 적어두겟음 src -> main -> java -> com -> example -> springboot)
* domain폴더에 DB에 정의한 Table별로 정리
* JPA라이브러리를 활용하여 각 private가 해당 Table의 colume과 일치하도록 만듬
* JPA라이브러리에 @Data를 사용하여 getter/setter 적용
* need폴더는 DB에 정의되어있지 않은 Table을 임의로 만들어 모아둔 폴더

#C
#config
* config폴더는 스프링 시큐리티의 웹 보안 기능의 초기화 및 설정들을 담당하는 내용
* 로그인과 권한에 따른 view 접속 설정
* auth에서 로그인 처리

#repository
* JPA라이브러리를 이용한 repository interface
* save(), find() 메서드가 기본적으로 내장되어 있어서 손쉽게 db접근

#controller
* appapi폴더는 flutter에서 db에 편하게 접근시키기 위해 만든 api폴더
* IndexController는 로그인 전 Controller: 로그인 회원가입 controll
* MainController는 로그인 후 child검사결과 전 Controller: child list 정렬
* ReportController는 child검사 후 Controller: 이미지 db저장, recommend 작성, 이전 검사결과 list 정렬
