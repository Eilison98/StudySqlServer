
-- select, order by
-- (1) 별칭을 사용하여 사원의 연간 총 수입을 출력하세요.
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
  FROM hr.EMP;

-- (2) 사원 정보를 부서 번호(오름 차순), 급여(내림차순)으로 정렬하여 출력하세요.
SELECT *
  FROM hr.EMP
ORDER BY DEPTNO ASC, SAL DESC;




-- where
-- (3) 부서 번호가 30 이고, 담당 업무가 SALESMAN 인 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';

-- (4) 담당 업무가 MANAGER, SALESMAN, CLERK 중에 속하는 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

-- (5) 급여가 2000 보다 낮고, 3000 보다 높은 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE SAL NOT BETWEEN 2000 AND 3000;

-- (6) 사원 이름의 두 번째 글자가 L인 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE ENAME LIKE '_L%';

-- (7) 사원명에 'AM'이 포함되어 있지 않은 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE ENAME NOT LIKE '%AM%';

-- (8) 직속 상관이 있는 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE MGR IS NOT NULL;

-- (9) 10 번 또는 20 번 부서에 소속된 사원의 정보를 출력하세요.
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM hr.EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM hr.EMP
 WHERE DEPTNO = 20;




-- 함수
-- (10) 입사 10주년이 되는 사원의 정보와 사원별로 입사 10주년이 되는 날짜를 출력하세요.
SELECT EMPNO, ENAME, HIREDATE,
       dateadd(month, 120, HIREDATE) AS WORK10YEAR
  FROM hr.EMP;

-- (11) 담당 직무별로 인상된 급여 정보를 출력하세요. 
-- 단, 담당 직무가 MANAGER 이면, 급여를 10% 인상하고,
-- SALESMAN 이면, 급여를 5% 인상하고,
-- ANALYST 이면, 급여 인상이 없고,
-- 그 외는 급여를 3% 인상이 되도록 하세요.
SELECT EMPNO, ENAME, JOB, SAL,
       CASE JOB
          WHEN 'MANAGER' THEN SAL*1.1
          WHEN 'SALESMAN' THEN SAL*1.05
          WHEN 'ANALYST' THEN SAL
          ELSE SAL*1.03
       END AS UPSAL
  FROM hr.EMP;


-- (12) 출력 결과를 참고하여, 사원별 수당 정보를 출력하세요.
SELECT EMPNO, ENAME, COMM,
       CASE
          WHEN COMM IS NULL THEN '해당사항 없음'
          WHEN COMM = 0 THEN '수당없음'
          WHEN COMM > 0 THEN concat('수당 : ', COMM)
       END AS COMM_TEXT
  FROM hr.EMP;






-- 그룹
-- (13) 10번, 20번, 30번 부서별 평균 급여를 출력하세요. 단, group by 를 사용하지 않고 출력되도록 하세요.
SELECT AVG(SAL) as AVG_SAL, '10' AS DEPTNO FROM hr.EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL) as AVG_SAL, '20' AS DEPTNO FROM hr.EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL) as AVG_SAL, '30' AS DEPTNO FROM hr.EMP WHERE DEPTNO = 30;

-- (14) 급여가 3000 미만인 사원이 근무하고 있는 부서의 부서별, 담당 업무별 평균 급여 정보를 출력하세요.
SELECT DEPTNO, JOB, AVG(SAL) as AVG_SAL
  FROM hr.EMP
 WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;



-- sql-99

-- (15) 각 사원의 정보를 자신의 상사 정보와 함께 출력되도록 하고,
-- 직속 상사가 없는 사원의 정보도 함께 출력되도록 하세요.
-- 단, 부하 직원이 없는 상사 정보는 출력되지 않도록 하세요.
SELECT E1.EMPNO, E1.ENAME,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
  FROM hr.EMP E1 LEFT OUTER JOIN hr.EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- (16) 상사가 있는 각 사원의 정보는 자신의 상사 정보와 함께 출력되도록 하고,
-- 직속 상사가 없는 사원은 출력에서 제외하고,
-- 부하 직원이 없는 상사 정보는 출력되도록 하세요.
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
  FROM hr.EMP E1 RIGHT OUTER JOIN hr.EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO, MGR_EMPNO;

-- (17) 상사가 있는 각 사원의 정보는 자신의 상사 정보와 함께 출력되도록 하고,
-- 직속 상사가 없는 사원 및 부하 직원이 없는 상사도 모두 출력되도록 하세요.
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
  FROM hr.EMP E1 FULL OUTER JOIN hr.EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;






--sub query
-- (18) JONES 사원의 급여 이상으로 받는 사원 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE SAL > (SELECT SAL
                FROM hr.EMP
               WHERE ENAME = 'JONES');

-- (19) SCOTT 사원 보다 오래 근무한 사원 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE HIREDATE < (SELECT HIREDATE
                     FROM hr.EMP
                    WHERE ENAME = 'SCOTT');

-- (20) 20 번 부서에 근무하고 있는 사원중에서 사원 전체 평균 급여보다 높은 급여를 받는 사원 정보를 출력하세요.
-- 단, 부서 정보도 함께 출력되도록 하세요.
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
  FROM hr.EMP E, hr.DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.DEPTNO = 20
   AND E.SAL > (SELECT AVG(SAL)
                  FROM hr.EMP);

-- (21) 부서별 최고 급여를 받는 사원의 정보를 출력하세요.
SELECT *
  FROM hr.EMP
 WHERE SAL IN (SELECT MAX(SAL)
                 FROM hr.EMP
               GROUP BY DEPTNO);

-- (22) 10 번 부서에 소속된 사원의 정보를 출력하세요. 단, with 절을 사용하세요.
WITH
E10 AS (SELECT * FROM hr.EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM hr.DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM E10, D
 WHERE E10.DEPTNO = D.DEPTNO;

-- (23) 사원 정보를 출력하되, 급여 등급, 부서 정보가 함께 출력되도록 하세요.
SELECT EMPNO, ENAME, JOB, SAL,
       (SELECT GRADE 
          FROM hr.SALGRADE
         WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
      (SELECT DNAME
         FROM hr.DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM hr.EMP E;