CREATE TABLE CATEGORIES (
  CATEGORY_ID         NUMBER CONSTRAINT CATEGORY_ID_PK PRIMARY KEY,
  CATEGORY_NAME       VARCHAR2(50),
  DESCRIPTION		      VARCHAR2(100),
  Status              VARCHAR2(1),
  CREATED_BY          VARCHAR2(100),
  CREATED_DATE         TIMESTAMP WITH TIME ZONE,
  UPDATE_BY           VARCHAR2(100),
  UPDATE_DATE          TIMESTAMP WITH TIME ZONE);

----------------------------------------------------

CREATE TABLE SUB_CATEGORIES (
  sub_category_id     NUMBER CONSTRAINT SUB_CATEGORY_ID_PK PRIMARY KEY,
  CATEGORY_ID         NUMBER,
  SUB_CATEGORY_NAME   VARCHAR2(50),
  DESCRIPTION	        VARCHAR2(100),
  Status              VARCHAR2(1),
  CREATED_BY          VARCHAR2(100),
  CREATED_DATE         TIMESTAMP WITH TIME ZONE,
  UPDATE_BY           VARCHAR2(100),
  UPDATE_DATE          TIMESTAMP WITH TIME ZONE
  );
--------------------------------------------------------
CREATE TABLE BRANDS (
  BRAND_ID            NUMBER CONSTRAINT BRAND_ID_PK PRIMARY KEY,
  BRAND_NAME          VARCHAR2(50),
  Status              VARCHAR2(1),
  CREATED_BY          VARCHAR2(100),
  CREATED_DATE         TIMESTAMP WITH TIME ZONE,
  UPDATE_BY           VARCHAR2(100),
  UPDATE_DATE          TIMESTAMP WITH TIME ZONE
  );

-----------------------------------------------------------------

CREATE TABLE UOMS(
  UOM_ID              NUMBER CONSTRAINT UOM_ID_PK PRIMARY KEY,
  UOM_NAME            VARCHAR2(50),
  Status              VARCHAR2(1),
  CREATED_BY          VARCHAR2(100),
  CREATED_DATE         TIMESTAMP WITH TIME ZONE,
  UPDATE_BY           VARCHAR2(100),
  UPDATE_DATE          TIMESTAMP WITH TIME ZONE
  );

CREATE TABLE 	BANKS(
  bank_id             NUMBER CONSTRAINT BANK_ID_PK PRIMARY KEY,
  BANK_NAME           VARCHAR2(50),
  COUNTRY_ID          NUMBER CONSTRAINT COUNTRY_ID_IN_BNK references COUNTRIES(COUNTRY_ID),
  DESCRIPTION         VARCHAR2(100),
  CREATED_BY          VARCHAR2(100),
  CREATED_DATE         TIMESTAMP WITH TIME ZONE,
  UPDATE_BY           VARCHAR2(100),
  UPDATE_DATE          TIMESTAMP WITH TIME ZONE
  );
------------------------------------------
CREATE TABLE BANK_DETAILS (
  BANK_dtl_ID             NUMBER CONSTRAINT BANK_DTL_ID PRIMARY KEY,
  bank_ID                  NUMBER constraint BANK_ID_IN_BNK_DTL references BANKS(bank_id),
  BRANCH_NAME         	  VARCHAR2(100),
  ACC_NUMBER      	      NUMBER(100) CONSTRAINT AC_NUM_UK Unique,
  ACC_NAME        	      VARCHAR2(200) CONSTRAINT AC_NAME_UK Unique,
  BANK_TYPE           VARCHAR2(50),
  city_id             NUMBER CONSTRAINT CITY_ID_IN_BNK references cities(city_id),
  ADDRESS             VARCHAR2(200),
  status              varchar2(1),
  CREATE_BY           VARCHAR(100),
  CREATED_DATE         TIMESTAMP WITH TIME ZONE,
  UPDATE_BY           VARCHAR2(100),
  UPDATE_DATE          TIMESTAMP WITH TIME ZONE
  );
----------------------------------------------
Create table PORTS(
Port_id		Number constraint port_id_pk primary key,
Port_name 	varchar2(50),
Description 	varchar2(100),
Status 		varchar2(1),
created_by    	varchar2(100),
created_date  	TIMESTAMP WITH TIME ZONE,
update_by     	varchar2(100),
update_date   	TIMESTAMP WITH TIME ZONE
):


-----------------------------------
create table cost(
cost_ID 	number constraint cost_id_pk primary key,
cost_name 	varchar2(30),
description 	varchar2(225),
Status 		varchar2(1),
created_by    	varchar2(100),
created_date  	TIMESTAMP WITH TIME ZONE,
update_by     	varchar2(100),
update_date   	TIMESTAMP WITH TIME ZONE
);

---------------------------------------------------------

create table stock_received(
stk_id		number constraint stk_recvd_stkid_pk primary key,
pl_id		number,
stk_code	varchar2(25),
received_by	varchar2(100),
receivde_date 		TIMESTAMP WITH TIME ZONE,
note		varchar2(225),
status 		varchar2(1),
created_by    	varchar2(100),
created_date  	TIMESTAMP WITH TIME ZONE,
update_by     	varchar2(100),
update_date   	TIMESTAMP WITH TIME ZONE
);
---------------------------------------------------------
create table PL_SETUPS(
Pl_id 		number constraint pl_id_pk primary key,
lc_id 		number,
pl_code 	varchar2(30),
setup_date 	TIMESTAMP WITH TIME ZONE,
port_id 	number,
note 		varchar2(225),
status 		varchar2(1),
created_by    varchar2(100),
created_date   TIMESTAMP WITH TIME ZONE,
update_by     varchar2(100),
update_date    TIMESTAMP WITH TIME ZONE
);

-----------------------------
create table item_setups(
item_id 	number constraint item_id_pk primary key,
item_code 	number,
item_name 	varchar2(25),
short_name 	varchar2(25),
model_no 	number,
DESCRIPTION	varchar2(25),
size_id 	number,
sub_category_id number,
uom_id 		number,
brand_id 	number,
image 		blob,
status		varchar2(1),
created_by    	varchar2(100),
created_date  	TIMESTAMP WITH TIME ZONE,
update_by     	varchar2(100),
update_date   	TIMESTAMP WITH TIME ZONE
);

---------------------------
Create table Sizes(
size_ID 	number constraint size_id_pk primary key,
size_name 	varchar2(30),
DESCRIPTION	 	varchar2(225),
status		varchar2(1),
created_by    	varchar2(100),
created_date  	TIMESTAMP WITH TIME ZONE,
update_by     	varchar2(100),
update_date   	TIMESTAMP WITH TIME ZONE
);
----------------------------------------------

Create Table opening_stock(
op_ID		Number constraint opnstk_id_pk primary key,
Item_id		number,
recevied_qty 	number,
cost_price 	number,
sale_price 	number,
created_by    	varchar2(25),
created_date  	TIMESTAMP WITH TIME ZONE,
update_by     	varchar2(100),
update_date   	TIMESTAMP WITH TIME ZONE
);
--------------------------------------
CREATE TABLE pi_setups(
  pi_id         number  constraint Pi_id_PK primary key,
  pi_code       varchar2(50)  constraint Pi_code_UQ Unique,
  invoice_no    varchar2(50),
  payment_type  varchar2(100),
  currency_id   number,
  sup_id   number,
  buyer_id      number,
  issue_by      varchar2(100),
  issue_date     TIMESTAMP WITH TIME ZONE,
  total_amount  number,
  note          varchar2(225),
  status        varchar2(1),
  created_by    varchar2(100),
  created_date   TIMESTAMP WITH TIME ZONE,
  update_by     varchar2(100),
  update_date    TIMESTAMP WITH TIME ZONE
);
--------------------------------------------------
CREATE TABLE pi_details(
  pi_dtl        number constraint Pi_dtl_PK primary key,
  pi_id         number,
  sl_no         number,
  item_id       number,
  item_qty      number,
  unit_price    number,
  total_price   number,
  total_qty     number,
  total_amount  number,
  created_by    varchar2(100),
  created_date   TIMESTAMP WITH TIME ZONE,
  update_by     varchar2(100),
  update_date    TIMESTAMP WITH TIME ZONE
  );
--------------------------------------------------
create table suppliers(
  sup_id       		    number constraint sup_id_PK primary key,
  sup_code     		    varchar2(50) constraint sup_code_UQ unique,
  sup_name 	    	    varchar2(150),
  company_name      	varchar2(300),
  office_address    	varchar2(300),
  designation       	varchar2(50),
  Mobile_number     	varchar2(15) constraint sup_mob_UQ unique,
  phone_number      	varchar2(20),
  NID               	varchar2(25) constraint sup_nid_UQ unique,
  email             	varchar2(100) constraint sup_email_UQ unique,
  city_id           	number constraint CITY_id_FK_IN_SUP references cities(CITY_id),
  country_id        	number constraint COUNTRY_id_FK_IN_SUP references countries(country_id),
  image             	blob,
  status		        varchar2(1),
  created_by        	varchar2(100),
  created_date      	TIMESTAMP WITH TIME ZONE,
  update_by         	varchar2(100),
  update_date       	TIMESTAMP WITH TIME ZONE
);
----------------------------------------------------
create table BUYERS(
  buyer_id          number constraint buy_id_PK primary key,
  buyer_code        varchar2(50),
  buyer_name        varchar2(150),
  company_name      varchar2(300),
  office_address    varchar2(300),
  designation       varchar2(50),
  Mobile_number     varchar2(15) constraint buy_mob_UQ unique,
  phone_number      varchar2(20),
  NID               varchar2(25) constraint buy_nid_UQ unique,
  email             varchar2(100) constraint buy_email_UQ unique,
  city_id           	number constraint CITY_id_FK_IN_BUY references cities(CITY_id),
  country_id        	number constraint COUNTRY_id_FK_IN_BUY references countries(country_id),
  image             blob,
  status	    varchar2(1),
  created_by        varchar2(100),
  created_date       TIMESTAMP WITH TIME ZONE,
  update_by         varchar2(100),
  update_date        TIMESTAMP WITH TIME ZONE
);
--------------------------------------

CREATE TABLE LC_setups(
  lc_id               number constraint lc_id_PK primary key,
  pi_id               number,
  lc_code             varchar2(50) constraint lc_code_UQ unique,
  manual_no	      varchar2(50),
  shipment_date        TIMESTAMP WITH TIME ZONE,
  amendment_date       TIMESTAMP WITH TIME ZONE,
  expire_date          TIMESTAMP WITH TIME ZONE,
  local_bank_id       number,
  ben_bank_id	      number,
  note                varchar2(225),
  status              varchar2(1),
  created_by          varchar2(100),
  created_date         TIMESTAMP WITH TIME ZONE,
  update_by           varchar2(100),
  update_date          TIMESTAMP WITH TIME ZONE
);
------------------------------------------

create TABLE LC_DETAILS(
  lc_dtl_id     number  constraint lc_dtl_id_pk primary key,
  lc_id         number,
  sl_no         number,
  item_id       number,
  item_qty      number,
  unit_price    number,
  total_price   number,
  total_qty     number,
  total_amount  number,
  created_by    varchar2(100),
  created_date   TIMESTAMP WITH TIME ZONE,
  update_by     varchar2(100),
  update_date    TIMESTAMP WITH TIME ZONE
);
----------------------------------------------------
CREATE TABLE CURRENCIES(
  currency_id   number constraint curr_id_pk primary key,
  currency_name varchar2(50),
  description   varchar2(100),
  status        varchar2(1)
  created_by    varchar2(100),
  created_date   TIMESTAMP WITH TIME ZONE,
  update_by     varchar2(100),
  update_date    TIMESTAMP WITH TIME ZONE
  );
-----------------------------------------
create table PL_details(
PL_DTL_ID		number constraint pl_dtl_id_pk primary key,
PL_id			number,
sl_no			number,
item_id			number,
item_uty		number,
uom_id			number,
box_qty			number,
net_weight		number,
gross_weight		number,
created_by		varchar2(100),
created_date		TIMESTAMP WITH TIME ZONE,
updated_by		varchar1(100),
updated_date		TIMESTAMP WITH TIME ZONE
);
--------------------------------------------
create table pl_cost_details(
pl_cost_id	number constraint plcost_pk primary key,
pl_id		number,
sl_no		number,
cost_id		number,
agent_id	number,
Cost		number,
paid_cost	number,
payment_type	varchar2(100),
created_by	varchar2(100),
created_date	TIMESTAMP WITH TIME ZONE,
updated_by	varchar1(100),
updated_date	TIMESTAMP WITH TIME ZONE

);
--------------------------------------------
create table stock_details(
stk_dtl_id	number constraint stock_dtl_id_PK primary key,
stk_id		number,
sl_no		number,
item_id		number,
received_qty	number,
cost_price	number,
sale_price	number,
parameters	varchar2(100),
starts		number,
endsSUB_CATEGORY_NAME		numebr,
created_by	varchar2(100),
created_date	TIMESTAMP WITH TIME ZONE,
updated_by	varchar1(100),
updated_date	TIMESTAMP WITH TIME ZONE
);
-------------------------------------------------

create table countries(
    country_id      number constraint con_id_PK primary key,
    country_name    varchar2(30),
    region_name     varchar2(30),
    created_by varchar2(100),
    created_date  TIMESTAMP WITH TIME ZONE,
    updated_by varchar2(100),
    updated_date  TIMESTAMP WITH TIME ZONE
);

create table cities(
    city_id number constraint city_id_pk primary key,
    city_name varchar2(30),
    country_id number constraint con_id_FK references countries(country_id),
    created_by varchar2(100),
    created_date  TIMESTAMP WITH TIME ZONE,
    updated_by varchar2(100),
    updated_date  TIMESTAMP WITH TIME ZONE
);






























