-- first, manually create a climate database using the Athena console
-- Then use this DDL as a new query from Athena console to create historic_climate_gz table

CREATE EXTERNAL TABLE `historic_climate_gz`(
  `id` string,
  `yearmonthday` int,
  `element` string,
  `temperature` int,
  `m-flag` string,
  `q-flag` string,
  `s-flag` string,
  `obs-time` int)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://noaa-ghcn-pds/csv.gz/'
TBLPROPERTIES (
  'has_encrypted_data'='false',
  'transient_lastDdlTime'='1553207260')
