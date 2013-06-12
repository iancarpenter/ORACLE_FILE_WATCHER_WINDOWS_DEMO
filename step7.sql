BEGIN

   dbms_scheduler.create_job
   (
      job_name        => 'file_watcher_job',
      program_name    => 'file_watcher_prog',
      event_condition => NULL,
      queue_spec      => 'the_file_watcher',
      auto_drop       => FALSE,
      enabled         => FALSE
    );

END;
/