BEGIN

   dbms_scheduler.define_metadata_argument
   (
      program_name       => 'file_watcher_prog',
      metadata_attribute => 'event_message',
      argument_position  => 1
   );

END;
/