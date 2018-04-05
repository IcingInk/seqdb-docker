/*
Filename:  Bug10158_Remove_PcrPrimer_seq_field_validation.sql
Purpose:   Sets PcrPrimer Seq field default value to empty string
Date:      2017-11-07
Author:    Satpal Bilkhu
*/

alter table PcrPrimers modify column Seq varchar(255) NOT NULL DEFAULT '';
alter table PcrPrimers_AUD modify column Seq varchar(255);
