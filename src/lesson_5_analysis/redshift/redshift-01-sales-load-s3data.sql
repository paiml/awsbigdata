copy users from 's3://awssampledbuswest2/tickit/allusers_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '|' region 'us-west-2';

copy venue from 's3://awssampledbuswest2/tickit/venue_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '|' region 'us-west-2';

copy category from 's3://awssampledbuswest2/tickit/category_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '|' region 'us-west-2';

copy date from 's3://awssampledbuswest2/tickit/date2008_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '|' region 'us-west-2';

copy event from 's3://awssampledbuswest2/tickit/allevents_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '|' timeformat 'YYYY-MM-DD HH:MI:SS' region 'us-west-2';

copy listing from 's3://awssampledbuswest2/tickit/listings_pipe.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '|' region 'us-west-2';

copy sales from 's3://awssampledbuswest2/tickit/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::139419023984:role/redshift'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region 'us-west-2';