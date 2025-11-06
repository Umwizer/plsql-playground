CREATE OR REPLACE PROCEDURE calc_bonu_EMP_01(v_employee_id IN NUMBER) as 
      v_salary NUMBER;
      v_bonus_msg VARCHAR(20);
BEGIN 
   -- fetch data from the employeess table
SELECT Salary INTO v_salary FROM employees WHERE employee_id = v_employee_id ;

-- apply conditions
IF v_salary >= 60000 THEN
   v_bonus_msg := 'HighSalary';
ELSIF v_salary >= 40000 THEN
   v_bonus_msg :='Medium Salary';
ELSE 
   v_bonus_msg :='Low Salary';
END IF;

 DBMS_OUTPUT.PUT_LINE('Employee ID :  '|| v_employee_id);
 DBMS_OUTPUT.PUT_LINE('Employee Salary :  '|| v_salary);
 DBMS_OUTPUT.PUT_LINE('Employee bonus messsage:  '|| v_bonus_msg);

 EXCEPTION
   WHEN NO_DATA_FOUND THEN 
    DBMS_OUTPUT.PUT_LINE('No such employees');
   WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('ERRO' || SQLERRM);
END;
/