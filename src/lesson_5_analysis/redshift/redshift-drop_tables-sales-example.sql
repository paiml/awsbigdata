-- used to reset database; so you can repeat the tutorial on the same cluster
-- this will drop everything that user `awsuser` owns - change username to match your config
drop table category, date, event, listing, sales, users, venue;
