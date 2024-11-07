CLASS zcl_virtualdataelementcheck DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_virtualdataelementcheck IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA Content TYPE STANDARD TABLE OF ZC_VirtualDataElementCheck WITH DEFAULT KEY.

    Content = CORRESPONDING #( it_original_data ).

    LOOP AT Content ASSIGNING FIELD-SYMBOL(<Definition>).

      IF     <Definition>-Value IS NOT INITIAL
         AND line_exists( it_requested_calc_elements[ table_line = `VDE` ] ).

        <Definition>-vde = <Definition>-Value.

      ENDIF.

    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( Content ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    CLEAR et_requested_orig_elements.

    IF line_exists( it_requested_calc_elements[ table_line = `VDE` ] ).
      INSERT `VALUE` INTO TABLE et_requested_orig_elements.
    ENDIF.

  ENDMETHOD.


ENDCLASS.
