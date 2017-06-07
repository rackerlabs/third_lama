```
CREATE DATABASE TPCH_DATA;

USE  TPCH_DATA;

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


 CREATE TABLE Lineitem(
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
    L_ShipDate datetime ,
    L_CommitDate datetime ,
    L_ReceiptDate datetime ,
    L_ShipInstruct varchar(64) ,
    L_ShipMode varchar(64) ,
    L_Comment varchar(64)
    )
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/lineitem/';


CREATE TABLE Nation(
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



CREATE TABLE Orders(
    O_OrderKey int ,
    O_CustKey int ,
    O_OrderStatus varchar(64) ,
    O_TotalPrice decimal(13, 2) ,
    O_OrderDate datetime ,
    O_OrderPriority varchar(15) ,
    O_Clerk varchar(64) ,
    O_ShipPriority int ,
    O_Comment varchar(80) ,
    skip varchar(64)
    );
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'field.delim' = '|'
) 
LOCATION 's3://tpch-abcd/1gb/orders/';


CREATE TABLE Part(
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

CREATE TABLE Partsupp(
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


CREATE TABLE Region(
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



CREATE TABLE Supplier(
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
