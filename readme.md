# SeulMeal 🍽
>🙋🏻‍♀️Welcome to Customizing Meal-kit Mall  
You can choose the ingredients of the meal-kit  
If you want to exclude ingredients, you can exclude them, and you can add if you want 🍗🥦🌶🍆   
Give it a try !  

## 로고

<img width="200px" height="200px" src="https://user-images.githubusercontent.com/92348108/175930241-fe189438-5f30-4b3c-a715-39b775ebc6ca.jpeg" />

- SeulMeal -ver 0.0.1
- 프로젝트 기간 : 2022-05-04 ~ 2022-07-01 (분석설계 4주 / 구현 4주 / 문서작업 1주)
- [🍕🍽 www.seulmeal.shop <-- Click!](http://www.seulmeal.shop/)

<p align="center">
    <img src="https://img.shields.io/badge/-Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-Spring-006600?style=for-the-badge&logo=Spring&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-Spring Security-6DB33F?style=for-the-badge&logo=Spring Security&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white"> &nbsp
    <img src="https://img.shields.io/badge/-Amazon AWS-885630?style=for-the-badge&logo=AmazonAWS&logoColor=white"/> &nbsp
    <img src="https://img.shields.io/badge/-Amazon EC2-FF9900?style=for-the-badge&logo=Amazon EC2&logoColor=white"> &nbsp
</p>

<hr />

## 프로젝트 설명

**커스텀 밀키트를 위한 웹앱**!! <br/>
먹고 싶은 음식은 많고, 약은 적고!!  
좋아하는 재료는 항상 적은 '밀키트'  
우리들은 사용자의 니즈에 맞게 음식을 **커스텀하여 원하는 밀키트**를 만들 수 있는 것을 생각했습니다.<br/>
고객들은 원하는 재료를 **추가**✔하거나 **제외**✔하고 원하는 **재료양**✔도 조절이 가능한 커스텀 밀키트<br/>
**슬밀**을 맛있게 즐겨 보세요

<hr />

## Team Role

공통

> - 메인 서버설정, 화면 구성, 배포
> - DB 설계 및 구축
> - 분석 & 설계

표정문

> - 메인, 관리자 페이지
> - 운영 관리

천수병

> - 커뮤니티 관리

김태희

> - 상품 커스터마이징 옵션
> - 구매 관리

김민혜

> - 유저 관리

임정철

> - 상품 관리

<hr />

## 특징

- 상품을 유저가 원하는 대로 커스텀이 가능
- 유저의 취향에 맞는 상품을 메인에서 디스플레이
- 관리자가 통계를 확인 할 수 있음

<hr />

## Package

사용한 패키지

**Front**

- chart.js : 관리자 차트 입력도구
- summerNote.js : 상세내용 입력 도구
- jquery.js : javascript 라이브러리
- ajax.js : 서버와 rest 통신 하는 도구
- slick.js : 슬라이드이미지 도구
- bootStrap.js : css를 위한 도구

**Backend**

- spring : 서버 개발 프레임 워크
- springBoot : spring프레임 워크를 좀더 사용하기 쉽게 도와주는 도구
- srpingSecurity : 애플리케이션의 보안(인증과 권한, 인가 등)을 담당하는 스프링 하위 프레임워크
- tomcat : WAS 실행
- websocket : 챗봇 통신을 위한 도구
- lombok : 반복작업을 줄여주는 도구
- aop : 관점지향프로그래밍 도구
- JavaMail : 자바 메일을 위한 도구

**API**

- Kakao Login : 카카오 소셜 로그인
- Naver Login : 네이버 소셜 로그인
- Kakao Link : 카카오 링크
- Naver Sens : 네이버 문자
- Naver Clova ChatBot : 챗봇
- IMPORT : 결제를 위한 도구
- GoogleTranslate : 사이트 번역을 위한 도구
- Daum address : 주소찾기

**Server 배포**
- AWS EC2 : Was 위치
- AWS Route 53 : DNS
- cafe24 : 도메인 구매

```
dependencies: {
    implementation 'org.springframework.boot:spring-boot-starter-mail'
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.springframework.boot:spring-boot-starter-websocket'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.2.2'
	implementation 'org.bgee.log4jdbc-log4j2:log4jdbc-log4j2-jdbc4:1.16'

	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.oracle.database.jdbc:ojdbc8'
	annotationProcessor 'org.projectlombok:lombok'
	providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	
	implementation 'org.springframework.boot:spring-boot-starter-security'
	implementation group: 'org.springframework.security', name: 'spring-security-taglibs', version: '5.5.0'
	
	implementation group: 'com.oracle.database.security', name: 'osdt_cert', version: '21.3.0.0'
	implementation group: 'com.oracle.database.security', name: 'oraclepki', version: '21.3.0.0'
	implementation group: 'com.oracle.database.security', name: 'osdt_core', version: '21.3.0.0'

	implementation 'org.springframework.boot:spring-boot-starter'
	implementation group: 'javax.servlet', name: 'jstl', version: '1.2'
	implementation "org.apache.tomcat.embed:tomcat-embed-jasper"
		
	implementation 'org.springframework.boot:spring-boot-starter-aop'	
	implementation group: 'com.google.code.gson', name: 'gson', version: '2.7'
  }
```

<hr />

## Architecture

<img src="https://user-images.githubusercontent.com/92348108/175926488-9c3cabba-8237-4e1e-a77d-b604ae0e059d.png" />

<hr />

## DB ERD

<img src="https://user-images.githubusercontent.com/92348108/175930048-a6c56bdf-db11-4f1a-bb1d-aec3def8ec2e.PNG" />

- 검은색은 구현 한것

<hr />

## 배포

- AWS EC2 - Server 호스팅
- OracleCloud - oracle 클라우드 호스팅 서비스
- Tomcat - Was

<hr />

## 사용된 도구

- [Srping](https://spring.io/) - 서버 프레임
- [SpringBoot](https://spring.io/projects/spring-boot) - 서버 프레임
- [Gradle](https://gradle.org/) - 빌드툴
- [OracleCloude](https://www.oracle.com/kr/cloud/) - Sql DataBase
- [Tomcat](https://tomcat.apache.org/) - 서버용 Was
- [AWS](https://aws.amazon.com/ko/free/?trk=fa2d6ba3-df80-4d24-a453-bf30ad163af9&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Core-Main|Core|KR|KR|Text&ef_id=CjwKCAiAtouOBhA6EiwA2nLKH3yewzaFlNVOE3uV7M2uIgGP-lZzRaHZgO2CN5cgIw6yDqIvmcBBrRoC1egQAvD_BwE:G:s&s_kwcid=AL!4422!3!563761819834!e!!g!!aws&ef_id=CjwKCAiAtouOBhA6EiwA2nLKH3yewzaFlNVOE3uV7M2uIgGP-lZzRaHZgO2CN5cgIw6yDqIvmcBBrRoC1egQAvD_BwE:G:s&s_kwcid=AL!4422!3!563761819834!e!!g!!aws&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all) - 서버 및 라우터
- [Git](https://github.com/) - 협업용

<hr />

### Main
<img src="https://user-images.githubusercontent.com/103614357/177787072-c4cc3f5e-11e1-4ede-a5fa-94f05f5c4e8e.png" />

### 회원가입
<img src="https://user-images.githubusercontent.com/103614357/177787498-d8b7d080-c575-47f8-bdd6-0bed6ea473a0.png" />

### 상품
<img src="https://user-images.githubusercontent.com/103614357/177787439-933db07a-a96b-49a0-99de-1ee932400ad4.png" />

### 커스터마이징
<img src="https://user-images.githubusercontent.com/103614357/177791190-323f1f49-86d6-4967-a4f5-db980c2a8f31.png" />

### 구매
<img src="https://user-images.githubusercontent.com/103614357/177787571-a94dbc46-6d4f-49bc-b75d-85f6e88f343d.png" />

### 게시판
<img src="https://user-images.githubusercontent.com/103614357/177787629-3e16d0b6-c4fa-42db-a5ab-53d56fbb907f.png" />

### 관리자페이지
<img src="https://user-images.githubusercontent.com/103614357/177787723-9c6a8dee-07b3-471e-a8f4-913d649457e3.png" />

<hr/>

## 개발자

- [표정문](https://github.com/jeongmooon)
- [천수병](https://github.com/ghm8614)
- [김태희](https://github.com/ttaehee)
- [김민혜](https://github.com/KimMH853)
- [임정철](https://github.com/CODArchive00)

<hr />


