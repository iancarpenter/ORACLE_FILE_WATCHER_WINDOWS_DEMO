BEGIN

   dbms_scheduler.enable
   (
      'the_file_watcher, file_watcher_prog, file_watcher_job'
   );

END;
/