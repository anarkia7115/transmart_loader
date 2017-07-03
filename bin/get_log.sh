echo "SELECT seq_id, job_id, procedure_name, step_desc, step_status, job_date
  FROM tm_cz.cz_job_audit order by seq_id desc limit 10;
"|psql
