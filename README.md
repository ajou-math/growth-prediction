# project name : growth-prediction

* current version : 4.28

#
* 디렉토리 설명

* src : 주요 코드가 들어가있는 디렉토리, 이 디렉토리 내부에서 분야별로 서브디렉토리를 만들어서 활용하면 됨

* image : 공통으로 공유할 이미지 로고 등


#

#
* 디렉토리 사용방법

* 이 레파지토리를 fetch하여 본인의 git에 가져온다

* 본인의 git에서 로컬로 clone하여 작업한다

* issue단위로 개발완성시 fetch한 본인의 git에 commit한다(선택사항) 그리고 이 레파지토리에 pull request를 날린다

* pull request 메시지는 최대한 자세하게 적어야 팀원들이 잘 알아볼 수 있음

* master 브랜치에 commit할때는 commit 메시지는 commit하는 내용을 알아볼 수 있는 간략한 메시지를 지향하며 팀원들의 코드리뷰가 끝난 후 모두가 accept을 눌러서 commit해야함(매우중요!!)
#

#
* git branch는 git flow에 맞춰서 사용할것 

* master : 제품으로 출시될 수 있는 브랜치
* develop : 다음 출시 버전을 개발하는 브랜치
* feature : 기능을 개발하는 브랜치
* release : 이번 출시 버전을 준비하는 브랜치
* hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치

* ex)
* 어플에서 로그인 기능을 추가하는 branch명은 "feature/login" 이여야 함
* release/ver1 --> ver1을 출시할 예정임 이게 코드리뷰, 검토가 끝나면 master브랜치로 merage되는것임
* develop/ver2 --> "feature/" 브랜치들이 합쳐져서 다음 출시 버전을 개발하는 브랜치

#

#
* version 4.11_기웅

* first version

* 현재 각 디렉토리에 empty파일을 commit을 위해 만들어놨음(빈폴더는 commit이 안되서) 나중에 사용할때 empty파일 삭제하고 사용할것

* README파일 업데이트때마다 이 위에 (업데이트날짜\_이름) 형식으로 적어서 업데이트 내용을 간략하게 적기

#

#
* version 4.28_기웅

* second version

* git flow 추가
#
