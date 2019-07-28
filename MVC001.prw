#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FWMVCDEF.ch'

user function MVC001()
	Local oBrw := FwMBrowse():New()
	
	oBrw:SetDescription("Cadastro de T�cnicos")
	oBrw:SetAlias("ZZA")
	oBrw:Activate()
	
return

Static Function ModelDef()
	//Cria a estrutura a ser usada no modelo de dados
	Local oStruZZA := FwFormStruct(1, "ZZA") // 1 � model e 2 � view 
	
	//Cria o objeto do modelo de dados
	Local oModel   := MPFormModel():New("MVC001_M")
	
	//Adiciona ao modelo de dados um componente de formul�rio
	oModel:AddFields("ZZAMASTER", /*owner*/, oStruZZA)
	
	//Adiciona a descri��o do modelo de dados
	oModel:SetDescription("Cadastro de T�cnicos")
	
	//O m�todo SetPrimaryKey em 4, deve ser usado quando o X2_UNICO n�o tiver sido informado, caso n�o precise passe �{}� como par�metro.
	oModel:SetPrimaryKey({'ZZA_FILIAL', 'ZZA_COD'})
	
	//Adiciona a descri��o do componente do modelo de dados
	oModel:GetModel("ZZAMASTER"):SetDescription("Cadastro de T�cnicos")
Return(oModel)

Static Function ViewDef()

	//Cria um objeto de modelo de dados baseado no ModelDef() do fonte informado
	Local oModel 	:= FwLoadModel("MVC001")
	
	//Cria a estrutura a ser usada na view
	Local oStruZZA  := FwFormStruct(2,"ZZA")
	
	//interface de visualiza��o a ser constru�da
	Local oView
	
	//Cria o objeto da view
	oView := FWFormView():New()
	
	//Define qual o modelo de dados ser� utilizado na view
	oView:SetModel(oModel)
	
	//adiciona ao nosso View um controle do tipo do formul�rio
	oView:AddField("VIEW_ZZA", oStruZZA, "ZZAMASTER")
	
	//criar um 'Box' horizontal para receber algum elemento da view
	oView:CreateHorizontalBox("TELA",100)
	
	//Relaciona o identificador (ID) da view com o 'box' para exibi��o
	oView:SetOwnerView('VIEW_ZZA', 'TELA')
Return (oView)

Static Function MenuDef()
	
Return FWMVCMenu('MVC001') // cria os campos de inclus�o, altera��o ... 