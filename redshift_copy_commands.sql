set search_path to one_gb;

copy customer from 's3://tpch-datasets/1gb/customer.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy orders from 's3://tpch-datasets/1gb/orders.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy lineitem from 's3://tpch-datasets/1gb/lineitem.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy nation from 's3://tpch-datasets/1gb/nation.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy part from 's3://tpch-datasets/1gb/part.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy partsupp from 's3://tpch-datasets/1gb/partsupp.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy region from 's3://tpch-datasets/1gb/region.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

copy supplier from 's3://tpch-datasets/1gb/supplier.tbl' iam_role 'arn:aws:iam::531237488045:role/redshift_s3_role' delimiter '|';

