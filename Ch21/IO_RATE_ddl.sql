CREATE OR REPLACE PROCEDURE io_rate(p_iterations NUMBER,p_io_count number, p_time_period number) IS
   v_batch_size   NUMBER := 1000;
   v_start_id     NUMBER := 1;
   v_id           NUMBER;
   v_end_id       NUMBER := 15000000;
   v_status       NUMBER;
   v_dummy        VARCHAR2(200);
   v_phys_delta   NUMBER;
   v_log_delta    NUMBER;
   v_hit_rate     NUMBER;
 
   v_stable       BOOLEAN := FALSE;
   txn_row        txn_data%ROWTYPE;
   v_startTime    NUMBER;
   v_hit_target   NUMBER := 100;
   v_elapsed      NUMBER;
BEGIN
   DBMS_ALERT.REGISTER('GHR_STABLE'); -- stop seeking hit rate
   DBMS_ALERT.REGISTER('GHR_SEEK'); -- start seeking

 
   v_startTime := DBMS_UTILITY.get_time();



   FOR i in 1..p_iterations LOOP
      v_id := ROUND(DBMS_RANDOM.VALUE(v_start_id, v_end_id));
      BEGIN
         SELECT *
         INTO txn_row
         FROM txn_data
         WHERE txn_id = v_id;
      EXCEPTION
         WHEN NO_DATA_FOUND THEN
            NULL;
      END;

      IF MOD(i, p_io_count) = 0 THEN
         v_elapsed := ROUND((DBMS_UTILITY.get_time() - v_startTime) / 100);
         -- Stop on alert
         DBMS_ALERT.waitone(NAME => 'GHR_STOP', status => v_status,
         MESSAGE => v_dummy, TIMEOUT => 0);
         IF v_status = 0 THEN

            EXIT;
         END IF;
         v_startTime := DBMS_UTILITY.get_time();
         if v_elapsed < p_time_period then 
         
            DBMS_LOCK.sleep(p_time_period-v_elapsed);
         end if; 
         v_startTime := DBMS_UTILITY.get_time();
      END IF;
 
   END LOOP;
END; 
