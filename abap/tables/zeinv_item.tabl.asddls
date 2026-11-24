@EndUserText.label : 'E-Rechnung Position (Schulung)'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zeinv_item {
  key client     : abap.clnt not null;
  key invoice_id : abap.char(10) not null;
  key item_no    : abap.numc(4) not null;
  description    : abap.char(40);
  quantity       : abap.dec(13,3);
  unit_price     : abap.dec(15,2);
  net_amount     : abap.dec(15,2);
  tax_rate       : abap.dec(5,2);   " in Prozent
}
