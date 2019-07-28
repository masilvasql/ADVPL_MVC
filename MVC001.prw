#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.ch'

user function MVC001()
	Local oBrw := FwMBrowse():New()
	
	oBrw:SetDescription("Cadastro de Técnicos")
	oBrw:SetAlias("ZZA")
	oBrw:Activate()
	
return

Static Function ModelDef()
	//Cria a estrutura a ser usada no modelo de dados
	Local oStruZZA := FwFormStruct(1, "ZZA") // 1 é model e 2 é view 
	
	//Cria o objeto do modelo de dados
	Local oModel   := MPFormModel():New("MVC001_M")
	
	//Adiciona ao modelo de dados um componente de formulário
	oModel:AddFields("ZZAMASTER", /*owner*/, oStruZZA)
	
	//Adiciona a descrição do modelo de dados
	oModel:SetDescription("Cadastro de Técnicos")
	
	//O método SetPrimaryKey em 4, deve ser usado quando o X2_UNICO não tiver sido informado, caso não precise passe ‘{}’ como parâmetro.
	oModel:SetPrimaryKey({'ZZA_FILIAL', 'ZZA_COD'})
	
	//Adiciona a descrição do componente do modelo de dados
	oModel:GetModel("ZZAMASTER"):SetDescription("Cadastro de Técnicos")
Return(oModel)

Static Function ViewDef()

	//Cria um objeto de modelo de dados baseado no ModelDef() do fonte informado
	Local oModel 	:= FwLoadModel("MVC001")
	
	//Cria a estrutura a ser usada na view
	Local oStruZZA  := FwFormStruct(2,"ZZA")
	
	//interface de visualização a ser construída
	Local oView
	
	//Cria o objeto da view
	oView := FWFormView():New()
	
	//Define qual o modelo de dados será utilizado na view
	oView:SetModel(oModel)
	
	//adiciona ao nosso View um controle do tipo do formulário
	oView:AddField("VIEW_ZZA", oStruZZA, "ZZAMASTER")
	
	//criar um 'Box' horizontal para receber algum elemento da view
	oView:CreateHorizontalBox("TELA",100)
	
	//Relaciona o identificador (ID) da view com o 'box' para exibição
	oView:SetOwnerView('VIEW_ZZA', 'TELA')
Return (oView)

Static Function MenuDef()
	
Return FWMVCMenu('MVC001') // cria os campos de inclusão, alteração ... 