BEGIN

   dbms_scheduler.create_file_watcher
   (
      file_watcher_name => 'the_file_watcher',
      directory_path    => 'C:etl_dir',
      file_name         => '*.txt',
      credential_name   => 'watch_credential',
      destination       => NULL,
      enabled           => FALSE
   );

END;
/