CLASS zcl_virtualdataelementcheckgen DEFINITION
  PUBLIC
  INHERITING FROM cl_xco_cp_adt_simple_classrun FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

  PROTECTED SECTION.
    METHODS main REDEFINITION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_virtualdataelementcheckgen IMPLEMENTATION.


  METHOD main.

    DATA content TYPE STANDARD TABLE OF zvde_atc_check WITH KEY uuid.

    DELETE FROM zvde_atc_check.

    DATA(uuid_factory) = cl_uuid_factory=>create_system_uuid( ).

    content = VALUE #( ( uuid  = uuid_factory->create_uuid_x16( )
                         value = 'Line 1' )
                       ( uuid = uuid_factory->create_uuid_x16( ) ) ).

    INSERT zvde_atc_check FROM TABLE @content.

    COMMIT WORK AND WAIT.

  ENDMETHOD.


ENDCLASS.
