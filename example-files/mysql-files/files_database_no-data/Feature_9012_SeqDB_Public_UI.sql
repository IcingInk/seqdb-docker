/*
 * Filename:  Feature_9012_SeqDB_Public_UI.sql
 * Purpose:   Change decimalLatitude and decimalLongitude from text to decimal in Java fields and DB columns.
 * Date:      2017-10-30
 * Author:    Mathew Poff
 */

-- Rename old columns.
alter table CollectionInfos change `DecimalLatitude` `DecimalLatitude_OLD` varchar(100);
alter table CollectionInfos change `DecimalLongitude` `DecimalLongitude_OLD` varchar(100);

-- Add properly typed columns.
alter table CollectionInfos add DecimalLatitude decimal(11,8);
alter table CollectionInfos add DecimalLongitude decimal(11,8);

-- Set new values.
update CollectionInfos set DecimalLatitude = case when DecimalLatitude_OLD regexp '^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$' then cast(DecimalLatitude_OLD as decimal(11,8)) else null end;
update CollectionInfos set DecimalLongitude = case when DecimalLongitude_OLD regexp '^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$' then cast(DecimalLongitude_OLD as decimal(11,8)) else null end;

-- Change to float now because MySQL can't cast to float
alter table CollectionInfos modify DecimalLatitude FLOAT;
alter table CollectionInfos modify DecimalLongitude FLOAT;


-- Rename old columns.
alter table CollectionInfos_AUD change `DecimalLatitude` `DecimalLatitude_OLD` varchar(100);
alter table CollectionInfos_AUD change `DecimalLongitude` `DecimalLongitude_OLD` varchar(100);

-- Add properly typed columns.
alter table CollectionInfos_AUD add DecimalLatitude decimal(11,8);
alter table CollectionInfos_AUD add DecimalLongitude decimal(11,8);

-- Set new values.
update CollectionInfos_AUD set DecimalLatitude = case when DecimalLatitude_OLD regexp '^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$' then cast(DecimalLatitude_OLD as decimal(11,8)) else null end;
update CollectionInfos_AUD set DecimalLongitude = case when DecimalLongitude_OLD regexp '^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$' then cast(DecimalLongitude_OLD as decimal(11,8)) else null end;

-- Change to float now because MySQL can't cast to float
alter table CollectionInfos_AUD modify DecimalLatitude FLOAT;
alter table CollectionInfos_AUD modify DecimalLongitude FLOAT;