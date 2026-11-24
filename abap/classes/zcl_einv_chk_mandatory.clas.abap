CLASS zcl_einv_chk_mandatory DEFINITION PUBLIC FINAL
  INHERITING FROM zcl_einv_check_base CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS check REDEFINITION.
ENDCLASS.

CLASS zcl_einv_chk_mandatory IMPLEMENTATION.
  METHOD check.
    IF is_head-buyer_ref IS INITIAL.
      APPEND finding( iv_invoice = is_head-invoice_id
                      iv_message = `Leitweg-ID (BT-10) fehlt` ) TO rt_findings.
    ENDIF.
    IF is_head-supplier_vatid IS INITIAL.
      APPEND finding( iv_invoice = is_head-invoice_id
                      iv_message = `USt-IdNr. des Lieferanten fehlt` ) TO rt_findings.
    ENDIF.
    IF it_items IS INITIAL.
      APPEND finding( iv_invoice = is_head-invoice_id
                      iv_message = `Rechnung ohne Positionen` ) TO rt_findings.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
