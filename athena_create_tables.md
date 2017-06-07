
Create S3 datasets from Shirley's links


```
datasize=1gb
s3_bucket=tpch-abcd
for t in customer lineitem nation orders part partsupp region supplier; do echo $t; mkdir -p s3/$datasize/$t; wget -O s3/$datasize/$t/$t.tbl https://tpch-datasets.s3.amazonaws.com/$datasize/$t.tbl; aws s3 cp s3/$datasize/$t/$t.tbl s3://$s3_bucket/$datasize/$t/$t.tbl; done
```


Run each statement separately in the Athena console


```
CREATE DATABASE TPCH_DATA;
```

```
USE  TPCH_DATA;
```


```
CREATE EXTERNAL TABLE IF NOT EXISTS customer (
    C_CustKey int ,
    C_Name varchar(64) ,
    C_Address varchar(64) ,
    C_NationKey int ,
    C_Phone varchar(64) ,
    C_AcctBal decimal(13, 2) ,
    C_MktSegment varchar(64) ,
    C_Comment varchar(120)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/customer/';
```


```
CREATE EXTERNAL TABLE IF NOT EXISTS Lineitem (
    L_OrderKey int ,
    L_PartKey int ,
    L_SuppKey int ,
    L_LineNumber int ,
    L_Quantity int ,
    L_ExtendedPrice decimal(13, 2) ,
    L_Discount decimal(13, 2) ,
    L_Tax decimal(13, 2) ,
    L_ReturnFlag varchar(64) ,
    L_LineStatus varchar(64) ,
    L_ShipDate date ,
    L_CommitDate date ,
    L_ReceiptDate date ,
    L_ShipInstruct varchar(64) ,
    L_ShipMode varchar(64) ,
    L_Comment varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/lineitem/';
```


```
CREATE EXTERNAL TABLE IF NOT EXISTS  Nation(
    N_NationKey int ,
    N_Name varchar(64) ,
    N_RegionKey int ,
    N_Comment varchar(160) ,
    skip varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/nation/';
```



```
CREATE EXTERNAL TABLE IF NOT EXISTS  Orders(
    O_OrderKey int ,
    O_CustKey int ,
    O_OrderStatus varchar(64) ,
    O_TotalPrice decimal(13, 2) ,
    O_OrderDate date ,
    O_OrderPriority varchar(15) ,
    O_Clerk varchar(64) ,
    O_ShipPriority int ,
    O_Comment varchar(80) ,
    skip varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/orders/';
```


```
CREATE EXTERNAL TABLE IF NOT EXISTS  Part(
    P_PartKey int ,
    P_Name varchar(64) ,
    P_Mfgr varchar(64) ,
    P_Brand varchar(64) ,
    P_Type varchar(64) ,
    P_Size int ,
    P_Container varchar(64) ,
    P_RetailPrice decimal(13, 2) ,
    P_Comment varchar(64) ,
    skip varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/part/';
```

```
CREATE EXTERNAL TABLE IF NOT EXISTS  Partsupp(
    PS_PartKey int ,
    PS_SuppKey int ,
    PS_AvailQty int ,
    PS_SupplyCost decimal(13, 2) ,
    PS_Comment varchar(200) ,
    skip varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/partsupp/';
```


```
CREATE EXTERNAL TABLE IF NOT EXISTS  Region(
    R_RegionKey int ,
    R_Name varchar(64) ,
    R_Comment varchar(160) ,
    skip varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/region/';
```

```
CREATE EXTERNAL TABLE IF NOT EXISTS  Supplier(
    S_SuppKey int ,
    S_Name varchar(64) ,
    S_Address varchar(64) ,
    S_NationKey int ,
    S_Phone varchar(18) ,
    S_AcctBal decimal(13, 2) ,
    S_Comment varchar(105) ,
    skip varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/supplier/';
```