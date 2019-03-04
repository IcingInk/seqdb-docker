/*
Filename:  Bug10232_File_monitor_not_loading_all_sequence_files.sql
Purpose:   Add new fields for Task table 
Date:      2017-12-01
Author:    Nazir El-Kayssi
*/

alter table Tasks add column TimeInterval int DEFAULT NULL;
alter table Tasks add column TimeUnit varchar(255) DEFAULT NULL;
alter table Tasks add column FileSystemWatcherEntryID int(11) DEFAULT NULL;

alter table Tasks add constraint FK_lpenr1wqnlgis1koqqqw22kom foreign key (FileSystemWatcherEntryID) references FileSystemWatcherEntry(FileSystemWatcherEntryID);

/* Uncomment to add tasks entries. Set the AccountID to the appropriate value before running
INSERT INTO Tasks (Name, Type, TimeInterval, TimeUnit, FileSystemWatcherEntryID, AccountID) select 'File Monitor','FILE_SYSTEM_MONITOR',30,'MINUTES',FileSystemWatcherEntryID,5 from FileSystemWatcherEntry;
*/