
# Oracle Performance Survival Guide - Scripts

Here you can obtain the scripts and examples from [Oracle Performance Survival Guide](http://www.amazon.com/gp/product/0137011954?tag=guyharswebbit-20) by [Guy Harrison](http://www.guyharrison.net).  

An archive containing the full set of scripts can be downloaded [here](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/Scripts.zip).  Individual files can be downloaded [below](#Listing_of_individual_utility_scripts).  

The archive contains both utility scriptsand all of the SQL files that I used to create various test loads while writing the book.  The utility scripts are described in the index.html file contained within the archive.  These scripts provide reports on various aspects of database health and performance.  

The rest of the SQL files are provided as is, and without descriptions.  You might find them useful if you are trying to replicate my workloads.  

Some of the scripts will only work if you install some packages, views and permissions.  In particular, the OPSG_PKG package provides an ability to generate short term delta and rate reports against the time model and wait interface.  See [installation](#installation), below, for instructions.  

I hope you find these scripts - and my book - useful.  If you have any problems please contact me at [guy.a.harrison@gmail.com](mailto:guy.a.harrison@gmail.com).    

Regards,  

[Guy Harrison](http://www.guyharrison.net)  

## <a name="installation"></a>Installation 

Many scripts can be run without any installation providing that the user has access to V$ views.  However, a few require specialized views and that the OPSG_PKG be installed.  To install the package:  

1\. Open a command prompt within the "install" directory  
2\. execute either install_opsg.bat (Windows) or install_opsg.sh (Linux/Unix)  
3\. Respond to the prompts  

Here is an example session:  

<div style="margin-left: 40px;">`C:\tmp\opsg\install>install_opsg`  

`C:\tmp\opsg\install>sqlplus /nolog @install_opsg`  

`SQL*Plus: Release 11.1.0.7.0 - Production on Thu Sep 10 10:55:02 2009`  

`Copyright (c) 1982, 2008, Oracle.  All rights reserved.`  

`Enter password for the (new) OPSG user:opsg`  
`Enter SYS password:`  
`Enter TNSNAMES entry:g11r2ga`  
</div>

The script creates a user OPSG which has privileges to run all of the scripts and which has appropriate permissions.  You can modify the script if you want to install a different user.   You do need the SYS password to install the user.  

### Extending the SH schema

I found the data volumes in Oracle's SH schema too low to illustrate some of the SQL tuning principles.  The script extend_sh_schema.sql in the scripts directory will add about 2 million rows to the SALES and COSTS tables.   These updates are applied directly to the SH schema.    

##  Listing_of_individual_utility_scripts" 


Chapter 3: Tools of the Trade


p 41 [topsql1.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch03/topsql1.sql) Top 10 cached sql statements by elapsed time


p 58 [loginTrigger.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch03/loginTrigger.sql ) Example of a login trigger that activates SQL trace

 
p 70

[topWaits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch03/topWaits.sql )

Non-idle wait times sorted by time waited

 
p 73

[timeModelSimple.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch03/timeModelSimple.sql )

Time model unioned with wait data to show waits combined with CPU timings


 

p 55

[CurrentSessionTraceStatus.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch03/CurrentSessionTraceStatus.sql )

Show the full name and path of the trace file for the current session

 

Chapter 5: Indexing and Clustering


 


p 122

[monitoringOn.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch05/monitoringOn.sql )

Turn on monitoring for all indexes

 

p 122

[vobject.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch05/vobject.sql )

Show usage statistics for indexes





p 133

[checkPlanCache.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch05/checkPlanCache.sql )

Report on indexes that are not found in any cached execution plan





Chapter 6: Application Design and Implementation









p 157

[force_matching.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch06/force_matching.sql )

Identify SQLs that are identical other than for literal values (Force matching candidates)





Chapter 7: Optimizing the Optimizer









p 194

[ses_optimizer.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch07/ses_optimizer.sql )

Show optimizer parameters in effect for the curren session





p 198

[disableStats.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch07/disableStats.sql)

Disable automatic statistics collection





Chapter 11: Sorting Grouping and Set Operations









p 332

[sql_workarea.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch11/sql_workarea.sql )

Show statistics onsort and hash workareas (from V$SQL_WORKAREA)





Chapter 12: Using and Tuning PL/SQL









p 355

[plsqltime_sys.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch12/plsqltime_sys.sql )

Query to reveal the overhead of PLSQL within the database





p 356

[cachedPlsql.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch12/cachedPlsql.sql )

Show statements in the cache with PLSQL component and show pct of time spent in PLSQL





p 357

[queryProfiler.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch12/queryProfiler.sql )

Report on data held in the PLSQL_PROFILER tables





p 360

[hrpof_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch12/hrpof_qry.sql )

Query agains the DBMSHP (hierarchical profiler) tables





Chapter 13: Parallel SQL









p 414

[px_session.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch13/px_session.sql )

Show real time view of current parallel executions





p 413

[tqstat2.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch13/tqstat2.sql )

Example of using v$pq_tqstat to reveal PQO workload distribution





p 422

[rac_pqo2.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch13/rac_pqo2.sql )

Example of using v$pq_tqstat to show inster-instance parallel in RAC





Chapter 15: Lock Contention









p 460

[lock_type.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/lock_type.sql )

Show definition of all lock codes





p 461

[v_my_locks.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/v_my_locks.sql)

View definition that will show all locks held by the current user





p 467

[lock_delta_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/lock_delta_qry.sql )

Show lock waits compared to other waits and CPU over a short time period





p 466

[lock_wait_events.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/lock_wait_events.sql )

Show lock waits compared to other waits and CPU





p 468

[ash_locks.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/ash_locks.sql )

Show lock wait information from Active Session History (ASH)





p 468

[awr_locks.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/awr_locks.sql )

Show lock wait information from Active Workload Repository (AWR)





p 470

[locking_sql.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/locking_sql.sql )

Show SQLs with the highest lock waits





p 471

[segment_stats.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/segment_stats.sql )

Show segments with the highest lock waits





p 472

[application_module_wait.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/application_module_wait.sql )

Show SQLs for a particular module with lock waits





p 472

[session_lock_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/session_lock_waits.sql )

Show sessions with a specific USERNAME and their lock waits





p 476

[blockers.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/blockers.sql )

Simple blocking locks script





p 477

[lock_tree.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/lock_tree.sql )

Lock tree built up from V$SESSION





p 477

[show_session_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/show_session_waits.sql )

Blocking row level locks at the session level





p 478

[wait_chains.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch15/wait_chains.sql )

Lock tree built up from V$wait_chains





Chapter 16: Latch and Mutex contention









p 494

[latch_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/latch_waits.sql )

Latch/mutex waits compared to other non-idle waits and to CPU





p 496

[latch_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/latch_qry.sql )

"Latch statistics - gets





p 497

[ash_latch.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/ash_latch.sql )

Latch statistics from Active Session History (ASH)





p 495

[latch_delta_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/latch_delta_qry.sql )

Latch/mutex waits over a short duration compared to other waits





p 497

[latching_sql.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/latching_sql.sql )

SQLs with the highest concurrency waits (possible latch/mutex-related)





p 500

[force_matching.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/force_matching.sql )

SQLs not using bind variables - possibly causing library cache mutex contention





p 499

[libcache.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/libcache.sql )

Library cache statistics





p 503

[cbc_config.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/cbc_config.sql )

"Number of Cache Buffers Chains latches & number of buffers covered





p 504

[cbc_blocks.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/cbc_blocks.sql )

Blocks with the highest touch counts and latches involved





p 505

[rowcache_latches.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/rowcache_latches.sql )

Rowcache latch statistics





p 510

[latch_class.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/latch_class.sql )

Adjusting spin count for an individual latch class





p 511

[latch_class_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch16/latch_class_qry.sql )

Query to show latch class configuration





Chapter 17: Shared Memory Contention









p 519

[iostat_file.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch17/iostat_file.sql )

Status of ansynchronous IO





p 521

[flash_size.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch17/flash_size.sql )

Size of the flashback log buffer





p 526

[waitstat.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch17/waitstat.sql )

Buffer busy waits by buffer type





p 526

[busy_segments.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch17/busy_segments.sql )

Buffer busy waits by segment





Chapter 18: Buffer Cache Tuning









p 538

[temporary_direct.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/temporary_direct.sql )

Direct path IO and buffered IO





p 540

[buffer_pool_objects.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/buffer_pool_objects.sql )

Segments cached in the buffer pools





p 541

[hit_rate.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/hit_rate.sql )

"""hit rates"" for direct and cached IOs "





p 542

[hit_rate_delta.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/hit_rate_delta.sql )

"""hit rates"" calculated over a time interval "





p 544

[sql_miss_rates.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/sql_miss_rates.sql )

logical and physical IO for specific SQLs





p 546

[buffer_pool_stats.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/buffer_pool_stats.sql )

Buffer pool IO statistics





p 547

[db_cache_advice1.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/db_cache_advice1.sql )

Query on V$DB_CACHE_ADVICE





p 548

[db_cache_hist.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/db_cache_hist.sql )

DB cache advise shown as a histogram





p 552

[sga_dynamic_components.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/sga_dynamic_components.sql )

Query on V$SGA_DYNAMIC_COMPONENTS





p 551

[sga_resize_ops.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch18/sga_resize_ops.sql )

Query on V$SGA_RESIZE_OPS





Chapter 19: Optimizing PGA Memory









p 562

[pga_parameters.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/pga_parameters.sql )

PGA parameters and configuration from v$pgastat





p 566

[direct_temp_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/direct_temp_waits.sql )

temporary direct path IO compared to CPU and other non-idle waits





p 565

[top_pga.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/top_pga.sql )

Top consumers of PGA memory





p 567

[direct_io_delta_view_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/direct_io_delta_view_qry.sql )

Direct path temp IO over a time interval





p 570

[sql_workarea.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/sql_workarea.sql )

SQL workarea statistics





p 571

[pga_target_advice.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/pga_target_advice.sql )

PGA target advice report





p 572

[pga_advice_hist.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch19/pga_advice_hist.sql )

PGA target advice histogram





Chapter 20: Other Memory Management Topics









p 578

[io_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/io_waits.sql )

IO wait breakdown





p 581

[io_time_delta_view_qry.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/io_time_delta_view_qry.sql )

IO wait breakdown over a time period





p 582

[direct_path_trace_stats.pl](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/direct_path_trace_stats.pl)

Perl script to calculate average direct path IO time from a trace file





p 583

[pga_target_time.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/pga_target_time.sql )

PGA target converted to elapsed times





p 584

[overall_memory_advice.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/overall_memory_advice.sql )

Combined (PGA+SGA) memory advice report for 10g





p 586

[overall_memory11g.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/overall_memory11g.sql )

Combined (PGA+SGA) memory advice report for 11g





p 590

[memory_dynamic_components.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/memory_dynamic_components.sql )

V$MEMORY_DYNAMIC_COMPONENTS report





p 590

[memory_resize_ops.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/memory_resize_ops.sql )

V$MEMORY_RESIZE_OPS report





p 591

[memory_target_advice.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/memory_target_advice.sql )

Memory target advice report





p 593

[kmgsbsmemadv.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/kmgsbsmemadv.sql )

Query against X$KMSGSBSMEMADV (basis of V$MEMORY_TARGET_ADVICE)





p 594

[memory_parms.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/memory_parms.sql )

Report on memory related parameters





p 599

[result_cache_statistics.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/result_cache_statistics.sql )

Result set cache statistics





p 600

[rscache_hit_rate.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/rscache_hit_rate.sql )

Result set cache efficiency





p 600

[sql_cache_stats.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/sql_cache_stats.sql )

Result set cache statistics for SQL statements





p 601

[rc_dependencies.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/rc_dependencies.sql )

Result set cache dependencies





p 605

[shared_pool_advice.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch20/shared_pool_advice.sql )

Shared pool advisory





Chapter 21: Disk IO Tuning fundamentals









p 617

[io_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/io_waits.sql )

IO waits compared to other waits and CPU





p 618

[io_waits_delta.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/io_waits_delta.sql )

IO waits reported for an interval





p 619

[iostat_file.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/iostat_file.sql )

Summary report from v$iostat_file





p 620

[iostat_function.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/iostat_function.sql )

Summary report of v$iostat_function





p 622

[filestat.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/filestat.sql )

Summary report from v$filestat





p 622

[filemetric.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/filemetric.sql )

Short term IO statistics from v$filemetric





p 624

[calibrate_io.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/calibrate_io.sql )

PL/SQL reoutine to calibrate IO





p 623

[file_histogram.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/file_histogram.sql )

IO service time histogram





p 625

[dba_rsrc_io_calibrate.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/dba_rsrc_io_calibrate.sql )

Query IO calibration data





p 634

[lgwr_size.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/lgwr_size.sql )

Size of an average redo log IO





p 636

[log_file_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/log_file_waits.sql )

Report of redo log related waits





p 637

[log_history.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch21/log_history.sql )

Log switch rates from v$log_history





Chapter 22: Advanced IO techniques









p 645

[diskgroup_performance.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch22/diskgroup_performance.sql )

ASM diskgroup IO throughput and service time





p 646

[asm_disk_performance.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch22/asm_disk_performance.sql )

ASM disk-level throughput and service time





p 647

[asm_operations.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch22/asm_operations.sql )

ASM rebalance operations in progress





p 647

[asm_files.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch22/asm_files.sql )

ASM file level IO statistics





p 654

[asm_templates.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch22/asm_templates.sql )

List all ASM templates





Chapter 23: Optimizing RAC









p 669

[top_level_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/top_level_waits.sql )

Break down of top level WAITCLASS waits





p 670

[cluster_waits.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/cluster_waits.sql )

Break out of cluster waits compared to other categories





p 671

[rac_waits_delta.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/rac_waits_delta.sql )

RAC waits over an interval of time





p 673

[avg_latency.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/avg_latency.sql )

Global cache latency report





p 674

[latency_delta.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/latency_delta.sql )

Global cache latency over a time period





p 675

[ksxpia.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/ksxpia.sql )

Private interconnect IP address





p 677

[gc_blocks_lost.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/gc_blocks_lost.sql )

Lost blocks report





p 681

[lms_latency.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/lms_latency.sql )

LMS latency breakdown





p 682

[flush_time.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/flush_time.sql )

redo log flush frequency and wait times





p 684

[balance.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/balance.sql )

Cluster balance report





p 685

[rac_balance_delta.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/rac_balance_delta.sql )

Cluster balance over a time period





p 689

[service_stats.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/service_stats.sql )

Report on service workload by instance





p 693

[gc_miss_rate.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/gc_miss_rate.sql )

"Global cache ""miss rate"" by instance "





p 694

[top_gc_segments.sql](https://raw.githubusercontent.com/gharriso/OraclePerfSurvivalGuide/master/Ch23/top_gc_segments.sql )

Segments with the highest Global Cache activity



</tbody>

</table>
