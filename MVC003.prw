#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.CH'

user function MVC003()

	Local oBrw := FWMBrowse():New()
	
	oBrw:SetDescription("Cadastro de Tipos de Chamados")
	oBrw:SetAlias("ZZC")
	oBrw:Activate()
	
return

Static Function ModelDef()

	Local oStruZZC := FwFormStruct(1,"ZZC")
	Local oModel   := MPFormModel():New("MVC003_M")
	
	oModel:AddFields("ZZCMASTER", /*owner*/, oStruZZC)
	oModel:SetDescription("Cadastro de Tipos de Chamados")
	oModel:SetPrimaryKey({})
	oModel:GetModel("ZZCMASTER"):SetDescription("Cadastro de Tipos de Chamados")

Return oModel

Static Function ViewDef()
	Local oModel   := FwLoadModel("MVC003")
	Local oStruZZC := FwFormStruct(2, "ZZC")
	Local oView
	
	oView := FwFormView():New()
	
	oView:SetModel(oModel)
	oView:AddField("VIEW_ZZC", oStruZZC, "ZZCMASTER")
	oView:CreateHorizontalBox("TELA", 100)
	oView:SetOwnerView("VIEW_ZZC","TELA")

Return oView

Static Function MenuDef()
	
Return FWMVCMenu("MVC003")
	  

	