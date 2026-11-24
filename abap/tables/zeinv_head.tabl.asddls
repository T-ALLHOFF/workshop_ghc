@EndUserText.label : 'E-Rechnung Kopf (Schulung)'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zeinv_head {
  key client     : abap.clnt not null;
  key invoice_id : abap.char(10) not null;
  supplier_name  : abap.char(40);
  supplier_vatid : abap.char(20);
  buyer_ref      : abap.char(46);   " Leitweg-ID (BT-10)
  invoice_date   : abap.dats;
  due_date       : abap.dats;
  currency       : abap.char(3);
  net_amount     : abap.dec(15,2);
  tax_amount     : abap.dec(15,2);
  gross_amount   : abap.dec(15,2);
  status         : abap.char(1);    " N=neu, P=geprüft, E=Fehler
}
