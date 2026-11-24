CLASS zcl_einv_check_base DEFINITION PUBLIC ABSTRACT CREATE PUBLIC.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_finding,
             invoice_id TYPE zeinv_head-invoice_id,
             check_id   TYPE string,
             severity   TYPE c LENGTH 1,   " E=Fehler, W=Warnung
             message    TYPE string,
           END OF ty_finding,
           tt_findings TYPE STANDARD TABLE OF ty_finding WITH EMPTY KEY,
           tt_items    TYPE STANDARD TABLE OF zeinv_item WITH EMPTY KEY.
    METHODS check ABSTRACT
      IMPORTING is_head            TYPE zeinv_head
                it_items           TYPE tt_items
      RETURNING VALUE(rt_findings) TYPE tt_findings.
  PROTECTED SECTION.
    METHODS finding
      IMPORTING iv_invoice   TYPE zeinv_head-invoice_id
                iv_severity  TYPE c DEFAULT 'E'
                iv_check_id  TYPE string OPTIONAL
                iv_message   TYPE string
      RETURNING VALUE(rs_finding) TYPE ty_finding.
ENDCLASS.

CLASS zcl_einv_check_base IMPLEMENTATION.
  METHOD finding.
    DATA(lv_check_id) = iv_check_id.
    IF lv_check_id IS INITIAL.
      lv_check_id = cl_abap_classdescr=>get_class_name( me ).
    ENDIF.
    rs_finding = VALUE #(
      invoice_id = iv_invoice
      check_id   = lv_check_id
      severity   = iv_severity
      message    = iv_message ).
  ENDMETHOD.
ENDCLASS.
