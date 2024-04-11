DROP DATABASE IF EXISTS `Spring_AM_01`;
CREATE DATABASE `Spring_AM_01`;
USE `Spring_AM_01`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);


# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# member TD 생성
# (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcd@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1',
cellphoneNum = '01043214321',
email = 'abcde@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2',
cellphoneNum = '01056785678',
email = 'abcdef@gmail.com';

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE article
SET memberId = 2
WHERE id IN (1,2);

UPDATE article
SET memberId = 3
WHERE id IN (3,4);


# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

# board TD 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';

ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

UPDATE article
SET boardId = 3
WHERE id = 4;

ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

# reactionPoint 테이블 생성
CREATE TABLE reactionPoint(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

# article 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE article AS A
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`body` = '댓글 4';

# reply 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE reply ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE reply ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 1번 회원이 2번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 2,
`point` = 1;

# 2번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 2번 회원이 2번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 2,
`point` = -1;

# 3번 회원이 1번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'reply',
relId = 1,
`point` = 1;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE reply AS R
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON R.id = RP_SUM.relId
SET R.goodReactionPoint = RP_SUM.goodReactionPoint,
R.badReactionPoint = RP_SUM.badReactionPoint;

###############################################

SELECT * FROM article;

SELECT * FROM `member`;

SELECT * FROM `board`;

SELECT * FROM reactionPoint;

SELECT * FROM `reply`;

DESC `reply`;


DESC reactionPoint;

DESC article;

DESC `member`;

SELECT goodReactionPoint
FROM article 
WHERE id = 1

INSERT INTO article
(
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(),NOW(), FLOOR(RAND() * 2) + 2, FLOOR(RAND() * 3) + 1, CONCAT('제목_',RAND()), CONCAT('내용_',RAND())
FROM article;

SELECT IFNULL(SUM(RP.point),0)
FROM reactionPoint AS RP
WHERE RP.relTypeCode = 'article'
AND RP.relId = 3
AND RP.memberId = 1;


UPDATE article 
SET title = '제목5'
WHERE id = 5;

UPDATE article 
SET title = '제목11'
WHERE id = 6;

UPDATE article 
SET title = '제목45'
WHERE id = 7;

SELECT FLOOR(RAND() * 2) + 2

SELECT FLOOR(RAND() * 3) + 1


SHOW FULL COLUMNS FROM `member`;
DESC `member`;



SELECT LAST_INSERT_ID();

SELECT *
FROM article AS A
WHERE 1

	AND boardId = 1

			AND A.title LIKE CONCAT('%','0000','%')
			OR A.body LIKE CONCAT('%','0000','%')

ORDER BY id DESC

SELECT COUNT(*)
FROM article AS A
WHERE 1
AND boardId = 1
AND A.title LIKE CONCAT('%','0000','%')
OR A.body LIKE CONCAT('%','0000','%')
ORDER BY id DESC


SELECT hitCount
FROM article
WHERE id = 374;

SELECT A.*
FROM article AS A
WHERE A.id = 1

SELECT A.*, M.nickname AS extra__writer
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
WHERE A.id = 1

# LEFT JOIN
SELECT A.*, M.nickname AS extra__writer, RP.point
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 서브쿼리
SELECT A.*,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM (
    SELECT A.*, M.nickname AS extra__writer 
    FROM article AS A
    INNER JOIN `member` AS M
    ON A.memberId = M.id
    ) AS A
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 조인
SELECT A.*, M.nickname AS extra__writer,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;


SELECT *, COUNT(*)
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

SELECT IF(RP.point > 0, '큼','작음')
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

# 각 게시물의 좋아요, 싫어요 갯수
SELECT RP.relTypeCode, RP.relId,
SUM(IF(RP.point > 0,RP.point,0)) AS goodReactionPoint,
SUM(IF(RP.point < 0,RP.point * -1,0)) AS badReactionPoint
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId





-- 테이블 생성 SQL - service_Conshop
CREATE TABLE service_Conshop
(
    `id`                 INT             NOT NULL    AUTO_INCREMENT COMMENT '업체고유번호', 
    `categoryId`         INT             NOT NULL    COMMENT '카테고리 번호(이미지메이킹 / 퍼스널컬러)', 
    `shopName`           VARCHAR(50)     NOT NULL    COMMENT '업체명', 
    `roadName`           VARCHAR(300)    NOT NULL    COMMENT '위치(도로명주소)',
    `review`             VARCHAR(300)    NULL        COMMENT '리뷰', 
    `photoUrl1`          VARCHAR(500)    NULL        COMMENT '사진 URL 1', 
    `photoUrl2`          VARCHAR(500)    NULL        COMMENT '사진 URL 2', 
    `photoUrl3`          VARCHAR(500)    NULL        COMMENT '사진 URL 3', 
    `photoUrl4`          VARCHAR(500)   NULL        COMMENT '사진 URL 4', 
    `photoUrl5`          VARCHAR(500)   NULL        COMMENT '사진 URL 5', 
    `phoneNum`           VARCHAR(50)     NOT NULL    COMMENT '전화번호', 
    `con_availableTime`  VARCHAR(50)     NULL        COMMENT '컨설팅 가능 시간', 
    `con_availableDate`  VARCHAR(50)     NULL        COMMENT '컨설팅 가능 날짜', 
    `operateTime`        VARCHAR(300)    NULL        COMMENT '영업시간', 
    `menu`               VARCHAR(300)    NULL        COMMENT '가격', 
    `themeId`            INT             NULL        COMMENT '테마번호', 
    `regDate`            VARCHAR(50)     NULL        COMMENT '등록날짜', 
    `updateDate`         VARCHAR(50)     NULL        COMMENT '수정날짜', 
    `delDate`            DATETIME        NULL        COMMENT '삭제날짜',
    `delStatus`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)', 
     PRIMARY KEY (id)
);


DROP TABLE service_Conshop;

## innerjoin 별점 총점 세팅

SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
FROM service_Conshop AS C
LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
WHERE C.id = 21
GROUP BY  C.id, C.categoryId;


SELECT *
FROM service_Conshop;



SELECT *
FROM service_Conshop
WHERE categoryId = 1;

DESC service_Conshop;



-- 테이블 생성 SQL - service_Conshop
CREATE TABLE service_selfshop
(
    `id`                 INT             NOT NULL    AUTO_INCREMENT COMMENT '업체고유번호', 
    `categoryId`         INT             NOT NULL    COMMENT '카테고리 번호(이미지메이킹 / 퍼스널컬러)', 
    `shopName`           VARCHAR(50)     NOT NULL    COMMENT '업체명', 
    `roadName`           VARCHAR(300)    NOT NULL    COMMENT '위치(도로명주소)',
    `review`             VARCHAR(300)    NULL        COMMENT '리뷰', 
    `photoUrl1`          VARCHAR(500)    NULL        COMMENT '사진 URL 1', 
    `photoUrl2`          VARCHAR(500)    NULL        COMMENT '사진 URL 2', 
    `photoUrl3`          VARCHAR(500)    NULL        COMMENT '사진 URL 3', 
    `photoUrl4`          VARCHAR(500)    NULL        COMMENT '사진 URL 4', 
    `photoUrl5`          VARCHAR(500)    NULL        COMMENT '사진 URL 5', 
    `phoneNum`           VARCHAR(50)     NOT NULL    COMMENT '전화번호', 
    `operateTime`        VARCHAR(300)    NULL        COMMENT '영업시간', 
    `menu`               VARCHAR(300)    NULL        COMMENT '가격', 
    `themeId`            INT             NULL        COMMENT '테마번호', 
    `regDate`            VARCHAR(50)     NULL        COMMENT '등록날짜', 
    `updateDate`         VARCHAR(50)     NULL        COMMENT '수정날짜', 
    `delDate`            DATETIME        NULL        COMMENT '삭제날짜',
    `delStatus`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
     PRIMARY KEY (id)
);


SELECT *
FROM service_selfshop;


-- service_review Table Create SQL
-- 테이블 생성 SQL - service_review
CREATE TABLE service_review
(
    `id`                        INT            NOT NULL    AUTO_INCREMENT COMMENT '리뷰 고유번호', 
    `regDate`                   VARCHAR(50)    NULL        COMMENT '등록날짜',
    `updateDate`                VARCHAR(50)    NULL        COMMENT '수정날짜',
    `memberId`                  VARCHAR(50)    NULL        COMMENT '회원번호', 
    `themeId`                   INT            NULL        COMMENT '업체테마 번호', 
    `categoryId`                INT            NULL        COMMENT '카테고리 번호(이미지메이킹 / 퍼스널컬러 / 헤어 / 메이크업)', 
     shopId                     INT            NULL        COMMENT '가게 고유번호',
    `starPoint`                 INT            NULL        COMMENT '별점',
    `title`                     TEXT           NULL        COMMENT '리뷰 제목', 
    `body`                      TEXT           NULL        COMMENT '리뷰 내용', 
     PRIMARY KEY (id)
);

SELECT *
FROM service_review;

INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 2,
categoryId = 3,
shopId = 1,
starPoint = 3.0,
`title` = '리뷰3',
`body` = '내용3';
 
 
INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 2,
categoryId = 1,
shopId = 1,
starPoint = 3.0,
`title` = '리뷰test1',
`body` = '리뷰test1'; 
 
INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 2,
categoryId = 1,
shopId = 1,
starPoint = 5.0,
`title` = '리뷰test2',
`body` = '리뷰test2';  

 
INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 1,
categoryId = 2,
shopId = 3,
starPoint = 2.0,
`title` = '컨설팅리뷰test2',
`body` = '컨설팅리뷰test2';  


INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
themeId = 1,
categoryId = 2,
shopId = 1,
starPoint = 4.0,
`title` = '컨설팅리뷰test1111',
`body` = '컨설팅리뷰test1111'; 
 
 INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 2,
categoryId = 1,
shopId = 1,
starPoint = 1.0,
`title` = '리뷰test3',
`body` = '리뷰test3'; 
 
 INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 2,
categoryId = 3,
shopId = 1,
starPoint = 5.0,
`title` = '리뷰5',
`body` = '내용5';
 
INSERT INTO service_review
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
themeId = 1,
categoryId = 2,
shopId = 10,
starPoint = 4.0,
`title` = '리뷰입니다',
`body` = '너무 좋아요 ~~';


-- service_menu Table Create SQL
-- 테이블 생성 SQL - service_menu


DROP TABLE service_menu;

-- service_menu Table Create SQL
-- 테이블 생성 SQL - service_menu
CREATE TABLE service_menu
(
    `id`          INT            NOT NULL    AUTO_INCREMENT COMMENT '메뉴 고유번호', 
    `themeId`     INT            NULL        COMMENT '테마 고유번호', 
    `categoryId`  INT            NULL        COMMENT '카테고리 고유번호', 
    `shopName`    VARCHAR(50)    NOT NULL    COMMENT '업체명', 
    `menu`        VARCHAR(50)    NULL        COMMENT '메뉴명', 
    `price`       INT            NULL        COMMENT '가격', 
     PRIMARY KEY (id)
);

## 컨설팅 테이블에 리뷰 테이블 INNERJOIN

	SELECT C.*, COALESCE(AVG(R.starPoint), 0) AS totalStarPoint
	FROM service_Conshop AS C
	LEFT JOIN service_review AS R ON C.categoryId = R.categoryId AND C.id = R.shopId
	GROUP BY C.id, C.categoryId
	ORDER BY totalStarPoint DESC;

SELECT C.*, M.menu, M.price
FROM service_Conshop AS C
LEFT JOIN service_menu AS M
ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName;


SELECT C.*, MIN(M.price) AS min_price
FROM service_Conshop AS C
LEFT JOIN service_menu AS M
ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName
WHERE M.price > 1
GROUP BY C.shopName
ORDER BY min_price ASC;




SELECT *
FROM (
    SELECT C.*, MIN(M.price) AS min_price, AVG(M.price) AS avg_price
    FROM service_Conshop AS C
    LEFT JOIN service_menu AS M
    ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
    GROUP BY C.shopName
) AS subquery
ORDER BY CASE WHEN subquery.avg_price IS NULL THEN 1 ELSE 0 END ASC, subquery.min_price ASC;



SELECT C.*, M.menu, M.price
FROM service_Conshop AS C
INNER JOIN service_menu AS M
ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
WHERE
    (
        M.price <= 70000 OR
        (M.price > 70000 AND M.price <= 100000) OR
        (M.price > 100000 AND M.price <= 200000) OR
        M.price > 200000
    )
ORDER BY 
    M.price = 0,
    M.price ASC;
    
    SELECT DISTINCT C.*, M.menu, M.price
FROM service_Conshop AS C
INNER JOIN service_menu AS M
ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
WHERE
    (
        M.price <= 70000
       
    )
    GROUP BY C.shopName
ORDER BY 
    M.price = 0,
    M.price ASC;


SELECT DISTINCT C.*, M.menu, M.price
FROM service_Conshop AS C
INNER JOIN service_menu AS M
ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
WHERE
    (
       
        (M.price > 70000 AND M.price <= 100000)
    )
     GROUP BY C.shopName
ORDER BY 
    M.price = 0,
    M.price ASC;
    
    
SELECT DISTINCT C.*, M.menu, M.price
FROM service_Conshop AS C
INNER JOIN service_menu AS M
ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
WHERE
    (

        (M.price > 100000 AND M.price <= 290000)
      
    )
     GROUP BY C.shopName
ORDER BY 
    M.price = 0,
    M.price ASC;
    
    
SELECT DISTINCT C.*, M.menu, M.price
			FROM service_Conshop AS C
			INNER JOIN service_menu AS M
			ON C.themeId = M.themeId AND C.categoryId = M.categoryId AND C.shopName = M.shopName AND M.price > 0
			WHERE
			    (
			      
			        M.price > 200000
			    )
			GROUP BY C.shopName
			ORDER BY
			    M.price ASC;

SELECT *
FROM service_menu;