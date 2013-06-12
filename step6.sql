CREATE TABLE files_from_customers(file_name     VARCHAR2(100),
                                  file_contents CLOB);

CREATE OR REPLACE PROCEDURE sp_load_customer_files
(pt_payload IN sys.scheduler_filewatcher_result)
IS

 lc_clob           CLOB;
 lt_bfile          BFILE;
 li_warning        INTEGER;
 li_dest_offset    INTEGER := 1;
 li_src_offset     INTEGER := 1;
 li_lang_context   INTEGER := 0;

BEGIN
   INSERT INTO files_from_customers (file_name,
                                     file_contents)
   VALUES(
   pt_payload.directory_path || '' || pt_payload.actual_file_name,
   empty_clob())
   RETURNING file_contents INTO lc_clob;
   lt_bfile := BFILENAME(directory => 'ETL_DIR',
                         filename  => pt_payload.actual_file_name);

   dbms_lob.fileopen
   (
      file_loc => lt_bfile
   );

   dbms_lob.loadclobfromfile
   (
      dest_lob     => lc_clob,
      src_bfile    => lt_bfile,
      amount       => dbms_lob.getlength(file_loc =&gt; lt_bfile),
      dest_offset  => li_dest_offset,
      src_offset   => li_src_offset,
      bfile_csid   => NLS_CHARSET_ID('UTF8'),
      lang_context => li_lang_context,
      warning      =>; li_warning
   );

  dbms_lob.fileclose
  (
     file_loc => lt_bfile
  );

END sp_load_customer_files
/