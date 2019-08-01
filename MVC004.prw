#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.CH'

user function MVC004()

	Local oBrw := FWMBrowse():New()
	
	oBrw:SetDescription("Cadastro Chamados")
	oBrw:SetAlias("ZZD")
	oBrw:Activate()
	
return

Static Function ModelDef()

	Local oStruZZD := FwFormStruct(1,"ZZD")
	Local oModel   := MPFormModel():New("MVC004_M")
	
	oModel:AddFields("ZZDMASTER", /*owner*/, oStruZZD)
	oModel:SetDescription("Cadastro de Chamados")
	oModel:SetPrimaryKey({})
	oModel:GetModel("ZZDMASTER"):SetDescription("Cadastro de Chamados")

Return oModel

Static Function ViewDef()
	Local oModel   := FwLoadModel("MVC004")
	Local oStruZZD := FwFormStruct(2, "ZZD")
	Local oView
	
	oView := FwFormView():New()
	
	oView:SetModel(oModel)
	oView:AddField("VIEW_ZZD", oStruZZD, "ZZDMASTER")
	oView:CreateHorizontalBox("TELA", 100)
	oView:SetOwnerView("VIEW_ZZD","TELA")

Return oView

Static Function MenuDef()
	
Return FWMVCMenu("MVC004")
	  

Return
	