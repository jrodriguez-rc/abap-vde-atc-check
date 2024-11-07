@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Virtual Data Element Check'

define root view entity ZC_VirtualDataElementCheck
  provider contract transactional_query
  as projection on ZI_VirtualDataElementCheck
{

  key     UUID,

          Value,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUALDATAELEMENTCHECK'
  virtual VDE : abap.char(255)

}
