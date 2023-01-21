#INCLUDE "Protheus.ch"  
#include 'parmtype.ch'
#INCLUDE "FWMBROWSE.CH"
#INCLUDE "FWMVCDEF.CH"

/*/{Protheus.doc} User Function MORA9999
  Tela MVC TABELA Z19
  @type  User Function
  @author Kleyson Gomes
  @since 14/01/2023
  @version 12.33
  @return 
/*/
User Function MORA9999()

  Private aRotinaZ19   := MenuDef()
  private cTitulo      := "Importação de Arquivos XML"
  Private cTabela      := "Z19"
  Private cFilTop      := ""

  oBrowse:=FWMBrowse():New()

  dbSelectArea(cTabela)
  dbSetOrder(1)
  dbGoTop()

  oBrowse:SetFilterDefault(cFilTop)
  oBrowse:SetDescripition(cTitulo)
  oBrowse:SetAlias(cTabela)
  aColunas := {}
  oBrowse:Activate()

Return 

/*/{Protheus.doc} MenuDef
  @type  Static Function
  @author Kleyson Gomes
  @since 14/01/2023
  @version 12.33
  @param
  @return aRotinaZ19
  @example
/*/
Static Function MenuDef()
  
  Local aRotinaZ19 := {}
    
	aAdd( aRotinaZ19, { 'Visualizar'	, 'VIEWDEF.MORA9999', 0, 2, 0, NIL } )
	aAdd( aRotinaZ19, { 'Incluir' 		, 'VIEWDEF.MORA9999', 0, 3, 0, NIL } )
	aAdd( aRotinaZ19, { 'Alterar' 		, 'VIEWDEF.MORA9999', 0, 4, 0, NIL } )
	aAdd( aRotinaZ19, { 'Excluir' 		, 'VIEWDEF.MORA9999', 0, 5, 0, NIL } )

Return aRotinaZ19

/*/{Protheus.doc} ModelDef
  (long_description)
  @type  Static Function
  @author Kleyson Gomes
  @since 15/01/2023
  @version version
  @param 
  @return oModel
/*/
Static Function ModelDef()
  
  Local oStructZ19 := FWFormStruct(1, 'Z19')
  Local oModel

  oModel := MPFormModel():New('Z19MODEL')
  oModel:AddFields('FIELDSZ19', ,oStructZ19)
  oModel:SetPrimaryKey({"Z19_FILIAL","Z19_SEQIMP"})
  oModel:SetDescription("Importação de Arquivos XML")

Return oModel

/*/{Protheus.doc} User Function legXml
  @type  Static Function
  @author Kleyson Gomes
  @since 14/01/2023
  @version 12.33
  @return Nil
  /*/
Static Function ViewDef() 

	Local oModel := FWLoadModel('MORA9999')
	Local oStruZ19  := FWFormStruct( 2, 'Z19' )
	
	oViewZ19 := FWFormView():New()
	oViewZ19:SetModel(oModel)
	oViewZ19:AddField('VIEW_Z19', oStruZ19, 'FIELDSZ19')
	oViewZ19:CreateHorizontalBox('TELA',100)
	oViewZ19:SetOwnerView('VIEW_Z19','TELA')

Return oViewZ19
