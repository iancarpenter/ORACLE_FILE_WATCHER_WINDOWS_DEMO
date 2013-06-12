BEGIN

   dbms_scheduler.set_attribute
   (
      'file_watcher_schedule',
      'repeat_interval',
      'freq=minutely; interval=1'
   );

END;
/