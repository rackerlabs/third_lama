
Create S3 datasets from Shirley's links


```
datasize=1gb
s3_bucket=tpch-abcd
for t in customer lineitem nation orders part partsupp region supplier; do echo $t; mkdir -p s3/$datasize/$t; wget -O s3/$datasize/$t/$t.tbl https://tpch-datasets.s3.amazonaws.com/$datasize/$t.tbl; aws s3 cp s3/$datasize/$t/$t.tbl s3://$s3_bucket/$datasize/$t/$t.tbl; done
```
