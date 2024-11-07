@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Virtual Data Element Check'

define root view entity ZI_VirtualDataElementCheck
  as select from zvde_atc_check
{

  key uuid  as UUID,

      value as Value

}
