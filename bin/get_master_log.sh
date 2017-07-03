echo "SELECT job_id, start_date, 
      job_status, job_name
  FROM tm_cz.cz_job_master
  order by job_id desc limit 10;"|psql 

