# MS-SQL

## 데이타 검색
- USE 데이타베이스명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* USE 문을 사용한 데이타베이스 선택 */
 - SELECT * FROM 데이블명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 모든 칼럼 불러오기 */
 - SELECT TOP n * FROM 테이블명   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 상위 n개의 데이타만 가져오기 */
 - SELECT 칼럼1, 칼럼2, 칼럼3 FROM 테이블명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 특정 칼럼 가져오기 */
 - SELECT 칼럼1 별명1, 칼럼2 AS 별명2 FROM 테이블명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 칼럼에 별명 붙이기 */
 - SELECT 칼럼3 '별  명3' FROM 테이블명               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     /* 칼럼 별명에 스페이스가 들어갈 경우는 작은따옴표 사용 */
 - SELECT DISTINCT 칼럼 FROM 테이블명                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     /* 중복되지 않는 데이타만 가져오기 */
   - 데이타는 오름차순으로 재배열된다
   - DISTINCT를 사용하면 재배열이 될때까지 데이타가 리턴되지 않으므로 수행 속도에 영향을 미친다 */
 - SELECT * FROM 테이블명 WHERE 조건절               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      /* 조건에 해당하는 데이타 가져오기 */
    - 조건식에 사용하는 비교는 칼럼=값, 칼럼!=값, 칼럼>값, 칼럼>=값, 칼럼<값, 칼럼<=값이 있다
    - 문자열은 ''(작은따옴표)를 사용한다
    - 날짜 비교를 할때는 'yy-mm-dd' 형식의 문자열로 한다(날짜='1992-02-02', 날짜>'1992-02-02')
 - SELECT * FROM 테이블명 WHERE 칼럼 BETWEEN x AND y    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 x>=와 y<=사이의 데이타 가져오기 */
 - SELECT * FROM 테이블명 WHERE 칼럼 IN (a, b...)       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   /* 칼럼이 a이거나 b인 데이타 가져오기 */


 - SELECT * FROM 테이블명 WHERE 칼럼 LIKE '패턴'     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      /* 칼럼이 패턴과 같은 데이타 가져오기 */
