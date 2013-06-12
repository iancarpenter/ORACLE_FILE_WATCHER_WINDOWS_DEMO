BEGIN

   dbms_scheduler.create_program
   (
      program_name        => 'file_watcher_prog',
      program_type        => 'stored_procedure',
      program_action      => 'sp_load_customer_files',
      number_of_arguments => 1,
      enabled             => FALSE
   );

END;
/