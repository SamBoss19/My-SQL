exec ods.prc_incremental_load '2022-10-05' 
select * from ods.process_log_hdr
select * from ods.tmp_incremental_testtab