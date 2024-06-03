# ItrendX
[산업구조변화대응 특화훈련] 공공데이터를 활용한 웹앱개발자 양성 과정 중 진행한 개인 프로젝트 과제입니다.

## 👨‍🏫 프로젝트 소개
[ALL-IN-ONE 이미지메이킹 플랫폼]
'이미지메이킹을 위한, 온라인 이미지 컨설팅과 샵 정보들을 제공하는 웹 서비스'를 제작했습니다.

## 주제 선정이유
### 문제
업체접근성에 있어 지역적 한계 => 업체 선택의 제한.
이미지메이킹 관련하여, 기존의 검색 도구나 플랫폼을 통한, 빠른 정보 서치 어려움.

### 기대 효과
(고객입장) 간이 컨설팅을 통한, 지역제한으로 인한 업체 선택의 한계 해결.
(업체입장) 오프라인 뿐만 아니라 온라인 서비스를 편하게 진행할 수 있는 플랫폼 마련으로 시장의 활성화.
이미지메이킹 관련 정보(헤어, 메이크업) 서치 시간 단축.

## 기획목표
이미지 메이킹이 어려운 사람들을 위한 맞춤 정보/온라인 컨설팅 제공으로 정보 서치 시간단축 및 편의성 제고


## ⏲️ 개발 기간
- 2024.02.18 ~ 2024.05.22
  - 주제 선정
  - 피그마 제작
  - erd 제작
  - 중간발표
  - 후반 보수 및 테스트 작업

## 🧑‍🤝‍🧑 개발자 소개
|오지현|
|:---:|
|<img src="https://velog.velcdn.com/images/jihyeon2434/post/1f5a526c-6d5c-410b-8aa7-64bde7e105d7/image.jpg" width="400" height="400"/>|
|ubis970420@gmail.com|

## 💻 사용기술 및 개발환경
- **개발환경** : Windows10
- **개발도구** :  Spring Tool Suite 4, Maven, SQL yog
- **개발언어 및 프레임워크** : Http, Css, Java 17, JavaScript, Jquery, Tailwind, daisyUi, SpringBoot, Selenium
- **DB** : MySQL

## 📝 프로젝트 아키텍쳐

![](https://velog.velcdn.com/images/jihyeon2434/post/429e7dcb-5e58-4ee3-8d79-8f56f5010f94/image.png)
![](https://velog.velcdn.com/images/jihyeon2434/post/159ea9db-8c0f-40c3-bab5-cef00f105f28/image.png)

## 📌 주요 기능
- 로그인 / 로그아웃
사용자는 이메일과 비밀번호를 통해 로그인할 수 있으며, 사용 후에는 로그아웃이 가능합니다.

- 회원가입
새로운 사용자는 필수 정보를 입력하여 계정을 생성할 수 있습니다.

- 커뮤니티
사용자는 커뮤니티 섹션에서 정보를 공유하고, 토론에 참여할 수 있습니다.

- 이미지메이킹 / 퍼스널 컬러 컨설팅
이 서비스는 고객의 니즈에 맞춰 개인별 이미지메이킹 및 퍼스널 컬러에 관한 맞춤형 추천을 제공합니다.

- 메이크업 / 헤어샵 추천
고객의 요구사항에 맞춰 메이크업과 헤어샵을 추천합니다. 추천은 가격, 지역, 상황 등 여러 조건을 고려하여 이루어집니다.

- 온라인 컨설팅 결제 기능
이 기능을 통해 사용자는 온라인으로 컨설팅 서비스를 예약하고 결제할 수 있습니다.

- 업체 & 고객 온라인 사진 컨설팅
업체와 고객은 사진을 통해 상호 작용하며 온라인 상에서 직접 컨설팅을 받을 수 있습니다.





## ✒️ 크롤링
크롤링 사이트 
- [네이버 지도](https://map.naver.com/p?c=15.00,0,0,0,dh)


---


## 기본 세팅 가이드라인


#### 1. 우선, git 클론을 합니다. (참고자료: https://ittrue.tistory.com/91)
![](https://velog.velcdn.com/images/jihyeon2434/post/b290f663-d106-4d24-a86e-4b2361d29f20/image.png)

![](https://velog.velcdn.com/images/jihyeon2434/post/468bb3ef-72cd-4215-8291-2b9aff7f4ed6/image.png)
예를 들어, 깃허브 계정이 Gildong이고, 가져올 저장소 이름이 Hello라 가정하면 다음과 같이 작성합니다. 


#### 2. 크롤링 환경 세팅을 위해, 아래 절차를 참고하여, 크롬 드라이버를 다운로드/설치합니다. 

1) 크롬드라이버 다운로드 사이트 접속
크롬드라이브 다운로드 주소: https://chromedriver.chromium.org/downloads

2) 본인 크롬 버전에 맞는 드라이버를 선택
*본인 크롬 버전 확인법
크롬 접속 > 더보기 > 도움말 > Chrome 버전 정보 확인

![](https://velog.velcdn.com/images/jihyeon2434/post/4a03ebb8-7769-4b75-b174-35245b216909/image.gif)


3) 이후 본인 OS 에 따라 zip 다운로드
2024.5.14 기준 124버전이 최신버전입니다.
chrome 버전 115 이상을 사용하는 경우 `the Chrome for Testing availability dashboard.`를 클릭하여 들어갑니다.  
![](https://velog.velcdn.com/images/jihyeon2434/post/651f0fa7-29a5-471c-9a50-ef8c2ec3c92c/image.png)


4) `stable` 클릭합니다. 
![](https://velog.velcdn.com/images/jihyeon2434/post/4a58f423-8166-4ac8-ba27-bd15c41870c6/image.png)


윈도우 버전에 맞는 bit를 찾아서 URL을 복사해서 주소에 넣어주면 크롬드라이버가 다운로드 됩니다. 
![](https://velog.velcdn.com/images/jihyeon2434/post/043892ba-bb05-47bd-8aef-eab84aa380c6/image.png)

5) 다운로드 파일 저장
다운로드한 파일을 압축해제한 후, chromedriver.exe 파일을 프로젝트 디렉토리에 저장합니다.
하기 그림을 참고하여 아래 경로에 세팅해주세요.
현재 세팅 경로 : “C:/work/chromedriver.exe”
![](https://velog.velcdn.com/images/jihyeon2434/post/86d8aadb-8ae2-4cb9-8c58-2afeed93c662/image.gif)


#### `chromedriver.exe 파일` 세팅경로를 현재와 다르게 하기를 원하신다면, 하기 6개의 클래스 안의 드라이버 경로를 변경해주시면 됩니다. 
-  바꾸는 법
Controller에서 아래 6개의 클래스 안의 드라이버 경로를 원하는대로 바꿔준다.
![](https://velog.velcdn.com/images/jihyeon2434/post/0747a65b-00b6-4b08-90a5-1e93ed20ee88/image.png)



#### 3. Spring부트 DB파일에 저장된 데이터 MySQL로 옮기기
![](https://velog.velcdn.com/images/jihyeon2434/post/7fc1c2f4-547b-4503-8e07-a90b6c80d2a1/image.png)
빨간 박스 표시된 DB.sql 을 복사해서 MySQL에 아래와 같이 붙이고, 전체 선택 후 `F9`를 눌러 전체 쿼리실행을 해줍니다. 
![](https://velog.velcdn.com/images/jihyeon2434/post/cf1de05a-3343-472c-ba33-65a14f82307d/image.png)


#### 4. Spring부트에서 프로그램을 실행시켜 사이트에 접속합니다.


그리고 Spring부트에서 밑의 5개의 컨트롤러에 설정되어있는 URL경로를 입력해서 크롤링을 하고, 데이터 세팅을 해줍니다.

- 컨설팅
  - 이미지컨설팅 크롤링주소 : usr/consulting/crawl
  - 퍼스널컬러 크롤링주소 : usr/consulting/crawl2
  - 면접학원 크롤링주소 : usr/consulting/crawl3
- 셀프
  - 헤어샵 크롤링주소 : usr/competition/crawl
  - 메이크업샵 크롤링주소 : usr/competition/crawl2

---

## ✒️ 주요 기능 설명
### [메인 페이지]

![](https://velog.velcdn.com/images/jihyeon2434/post/3a08d8bf-e265-4eea-bda8-cb06b55f415c/image.png)


ITrendX 메인페이지 입니다. 상단 좌측 `컨설팅` 우측 `셀프` 테마를 통해 관련 샵 정보를 제공하는 페이지로 이동할 수 있습니다. 하단에는 `LATEST IN TRENDS`라는 보그코리아에서 크롤링 해온 최신 뷰티, 패션 섹션의 기사를 확인할 수 있습니다. 

### [컨설팅 목록 페이지]

![](https://velog.velcdn.com/images/jihyeon2434/post/24a00cf0-e8f1-4b88-918b-2ed5c4bc3837/image.gif)
컨설팅 샵 목록 페이지 상단부분 입니다.상단에서는 좌측의 서치 박스를 통해 고객 니즈 맞춤 샵 정보를 제공합니다. 

활용 시나리오는 아래와 같습니다. 
- 좌측의 지역, 가격, 상황을 선택하면 우측의 박스 부분에 추천 샵들이 필터에 따라 리스트업 된다. 


![](https://velog.velcdn.com/images/jihyeon2434/post/28f62099-67db-43fe-997e-7c6c6f57ff33/image.gif)


컨설팅 샵 목록 페이지 하단 부분입니다. 하단에서는 많은 고객이 선택한 정보를 바탕으로 추천 샵을 리스트화 해두었습니다 .
활용시나리오는 아래와 같습니다. 
- 상단의 키워드 박스에서 원하는 옵션(`별점이 높은` / `가장 저렴한`, `이미지메이킹`/ `퍼스널컬러`)을 클릭하면, 옵션 맞춤별로 샵 정보가 리스트업 된다. 


### [셀프 목록 페이지]

![](https://velog.velcdn.com/images/jihyeon2434/post/a6fa8a01-713e-46b8-b737-962a9d066fa3/image.png)

셀프 샵 목록 페이지 상단부분 입니다. 활용 시나리오는 컨설팅 테마 목록페이지의 상단 부분과 동일합니다.   

![](https://velog.velcdn.com/images/jihyeon2434/post/26edab8d-1556-4f6a-8e23-c4667b73c22d/image.png)

셀프 샵 목록 페이지 하단부분 입니다. 활용 시나리오는 컨설팅 테마 목록페이지의 하단 부분과 동일합니다. 


### [로그인 페이지]
![](https://velog.velcdn.com/images/jihyeon2434/post/1cfb9684-6463-47f8-a787-4bab59fbd2b1/image.png)

로그인 페이지입니다. ID와 PW를 쳐서 로그인할 수 있습니다.



### [회원가입 페이지]
![](https://velog.velcdn.com/images/jihyeon2434/post/e1acbd98-a64b-450d-92fb-4ab5adc02cee/image.png)

![](https://velog.velcdn.com/images/jihyeon2434/post/31b39a7f-6247-4e37-aaf3-2f6bf0e374ca/image.png)

#### 중복 체크
![](https://velog.velcdn.com/images/jihyeon2434/post/d6215be0-e42e-43b6-87ab-7e3934747f7b/image.png)

![](https://velog.velcdn.com/images/jihyeon2434/post/6ca51efd-c1b0-4b67-9170-67cfbd065bd8/image.png)


회원가입 페이지입니다. 입력창마다 해당하는 정보를 입력하여 회원가입 할 수 있습니다. `비밀번호, 이메일 유효성 체크`를 하며, 공백란만 둘 경우는 막고 있습니다. 
회원종류의 종류는 2가지(`업체`/`고객`)이며, 업체로 가입할 경우에는 업체명이 필요하기 때문에`업체`를 선택하면, 업체명 입력칸이 활성화 되고, `고객`을 선택하면 업체명 입력칸이 비활성화 됩니다 .


### [회원정보 페이지]
![](https://velog.velcdn.com/images/jihyeon2434/post/435ece4a-5b83-4d62-8089-4ca7eb305681/image.png)

회원정보 페이지입니다. 가입한 내용의 회원정보를 확인 할 수 있습니다. 비밀번호 `변경하기`를 눌러 비밀번호 변경을 할 수 있습니다. `탈퇴` 버튼을 눌러 회원 탈퇴를 할 수 있습니다. 

### [컨설팅 샵 상세페이지]
#### - 정보
![](https://velog.velcdn.com/images/jihyeon2434/post/1cc46920-1302-4daa-acb7-52c76b92bc61/image.png)
#### - 포트폴리오 
![](https://velog.velcdn.com/images/jihyeon2434/post/d764b092-0d84-48ba-aaf9-f80350b8b560/image.png)
컨설팅 샵 상세페이지 입니다. 
정보 / 포트폴리오 / 후기 부분 선택해서 정보를 보거나 후기를 작성할 수 있습니다. 또한, `관심` 버튼으로 내 즐겨찾기 샵으로 등록 가능하고, `온라인 컨설팅 신청`으로 컨설팅 신청 가능합니다. 


### [내 즐겨찾기 목록 페이지]
![](https://velog.velcdn.com/images/jihyeon2434/post/a39e34ed-a2f0-4482-a762-a653cf5bb51c/image.png)
![](https://velog.velcdn.com/images/jihyeon2434/post/80af5884-1ae3-4bd1-b9f5-781b6790aba6/image.png)
내 즐겨찾기 목록 페이지입니다. 내가 관심 등록한 컨설팅/셀프 샵 목록을 볼 수 있습니다. 

### [온라인 컨설팅 신청 페이지]
#### 온라인 컨설팅 신청 과정(1)
![](https://velog.velcdn.com/images/jihyeon2434/post/ad6c01c3-ea84-4a59-a6f4-97d53ea03385/image.png)

#### 온라인 컨설팅 신청 과정(2)
![](https://velog.velcdn.com/images/jihyeon2434/post/652ecf53-706c-4794-8133-22a1147b7905/image.png)


`온라인 컨설팅 신청` 버튼을 타고 들어가면, 답변을 받고 싶은 날짜와 상품 옵션을 선택할 수 있습니다. 
이후, 예약하기 버튼을 누르면, 다음페이지(2)에 선택한 옵션이 세팅되어 있어 결제 전 예약 정보를 확인할 수 있습니다. 


#### 결제 페이지 (1)
![](https://velog.velcdn.com/images/jihyeon2434/post/ef3493f8-e9c2-4b52-8bd4-ea61e599c4ec/image.png)

#### 결제 페이지(2)
![](https://velog.velcdn.com/images/jihyeon2434/post/d9f321e6-f7f3-4e1f-8d75-56caab8d1624/image.png)

#### 결제 완료 후 <고객_온라인 컨설팅 예약내역> 페이지

![](https://velog.velcdn.com/images/jihyeon2434/post/80b21f51-b5f6-455a-8959-aa152ee86aab/image.png)





결제 페이지를 통해 결제를 완료하면, 온라인 컨설팅 예약 내역 페이지에 결제 및 예약 정보가 세팅되고, `상담글 작성`이라는 버튼을 나타납니다. 
버튼을 통해 상담글 작성이 바로 가능합니다. 

![](https://velog.velcdn.com/images/jihyeon2434/post/4c111ffc-08e9-4d07-a3f3-20b862bf9c0b/image.png)

### [고객이 작성한 온라인컨설팅 게시글]
![](https://velog.velcdn.com/images/jihyeon2434/post/71136782-7d39-4d2d-ba1e-96bac2d860b7/image.png)

#### 고객이 선택 업체에 상담글을 작성했을때, <업체_ 마이페이지 _ 온라인 컨설팅 예약 내역>
![](https://velog.velcdn.com/images/jihyeon2434/post/b9c3bd8f-54fc-4026-8f53-daf5650ab640/image.png)



### [리뷰 작성 페이지]

![](https://velog.velcdn.com/images/jihyeon2434/post/5d3a5970-8730-4c18-a72a-142528e95247/image.png)
`글쓰기` 버튼을 통해, 리뷰 작성이 가능합니다. 로그인 후 사용가능합니다. 

![](https://velog.velcdn.com/images/jihyeon2434/post/a24f9806-dcf4-49b0-a666-ab107d9f011a/image.png)

![](https://velog.velcdn.com/images/jihyeon2434/post/5635fb03-e4ff-4c38-8f5c-21a86e3960f7/image.png)
![](https://velog.velcdn.com/images/jihyeon2434/post/2493ad3a-8302-4045-9b6b-61da36685063/image.png)


후기를 작성하면, 위와 같이 작성 리뷰가 리뷰 목록에 나타납니다. 

---

## ✒️ 개발 기술서
https://docs.google.com/document/d/1JxA1M7nO5WoffhdVCcCNmbULy7IDezuo8V01bxH_8qI/edit


