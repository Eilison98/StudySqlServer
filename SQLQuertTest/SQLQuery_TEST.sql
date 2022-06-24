
-- select, order by
-- (1) ��Ī�� ����Ͽ� ����� ���� �� ������ ����ϼ���.
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
  FROM hr.EMP;

-- (2) ��� ������ �μ� ��ȣ(���� ����), �޿�(��������)���� �����Ͽ� ����ϼ���.
SELECT *
  FROM hr.EMP
ORDER BY DEPTNO ASC, SAL DESC;




-- where
-- (3) �μ� ��ȣ�� 30 �̰�, ��� ������ SALESMAN �� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';

-- (4) ��� ������ MANAGER, SALESMAN, CLERK �߿� ���ϴ� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

-- (5) �޿��� 2000 ���� ����, 3000 ���� ���� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE SAL NOT BETWEEN 2000 AND 3000;

-- (6) ��� �̸��� �� ��° ���ڰ� L�� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE ENAME LIKE '_L%';

-- (7) ����� 'AM'�� ���ԵǾ� ���� ���� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE ENAME NOT LIKE '%AM%';

-- (8) ���� ����� �ִ� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE MGR IS NOT NULL;

-- (9) 10 �� �Ǵ� 20 �� �μ��� �Ҽӵ� ����� ������ ����ϼ���.
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM hr.EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM hr.EMP
 WHERE DEPTNO = 20;




-- �Լ�
-- (10) �Ի� 10�ֳ��� �Ǵ� ����� ������ ������� �Ի� 10�ֳ��� �Ǵ� ��¥�� ����ϼ���.
SELECT EMPNO, ENAME, HIREDATE,
       dateadd(month, 120, HIREDATE) AS WORK10YEAR
  FROM hr.EMP;

-- (11) ��� �������� �λ�� �޿� ������ ����ϼ���. 
-- ��, ��� ������ MANAGER �̸�, �޿��� 10% �λ��ϰ�,
-- SALESMAN �̸�, �޿��� 5% �λ��ϰ�,
-- ANALYST �̸�, �޿� �λ��� ����,
-- �� �ܴ� �޿��� 3% �λ��� �ǵ��� �ϼ���.
SELECT EMPNO, ENAME, JOB, SAL,
       CASE JOB
          WHEN 'MANAGER' THEN SAL*1.1
          WHEN 'SALESMAN' THEN SAL*1.05
          WHEN 'ANALYST' THEN SAL
          ELSE SAL*1.03
       END AS UPSAL
  FROM hr.EMP;


-- (12) ��� ����� �����Ͽ�, ����� ���� ������ ����ϼ���.
SELECT EMPNO, ENAME, COMM,
       CASE
          WHEN COMM IS NULL THEN '�ش���� ����'
          WHEN COMM = 0 THEN '�������'
          WHEN COMM > 0 THEN concat('���� : ', COMM)
       END AS COMM_TEXT
  FROM hr.EMP;






-- �׷�
-- (13) 10��, 20��, 30�� �μ��� ��� �޿��� ����ϼ���. ��, group by �� ������� �ʰ� ��µǵ��� �ϼ���.
SELECT AVG(SAL) as AVG_SAL, '10' AS DEPTNO FROM hr.EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL) as AVG_SAL, '20' AS DEPTNO FROM hr.EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL) as AVG_SAL, '30' AS DEPTNO FROM hr.EMP WHERE DEPTNO = 30;

-- (14) �޿��� 3000 �̸��� ����� �ٹ��ϰ� �ִ� �μ��� �μ���, ��� ������ ��� �޿� ������ ����ϼ���.
SELECT DEPTNO, JOB, AVG(SAL) as AVG_SAL
  FROM hr.EMP
 WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;



-- sql-99

-- (15) �� ����� ������ �ڽ��� ��� ������ �Բ� ��µǵ��� �ϰ�,
-- ���� ��簡 ���� ����� ������ �Բ� ��µǵ��� �ϼ���.
-- ��, ���� ������ ���� ��� ������ ��µ��� �ʵ��� �ϼ���.
SELECT E1.EMPNO, E1.ENAME,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
  FROM hr.EMP E1 LEFT OUTER JOIN hr.EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- (16) ��簡 �ִ� �� ����� ������ �ڽ��� ��� ������ �Բ� ��µǵ��� �ϰ�,
-- ���� ��簡 ���� ����� ��¿��� �����ϰ�,
-- ���� ������ ���� ��� ������ ��µǵ��� �ϼ���.
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
  FROM hr.EMP E1 RIGHT OUTER JOIN hr.EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO, MGR_EMPNO;

-- (17) ��簡 �ִ� �� ����� ������ �ڽ��� ��� ������ �Բ� ��µǵ��� �ϰ�,
-- ���� ��簡 ���� ��� �� ���� ������ ���� ��絵 ��� ��µǵ��� �ϼ���.
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
  FROM hr.EMP E1 FULL OUTER JOIN hr.EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;






--sub query
-- (18) JONES ����� �޿� �̻����� �޴� ��� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE SAL > (SELECT SAL
                FROM hr.EMP
               WHERE ENAME = 'JONES');

-- (19) SCOTT ��� ���� ���� �ٹ��� ��� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE HIREDATE < (SELECT HIREDATE
                     FROM hr.EMP
                    WHERE ENAME = 'SCOTT');

-- (20) 20 �� �μ��� �ٹ��ϰ� �ִ� ����߿��� ��� ��ü ��� �޿����� ���� �޿��� �޴� ��� ������ ����ϼ���.
-- ��, �μ� ������ �Բ� ��µǵ��� �ϼ���.
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
  FROM hr.EMP E, hr.DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.DEPTNO = 20
   AND E.SAL > (SELECT AVG(SAL)
                  FROM hr.EMP);

-- (21) �μ��� �ְ� �޿��� �޴� ����� ������ ����ϼ���.
SELECT *
  FROM hr.EMP
 WHERE SAL IN (SELECT MAX(SAL)
                 FROM hr.EMP
               GROUP BY DEPTNO);

-- (22) 10 �� �μ��� �Ҽӵ� ����� ������ ����ϼ���. ��, with ���� ����ϼ���.
WITH
E10 AS (SELECT * FROM hr.EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM hr.DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM E10, D
 WHERE E10.DEPTNO = D.DEPTNO;

-- (23) ��� ������ ����ϵ�, �޿� ���, �μ� ������ �Բ� ��µǵ��� �ϼ���.
SELECT EMPNO, ENAME, JOB, SAL,
       (SELECT GRADE 
          FROM hr.SALGRADE
         WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
      (SELECT DNAME
         FROM hr.DEPT
        WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM hr.EMP E;