alter table LC_setups
add (constraint pi_id_FK foreign key(pi_id) references pi_setups(pi_id));
-----------------------------------------------
alter table LC_setups
add (constraint ben_bank_id _FK foreign key(ben_bank_id) references Bank_details(BANK_dtl_ID));
---------------------------------------------------
alter table LC_setups
add (constraint local_bank_id_FK foreign key(local_bank_id) references Bank_details(BANK_dtl_ID));
-----------------------------------------------------------------------



alter table LC_DETAILS
add (constraint lc_id_FK foreign key(lc_id) references LC_setups(lc_id));
----------------------------------------------------------------------
alter table LC_DETAILS
add (constraint item_id_FK foreign key(item_id) references item_setups(item_id));
------------------------------------------------------


alter TABLE BUYERS
ADD (CONSTRAINT city_id_FK foreign key(city_id) references countries(city_id));
----------------------------------------------------------
alter TABLE BUYERS
ADD (CONSTRAINT country_id_FK foreign key(country_id) references countries(country_id));

--------------------------------------------------------------------------------

alter TABLE suppliers
ADD (CONSTRAINT city_id_FK foreign key(city_id) references countries(city_id));

alter TABLE suppliers
ADD (CONSTRAINT country_id_FK foreign key(country_id) references countries(country_id));

-------------------------------------------------------------------

alter table pi_details
add constraint item_id_FK FOREIGN key(item_id) references Item_setups(item_id);

alter table pi_details
add constraint pi_id_FK FOREIGN key(pi_id) references pi_setups(pi_id);
-----------------------------------------------------



alter table pi_setups
add constraint curr_ID_FK FOREIGN key(currency_id) references CURRENCIES(currency_id);
---------------------------------------PI
alter table pi_setups
add constraint sup_id_FK FOREIGN key(sup_id) references suppliers(sup_id);
----------------------------------------PI
alter table pi_setups
add constraint buyer_id_FK FOREIGN key(buyer_id) references buyers(buyer_id);
-------------------------------------------------------------------



alter table stock_recevied
add constraint pl_id_FK foreign key(pl_id) references PL_setups(Pl_id);

---------------------------------------------



alter table PL_SETUPS
add constraint pl_lc_id_fk foreign key (lc_id) references lc_setups(lc_id);

alter table PL_SETUPS
add constraint pl_port_id_FK foreign key(port_id ) references PORTS(port_id);

---------------------------------------



alter table item_setups
add constraint size_id_fk foreign key(size_id) references sizes(size_id);

ALTER TABLE item_setups
ADD category_id NUMBER 

ALTER TABLE item_setups
ADD constraint CAT_id_fk_IN_ITM foreign key CATEGORIES(category_id)

alter table item_setups
add constraint item_sub_id_fk foreign key (sub_category_id) references sub_categories(sub_category_id);

alter table item_setups
add constraint uom_id_fk foreign key (uom_id) references uoms(uom_id);

alter table item_setups
add constraint brand_id_fk foreign key (BRAND_ID) references brands(BRAND_ID);



------------------------------------------
alter table opening_stock
add constraint opn_stk_itm_id_fk foregin_key (Item_id) references item_setups(item_id);



alter table PL_details
add constraint pl_id_FK foreign key (pl_id) references PL_setups(pl_id);

alter table PL_details
add constraint item_id_FK foreign key (item_id) references Item_setups(item_id);

alter table PL_details
add constraint uom_id_FK foreign key (uom_id) references uoms(uom_id);
---------------------------------------------------

alter table pl_cost_details
add constraint plcost_dtl_id_FK foreign key (pl_id) references PL_setups(pl_id);


alter table pl_cost_details
add constraint cost_id_FK foreign key(cost_id) references cost(cost_id);


alter table stock_details
add constraint stk_id_fk foreign key (stk_id) references stock_received(stk_id);


alter table stock_details
add constraint item_id_fk foreign key (item_id) references item_setups(item_id);
















