#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.CH'

user function MVC005()
	
	Local oBrw:=FwmBrowse():New()
	
	oBrw:setDescription("Cadastro de técnicos")
	oBrw:SetAlias("ZZA")
	oBrw:Activate()
	
return

static function ModelDef()
	Local oModel     := Nil
	Local oStruZZA   := FwFormStruct(1, "ZZA")
	Local oStruZZD   := FwFormStruct(1, "ZZD")
	
	Local oModel   := MPFormModel():New("MVC005_M")
	
	oModel:AddFields("ZZAMASTER", /*owner*/, oStruZZA)
	
	//RELACIONAMENTO DE TABELAS
	
	oModel:AddGrid("ZZDDETAIL", "ZZAMASTER", oStruZZD)
	oModel:SetRelation("ZZDDETAIL",{{"ZZD_FILIAL", "xFilial('ZZA')"},{"ZZD_TECNIC", "ZZA_COD"}},ZZD->(IndexKey(1)))
	oModel:SetDescription("Chamado por Atendente")
	oModel:SetPrimaryKey({'ZZA_FILIAL', 'ZZA_COD'})
	oModel:GetModel("ZZAMASTER"):SetDescription("Chamados por atendente")
	oModel:GetModel("ZZDDETAIL"):setOptional(.T.)
	oModel:setActivate()
	
Return oModel

Static Function viewDef()

	Local oModel := FwLoadModel("MVC005")
	
	Local oStrZZA := FWFormStruct(2, "ZZA", {|cCpo|AllTrim(cCpo) $ "ZZA_COD+ZZA_NOME"})
	Local oStrZZD := FWFormStruct(2, "ZZD")
	
	Local oView
	
	oStrZZD:SetNoFolder() // não cria abas
	oView := FwFormView():New()
	oView:SetModel(oModel)
	
	oView:AddField('VIEW_ZZA', oStrZZA, "ZZAMASTER")
	oView:AddGrid('VIEW_ZZD', oStrZZD, "ZZDDETAIL")
	
	oView:CreateHorizontalBox('SUPERIOR', 15)
	oView:CreateHorizontalBox('INFERIOR', 85)
	
	oView:SetOwnerView("VIEW_ZZA", "SUPERIOR")
	oView:SetOwnerView("VIEW_ZZD", "INFERIOR")
	
Return oView

static function MenuDef()
	Local aRotina := {}
	ADD OPTION aRotina TITLE "Vis. Chamados" ACTION 'U_ChamAten(ZZA->ZZA_COD)' OPERATION 1 ACCESS 0
Return aRotina

User Function ChamAten(cCodAtend)
	
	lRetorno := .T.

	If !Empty(cCodAtend)
		dbSelectArea("ZZD")
		dbSetOrder(1)
		
		If dbSeek(xFilial("ZZD")+cCodAtend)
			FWExecView(Upper("Visualizar"), "VIEWDEF.MVC005",1)
		EndIf
	ELSE
		MsgAlert("Selecione um atendente para visualizar", 'Aviso!')
	EndIf
	
Return lRetorno	
