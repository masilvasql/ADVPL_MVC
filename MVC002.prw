#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.CH'

user function MVC002()

	Local oBrw := FWMBrowse():New()
	
	oBrw:SetDescription("Cadastro de SLA")
	oBrw:SetAlias("ZZB")
	oBrw:Activate()
	
return

Static Function ModelDef()

	Local oStruZZB := FwFormStruct(1,"ZZB")
	Local oModel   := MPFormModel():New("MVC002_M")
	
	oModel:AddFields("ZZBMASTER", /*owner*/, oStruZZB)
	oModel:SetDescription("Cadastro de SLA")
	oModel:SetPrimaryKey({})
	oModel:GetModel("ZZBMASTER"):SetDescription("Cadastro de SLA")

Return oModel

Static Function ViewDef()
	Local oModel   := FwLoadModel("MVC002")
	Local oStruZZB := FwFormStruct(2, "ZZB")
	Local oView
	
	oView := FwFormView():New()
	
	oView:SetModel(oModel)
	oView:AddField("VIEW_ZZB", oStruZZB, "ZZBMASTER")
	oView:CreateHorizontalBox("TELA", 100)
	oView:SetOwnerView("VIEW_ZZB","TELA")

Return oView

Static Function MenuDef()
	
Return FWMVCMenu("MVC002")
	  

	