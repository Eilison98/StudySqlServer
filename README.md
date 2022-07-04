# MS-SQL

<br/>

## 데이타 검색
- USE 데이타베이스명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* USE 문을 사용한 데이타베이스 선택 */
 - SELECT * FROM 데이블명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 모든 칼럼 불러오기 */
 - SELECT TOP n * FROM 테이블명   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 상위 n개의 데이타만 가져오기 */
 - SELECT 칼럼1, 칼럼2, 칼럼3 FROM 테이블명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 특정 칼럼 가져오기 */
 - SELECT 칼럼1 별명1, 칼럼2 AS 별명2 FROM 테이블명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 칼럼에 별명 붙이기 */
 - SELECT 칼럼3 '별  명3' FROM 테이블명   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     /* 칼럼 별명에 스페이스가 들어갈 경우는 작은따옴표 사용 */
 - SELECT DISTINCT 칼럼 FROM 테이블명    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     /* 중복되지 않는 데이타만 가져오기 */
   - 데이타는 오름차순으로 재배열된다
   - DISTINCT를 사용하면 재배열이 될때까지 데이타가 리턴되지 않으므로 수행 속도에 영향을 미친다 */
 - SELECT * FROM 테이블명 WHERE 조건절  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      /* 조건에 해당하는 데이타 가져오기 */
    - 조건식에 사용하는 비교는 칼럼=값, 칼럼!=값, 칼럼>값, 칼럼>=값, 칼럼<값, 칼럼<=값이 있다
    - 문자열은 ''(작은따옴표)를 사용한다
    - 날짜 비교를 할때는 'yy-mm-dd' 형식의 문자열로 한다(날짜='1992-02-02', 날짜>'1992-02-02')
 - SELECT * FROM 테이블명 WHERE 칼럼 BETWEEN x AND y  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 x>=와 y<=사이의 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 IN (a, b...)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 a이거나 b인 데이타 가져오기 */


 - SELECT * FROM 테이블명 WHERE 칼럼 LIKE '패턴'     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      /* 칼럼이 -패턴과 같은 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 IS NULL  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 NULL인 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 NOT BETWEEN x AND y  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  /* 칼럼이 x와 y 사이가 아닌 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 NOT IN (a, b...)   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 a나 b가 아닌 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 NOT LIKE '패턴'  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 패턴과 같지 않은 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 IS NOT NULL   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 NULL이 아닌 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼>=x AND 칼럼<=y        
 - SELECT * FROM 테이블명 WHERE 칼럼=a or 칼럼=b
 - SELECT * FROM 데이블명 WHERE 칼럼1>=x AND (칼럼2=a OR 칼럼2=b)
   - 복수 조건을 연결하는 연산자는 AND와 OR가 있다
     - AND와 OR의 우선순위는 AND가 OR보다 높은데 우선 순위를 바꾸고 싶다면 ()을 사용한다
 - SELECT * FROM 테이블명 ORDER BY 칼럼  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    /* 칼럼을 오름차순으로 재배열하기 */
 - SELECT * FROM 테이블명 ORDER BY 칼럼 ASC                
 - SELECT * FROM 테이블명 ORDER BY 칼럼 DESC   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  /* 칼럼을 내림차순으로 재배열하기 */
 - SELECT * FROM 테이블명 ORDER BY 칼럼1 ASC, 칼럼2 DESC  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  /* 복수 칼럼 재배열하기 */
 - SELECT * FROM 테이블명 ORDER BY 1 ASC, DESC 3   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  /* 칼럼 순서로 재배열하기 */ 
 - 기본적으로 SELECT 문에서는 출력순서가 보증되지 않기 때문에
     - 데이타의 등록 상태나 서버의 부하 상태에 따라 출력되는 순서가 달라질 수 있다
     - 따라서 출력하는 경우 되도록이면 ORDER BY를 지정한다
     - 칼럼 번호는 전체 칼럼에서의 번호가 아니라 SELECT문에서 선택한 칼럼의 번호이고 1부터 시작한다

<br/>
