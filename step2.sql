BEGIN

   dbms_scheduler.create_credential
   (
      credential_name => 'watch_credential',
      username        => 'your operating system username',
      password        => 'your operating system password',
   );

END;
/