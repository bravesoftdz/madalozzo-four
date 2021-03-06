unit UClsCalcNF;

interface

uses
  contnrs,
  ELibFnc,
  Classes;

const
        //                                AC AL AM AP BA CE DF ES GO MA MT MS MG PA PB PR PE PI RN RS RJ RO RR SC SP SE TO

  cAliquotaAC: array[0..26] of Integer = (17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaAL: array[0..26] of Integer = (12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaAM: array[0..26] of Integer = (12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaAP: array[0..26] of Integer = (12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaBA: array[0..26] of Integer = (12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaCE: array[0..26] of Integer = (12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaDF: array[0..26] of Integer = (12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaES: array[0..26] of Integer = (12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaGO: array[0..26] of Integer = (12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaMA: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaMT: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaMS: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaMG: array[0..26] of Integer = (07,07,07,07,07,07,07,07,07,07,07,07,18,07,07,12,07,07,07,12,12,07,07,12,12,07,07);
  cAliquotaPA: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaPB: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12);
  cAliquotaPR: array[0..26] of Integer = (07,07,07,07,07,07,07,07,07,07,07,07,12,07,07,18,07,07,07,12,12,07,07,12,12,07,07);
  cAliquotaPE: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12);
  cAliquotaPI: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12);
  cAliquotaRN: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12);
  cAliquotaRS: array[0..26] of Integer = (07,07,07,07,07,07,07,07,07,07,07,07,12,07,07,12,07,07,07,17,12,07,07,12,12,07,07);
  cAliquotaRJ: array[0..26] of Integer = (07,07,07,07,07,07,07,07,07,07,07,07,12,07,07,12,07,07,07,12,18,07,07,12,12,07,07);
  cAliquotaRO: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12);
  cAliquotaRR: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12);
  cAliquotaSC: array[0..26] of Integer = (07,07,07,07,07,07,07,07,07,07,07,07,12,07,07,12,07,07,07,12,12,07,07,17,12,07,07);
  cAliquotaSP: array[0..26] of Integer = (07,07,07,07,07,07,07,07,07,07,07,07,12,07,07,12,07,07,07,12,12,07,07,12,18,07,07);
  cAliquotaSE: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12);
  cAliquotaTO: array[0..26] of Integer = (12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17);

type
  TCST_ICMS = (
    cst00,
    cst10,
    cst20,
    cst30,
    cst40,
    cst41,
    cst45,
    cst50,
    cst51,
    cst60,
    cst70,
    cst80,
    cst81,
    cst90,
    cstPart10,
    cstPart90,
    cstRep41,
    cstVazio,
    cstICMSOutraUF,
    cstICMSSN
    );

  TCST_IPI = (
    ipi00,
    ipi49,
    ipi50,
    ipi99,
    ipi01,
    ipi02,
    ipi03,
    ipi04,
    ipi05,
    ipi51,
    ipi52,
    ipi53,
    ipi54,
    ipi55
  );

  TCST_PIS = (
    pis01,
    pis02,
    pis03,
    pis04,
    pis06,
    pis07,
    pis08,
    pis09,
    pis49,
    pis50,
    pis51,
    pis52,
    pis53,
    pis54,
    pis55,
    pis56,
    pis60,
    pis61,
    pis62,
    pis63,
    pis64,
    pis65,
    pis66,
    pis67,
    pis70,
    pis71,
    pis72,
    pis73,
    pis74,
    pis75,
    pis98,
    pis99
  );

  TCST_COFINS =(
    cof01,
    cof02,
    cof03,
    cof04,
    cof06,
    cof07,
    cof08,
    cof09,
    cof49,
    cof50,
    cof51,
    cof52,
    cof53,
    cof54,
    cof55,
    cof56,
    cof60,
    cof61,
    cof62,
    cof63,
    cof64,
    cof65,
    cof66,
    cof67,
    cof70,
    cof71,
    cof72,
    cof73,
    cof74,
    cof75,
    cof98,
    cof99
  );

  TCRT = ( 
    crtSimplesNacional,
    crtSimplesExcessoReceita,
    crtRegimeNormal
  );

  TCSOSN = (
    csosn101,
    csosn102,
    csosn103,
    csosn201,
    csosn202,
    csosn203,
    csosn300,
    csosn400,
    csosn500,
    csosn900
  );

  TNotaFiscal = class;

  TEstados = class
  private
    {private declarations}
  protected
    {protected declarations}
  public
    {public declarations}
    class function CodEstado(const pEstado: String): SmallInt;
    class function CodIBGEEstado(const pEstado: String): SmallInt;
    class function AliquotaInterEstadual(const pEstadoOrigem: String; const pEstadoDestino: String): Double; overload;
    class function AliquotaInterEstadual(const pEstadoOrigem: String): Double; overload;
  end;

  TPessoaFisJur = class(TComponent)
  private
    {private declarations}
    FNomeRazaoSocial: String;
    FEstado: String;
    FCRT: TCRT;
    FALiqCSOSN: Double;
  protected
    {protected declarations}
  public
    {public declarations}
    constructor Create(AOwner: TComponent); override;
    procedure Assign(const pPessoaFisJur: TPessoaFisJur); reintroduce;
    procedure Inicializar;

    property NomeRazaoSocial: String read FNomeRazaoSocial write FNomeRazaoSocial;
    property Estado: String read FEstado write FEstado;
    property CRT: TCRT read FCRT write FCRT;
    property ALiqCSOSN: Double read FALiqCSOSN write FALiqCSOSN;
  end;

  TDuplicataNF = class(TComponent)
  private
    {private declarations}
  protected
    {protected declarations}
  public
    {public declarations}
    constructor Create(AOwner: TComponent); override;

    procedure Assign(const pDuplicataNF: TDuplicataNF); reintroduce;
    procedure Inicializar; virtual;
  end;

  TDuplicatasNF = class(TObjectList)
  protected
    {protected declarations}
    function GetDuplicataNF(Index: Integer): TDuplicataNF;
    procedure SetDuplicataNF(Index: Integer; ADuplicataNF: TDuplicataNF);
  public
    {public declarations}
    function Add(ANotaFiscal: TNotaFiscal; ADuplicataNF: TDuplicataNF): Integer;
    function Remove(ADuplicataNF: TDuplicataNF): Integer;
    function IndexOf(ADuplicataNF: TDuplicataNF): Integer;
    procedure Insert(Index: Integer; ADuplicataNF: TDuplicataNF);
    property Items[Index: Integer]: TDuplicataNF read GetDuplicataNF write SetDuplicataNF; default;
  end;

  TItemNF = class(TComponent)
  private
    {private declarations}
    FCodProduto: String;
    FValorUnitario: Currency;
    FValorDesconto: Currency;
    FQuantidade: Double;
    FDescProduto: String;
    FItem: Integer;
    FNCMSH: String;
    FAliqIPI: Double;
    FAliqMVA: Double;
    FPeso: Double;
    FCST_ICMS: TCST_ICMS;
    FCST_PIS: TCST_PIS;
    FCST_COFINS: TCST_COFINS;
    FCST_IPI: TCST_IPI;
    FCSOSN: TCSOSN;

    FReducaoICMS: Double;
    FReducaoICMSst: Double; 
    FAliquotaICMS: Double;
    FAliquotaICMSst: Double; 	
	
	// calcula icms conforme configuração cfop
    FComFrete : Boolean;
    FComSegur : Boolean;
    FComDespe : Boolean;
    FComDesco : Boolean;
    FComIpi   : Boolean;
	
    procedure SetComFrete(const Value: Boolean);
    procedure SetComSegur(const Value: Boolean);
    procedure SetComDespe(const Value: Boolean);
    procedure SetComDesco(const Value: Boolean);
    procedure SetComIpi(const Value: Boolean);
	
    procedure SetReducaoICMSst(const Value: Double);
    procedure SetReducaoICMS(const Value: Double);
    procedure SetAliquotaICMS(const Value: Double); 
    procedure SetAliquotaICMSst(const Value: Double);
	
    function GetBC_ICMS_ST: Currency;
    function GetBC_ICMS_OP: Currency;
    function GetBC_IPI: Currency;
    function GetVL_DESPAC_PROP: Currency;
    function GetVL_FRETE_PROP: Currency;
    function GetVL_SEGUR_PROP: Currency;
    function GetPC_PROP_NF: Double;
    function GetVL_TOTAL_BRT: Currency;
    function GetVL_ICMS_OP: Currency;
    function GetVL_IPI: Currency;
    function GetVL_MVA: Currency;
    function GetVL_ICMS_ST: Currency;
    function GetVL_TOTAL_LIQ: Currency;
    function GetVL_CREDITO_CSOSN: Currency;
  protected
    {protected declarations}
    function NotaFiscal: TNotaFiscal;
  public
    {public declarations}
    constructor Create(AOwner: TComponent); override;

    procedure Assign(const pItemNF: TItemNF); reintroduce;
    procedure Inicializar; virtual;

    property Item: Integer read FItem write FItem;
    property CodProduto: String read FCodProduto write FCodProduto;
    property DescProduto: String read FDescProduto write FDescProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;
    property ValorDesconto: Currency read FValorDesconto write FValorDesconto;
    property NCMSH: String read FNCMSH write FNCMSH;
    property AliqIPI: Double read FAliqIPI write FAliqIPI;
    property AliqMVA: Double read FAliqMVA write FAliqMVA;
    property Peso: Double read FPeso write FPeso;
    property CST_ICMS: TCST_ICMS read FCST_ICMS write FCST_ICMS;
    property CST_IPI: TCST_IPI read FCST_IPI write FCST_IPI;
    property CST_PIS: TCST_PIS read FCST_PIS write FCST_PIS;
    property CST_COFINS: TCST_COFINS read FCST_COFINS write FCST_COFINS;
    property CSOSN: TCSOSN read FCSOSN write FCSOSN;
    property ReducaoICMSst: Double read FReducaoICMSst write SetReducaoICMSst;
    property ReducaoICMS: Double read FReducaoICMS write SetReducaoICMS;
    property AliquotaICMS: Double read FAliquotaICMS write SetAliquotaICMS;
    property AliquotaICMSst: Double read FAliquotaICMSst write SetAliquotaICMSst;
	
    property ComFrete: Boolean read FComFrete write SetComFrete;
    property ComSegur: Boolean read FComSegur write SetComSegur;
    property ComDespe: Boolean read FComDespe write SetComDespe;
    property ComDesco: Boolean read FComDesco write SetComDesco;
    property ComIpi:   Boolean read FComIpi   write SetComIpi;

    property VL_CREDITO_CSOSN: Currency read GetVL_CREDITO_CSOSN;
    property VL_TOTAL_LIQ: Currency read GetVL_TOTAL_LIQ;
    property VL_TOTAL_BRT: Currency read GetVL_TOTAL_BRT;
    property BC_ICMS_OP: Currency read GetBC_ICMS_OP;
    property BC_ICMS_ST: Currency read GetBC_ICMS_ST;
    property VL_ICMS_OP: Currency read GetVL_ICMS_OP;
    property VL_ICMS_ST: Currency read GetVL_ICMS_ST;
    property BC_IPI: Currency read GetBC_IPI;
    property VL_IPI: Currency read GetVL_IPI;
    property VL_FRETE_PROP: Currency read GetVL_FRETE_PROP;
    property VL_SEGUR_PROP: Currency read GetVL_SEGUR_PROP;
    property VL_DESPAC_PROP: Currency read GetVL_DESPAC_PROP;
    property PC_PROP_NF: Double read GetPC_PROP_NF;
    property VL_MVA: Currency read GetVL_MVA;
  end;

  TEmitenteNF = class(TPessoaFisJur)
  private
    {private declarations}
  protected
    {protected declarations}
  public
    {public declarations}
  end;

  TDestinatarioNF = class(TPessoaFisJur)
  private
    {private declarations}
  protected
    {protected declarations}
  public
    {public declarations}
  end;

  TTransporteNF = class(TPessoaFisJur)
  private
    {private declarations}
  protected
    {protected declarations}
  public
    {public declarations}
  end;

  TItensNF = class(TObjectList)
  protected
    {protected declarations}
    function GetItemNF(Index: Integer): TItemNF;
    procedure SetItemNF(Index: Integer; AItemNF: TItemNF);
  public
    {public declarations}
    function Add(ANotaFiscal: TNotaFiscal; AItemNF: TItemNF): Integer;
    function Remove(AItemNF: TItemNF): Integer;
    function IndexOf(AItemNF: TItemNF): Integer;
    procedure Insert(Index: Integer; AItemNF: TItemNF);
    property Items[Index: Integer]: TItemNF read GetItemNF write SetItemNF; default;
  end;

  TValoresNF = class(TComponent)
  private
    {private declarations}
    FVL_SEGURO: Currency;
    FVL_FRETE: Currency;
    FVL_DESPACESS: Currency;
    function GetVL_TOTAL_PROD: Currency;
    function GetVL_TOTAL_NF: Currency;
    function GetBS_ICMS: Currency;
    function GetVL_ICMS: Currency;
    function GetBS_ICMS_ST: Currency;
    function GetVL_ICMS_ST: Currency;
    function GetVL_CREDITO_CSOSN: Currency;
    function GetVL_DESCONTO: Currency;
  protected
    {protected declarations}
    function NotaFiscal: TNotaFiscal;
  public
    {public declarations}
    constructor Create(AOwner: TComponent); override;

    procedure Assign(const pValoresNF: TValoresNF); reintroduce;
    procedure Inicializar; virtual;

    property VL_FRETE: Currency read FVL_FRETE write FVL_FRETE;
    property VL_SEGURO: Currency read FVL_SEGURO write FVL_SEGURO;
    property VL_DESPACESS: Currency read FVL_DESPACESS write FVL_DESPACESS;
    property VL_TOTAL_PROD: Currency read GetVL_TOTAL_PROD;
    property VL_TOTAL_NF: Currency read GetVL_TOTAL_NF;
    property BS_ICMS: Currency read GetBS_ICMS;
    property VL_ICMS: Currency read GetVL_ICMS;
    property BS_ICMS_ST: Currency read GetBS_ICMS_ST;
    property VL_ICMS_ST: Currency read GetVL_ICMS_ST;
    property VL_CREDITO_CSOSN: Currency read GetVL_CREDITO_CSOSN;
    property VL_DESCONTO: Currency read GetVL_DESCONTO;
  end;

  TNotaFiscal = class(TComponent)
  private
    {private declarations}
    FItensNF: TItensNF;
    FDuplicatasNF: TDuplicatasNF;
    FDestinatarioNF: TDestinatarioNF;
    FEmitenteNF: TEmitenteNF;
    FTransporteNF: TTransporteNF;
    FValoresNF: TValoresNF;
    FObservacoes: TStrings;
    function GetPeso: Double;
    function GetNroItens: Integer;
  public
    {public declarations}
    constructor Create(AOwner: TComponent); override;
    procedure Inicializar;

    property EmitenteNF: TEmitenteNF read FEmitenteNF write FEmitenteNF;
    property DestinatarioNF: TDestinatarioNF read FDestinatarioNF write FDestinatarioNF;
    property TransporteNF: TTransporteNF read FTransporteNF write FTransporteNF;
    property ItensNF: TItensNF read FItensNF write FItensNF;
    property DuplicatasNF: TDuplicatasNF read FDuplicatasNF write FDuplicatasNF;
    property ValoresNF: TValoresNF read FValoresNF write FValoresNF;
    property Observacoes: TStrings read FObservacoes write FObservacoes;
    property Peso: Double read GetPeso;
    property NroItens: Integer read GetNroItens;
  end;

  TFuncoes = class
    class function Percentual(const pPercentual: Double; const pValor: Currency): Currency;
    class function RetornaPercentual(const pValorTotal: Currency; const pValor: Currency): Currency;
  end;

implementation

uses
  dialogs,
  SysUtils;

{ TNotaFiscal }


constructor TNotaFiscal.Create(AOwner: TComponent);
begin
  inherited;
  FObservacoes := TStringList.Create;
  ItensNF := TItensNF.Create;
  DuplicatasNF := TDuplicatasNF.Create;
  EmitenteNF := TEmitenteNF.Create(Self);
  DestinatarioNF := TDestinatarioNF.Create(Self);
  TransporteNF := TTransporteNF.Create(Self);
  ValoresNF := TValoresNF.Create(Self);
end;

function TNotaFiscal.GetNroItens: Integer;
begin
  Result := FItensNF.Count;
end;

function TNotaFiscal.GetPeso: Double;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to ItensNF.Count -1 do
    Result := Result + ItensNF[lItens].Peso;
end;

procedure TNotaFiscal.Inicializar;
begin
  EmitenteNF.Inicializar;
  DestinatarioNF.Inicializar;
  TransporteNF.Inicializar;
  ValoresNF.Inicializar;
  ItensNF.Clear;
  DuplicatasNF.Clear;
  Observacoes.Clear;
end;

{ TItensNF }

function TItensNF.Add(ANotaFiscal: TNotaFiscal; AItemNF: TItemNF): Integer;
var
  lNovoItemNF: TItemNF;
begin
  lNovoItemNF := TItemNF.Create(ANotaFiscal);
  lNovoItemNF.Assign(AItemNF);
  Result := inherited Add(lNovoItemNF);
end;

function TItensNF.GetItemNF(Index: Integer): TItemNF;
begin
  Result := inherited Items[Index] as TItemNF;
end;

function TItensNF.IndexOf(AItemNF: TItemNF): Integer;
begin
  Result := inherited IndexOf(AItemNF);
end;

procedure TItensNF.Insert(Index: Integer; AItemNF: TItemNF);
begin
  inherited Insert(Index, AItemNF);
end;

function TItensNF.Remove(AItemNF: TItemNF): Integer;
begin
  Result := inherited Remove(AItemNF);
end;

procedure TItensNF.SetItemNF(Index: Integer; AItemNF: TItemNF);
begin
  Items[Index] := AItemNF;
end;

{ TDuplicatasNF }

function TDuplicatasNF.Add(ANotaFiscal: TNotaFiscal; ADuplicataNF: TDuplicataNF): Integer;
var
  lNovaDuplicataNF: TDuplicataNF;
begin
  lNovaDuplicataNF := TDuplicataNF.Create(ANotaFiscal);
  lNovaDuplicataNF.Assign(ADuplicataNF);
  Result := inherited Add(lNovaDuplicataNF);
end;

function TDuplicatasNF.GetDuplicataNF(Index: Integer): TDuplicataNF;
begin
  Result := inherited Items[Index] as TDuplicataNF;
end;

function TDuplicatasNF.IndexOf(ADuplicataNF: TDuplicataNF): Integer;
begin
  Result := inherited IndexOf(ADuplicataNF);
end;

procedure TDuplicatasNF.Insert(Index: Integer; ADuplicataNF: TDuplicataNF);
begin
  inherited Insert(Index, ADuplicataNF);
end;

function TDuplicatasNF.Remove(ADuplicataNF: TDuplicataNF): Integer;
begin
  Result := inherited Remove(ADuplicataNF);
end;

procedure TDuplicatasNF.SetDuplicataNF(Index: Integer; ADuplicataNF: TDuplicataNF);
begin
  Items[Index] := ADuplicataNF;
end;

{ TItemNF }

procedure TItemNF.Assign(const pItemNF: TItemNF);
begin
  Inicializar;

  CodProduto := pItemNF.CodProduto;
  ValorUnitario := pItemNF.ValorUnitario;
  ValorDesconto := pItemNF.ValorDesconto;
  Quantidade := pItemNF.Quantidade;
  DescProduto := pItemNF.DescProduto;
  Item := pItemNF.Item;
  NCMSH := pItemNF.NCMSH;
  AliqIPI := pItemNF.AliqIPI;
  AliqMVA := pItemNF.AliqMVA;
  Peso := pItemNF.Peso;
  CST_ICMS := pItemNF.CST_ICMS;
  CST_IPI := pItemNF.CST_IPI;
  CST_PIS := pItemNF.CST_PIS;
  CST_COFINS := pItemNF.CST_COFINS;
  CSOSN := pItemNF.CSOSN;
  ReducaoICMS := pItemNF.ReducaoICMS;
  ReducaoICMSst := pItemNF.ReducaoICMSst;
  AliquotaIcms := pItemNf.AliquotaICMS;
  AliquotaIcmsst := pItemNf.AliquotaICMSst;
  
  comIpi         := pItemNf.FComIpi;
  comDesco       := pItemNf.FComDesco;
  ComFrete       := pItemNf.FComFrete;
  ComSegur       := pItemNf.FComSegur;
  ComDespe       := pItemNf.FComDespe;
end;

constructor TItemNF.Create(AOwner: TComponent);
begin
  inherited;
  Inicializar;
end;

function TItemNF.GetBC_ICMS_OP: Currency;
var
 soma : currency;
begin
  soma:= 0;
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    if (CST_ICMS in [cst51]) and 
       ((NotaFiscal.EmitenteNF.Estado <> 'PR') then
     begin
       result:= 0;
     end else
   	if CST_ICMS in [cst30, cst40, cst41, cst50, cst60] then
      Result := 0
    else
    begin
//      Result := VL_TOTAL_BRT + VL_FRETE_PROP + VL_SEGUR_PROP + VL_DESPAC_PROP; //antes da alteração
    Soma := VL_TOTAL_BRT;
    if ComFrete then Soma := Soma + VL_FRETE_PROP;
    if ComSegur then Soma := Soma + VL_SEGUR_PROP;
    if ComDespe Then Soma := Soma + VL_DESPAC_PROP;
    if ComDesco Then Soma := Soma - VL_DESC_PROP;
    if ComIpi   Then Soma := Soma + VL_IPI;
    Result := Soma;

	if CST_ICMS in [cst20, cst70, cst90] then
        Result := (Result - TFuncoes.Percentual(ReducaoICMS, Result));
    end;
  end
  else
    Result := 0;
end;

function TItemNF.GetBC_ICMS_ST: Currency;
var
  soma : currency;
begin
  soma:= 0;
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    if CST_ICMS in [cst00, cst20, cst40, cst41, cst50, cst51] then
      Result := 0
    else
     begin
       Soma := VL_TOTAL_BRT + VL_IPI + VL_MVA;
       if ComFrete then Soma := Soma + VL_FRETE_PROP;
       if ComSegur then Soma := Soma + VL_SEGUR_PROP;
       if ComDespe Then Soma := Soma + VL_DESPAC_PROP;
       if ComDesco Then Soma := Soma - VL_DESC_PROP;
       Result := Soma;
	 end;  
	//Result := VL_TOTAL_BRT + VL_FRETE_PROP + VL_SEGUR_PROP + VL_DESPAC_PROP + VL_IPI + VL_MVA
  end
  else
    Result := 0;
end;

function TItemNF.GetBC_IPI: Currency;
begin
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
    Result := VL_TOTAL_BRT + VL_FRETE_PROP + VL_SEGUR_PROP + VL_DESPAC_PROP
  else
    Result := 0;
end;

function TItemNF.GetVL_CREDITO_CSOSN: Currency;
begin
  if (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    if (CSOSN in [csosn101, csosn201]) then
      Result := TFuncoes.Percentual(NotaFiscal.FEmitenteNF.ALiqCSOSN, VL_TOTAL_BRT)
    else
      Result := 0;
  end
  else
    Result := 0;
end;

function TItemNF.GetPC_PROP_NF: Double;
var
  lPart: Double;
begin
  Result := 100;

  if NotaFiscal.NroItens > 1 then
  begin
    lPart := TFuncoes.RetornaPercentual(NotaFiscal.ValoresNF.VL_TOTAL_PROD, VL_TOTAL_BRT);
    Result := TFuncoes.Percentual(lPart, Result);
  end;
end;

function TItemNF.GetVL_IPI: Currency;
begin
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    Result := TFuncoes.Percentual(AliqIPI, BC_IPI);
  end
  else
    Result := 0;
end;

function TItemNF.GetVL_MVA: Currency;
begin
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    Result := VL_TOTAL_BRT + VL_FRETE_PROP + VL_SEGUR_PROP + VL_DESPAC_PROP + VL_IPI;
    Result := TFuncoes.Percentual(AliqMVA, Result);
  end
  else
    Result := 0;
end;

function TItemNF.GetVL_DESPAC_PROP: Currency;
begin
  Result := TFuncoes.Percentual(PC_PROP_NF, NotaFiscal.ValoresNF.VL_DESPACESS);
end;

function TItemNF.GetVL_FRETE_PROP: Currency;
begin
  Result := TFuncoes.Percentual(PC_PROP_NF, NotaFiscal.ValoresNF.VL_FRETE);
end;

function TItemNF.GetVL_SEGUR_PROP: Currency;
begin
  Result := TFuncoes.Percentual(PC_PROP_NF, NotaFiscal.ValoresNF.VL_SEGURO);
end;

function TItemNF.GetVL_TOTAL_BRT: Currency;
begin
  Result := Quantidade * ValorUnitario;
end;

function TItemNF.GetVL_ICMS_OP: Currency;
var
  lAliq: Double;
begin
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    if CST_ICMS in [cst30, cst40, cst41, cst50, cst60] then
      Result := 0
    else
    begin
      lAliq := AliquotaIcms; //TEstados.AliquotaInterEstadual(NotaFiscal.EmitenteNF.Estado, NotaFiscal.DestinatarioNF.Estado); feito da forma antiga... pega o icms da classe
      Result := TFuncoes.Percentual(lAliq, BC_ICMS_OP);
    end;
  end
  else
    Result := 0;
end;

procedure TItemNF.Inicializar;
begin
  Item := 0;
  CodProduto := EmptyStr;
  DescProduto := EmptyStr;
  Quantidade := 0;
  ValorUnitario := 0;
  ValorDesconto := 0;
  NCMSH := EmptyStr;
  AliqIPI := 0;
  Peso := 0;
  AliqMVA := 0;
  CST_ICMS := cst41;
  CST_IPI := ipi99;
  CST_PIS := pis99;
  CST_COFINS := cof99;
  CSOSN := csosn900;
end;

procedure TItemNF.SetReducaoICMS(const Value: Double); 
begin 
  FReducaoICMS := Value; 
end; 

procedure TItemNF.SetReducaoICMSst(const Value: Double);
begin
  FReducaoICMSst := Value;
end;

procedure TItemNF.SetAliquotaICMS(const Value: Double);
begin
  FAliquotaICMS := Value;
end;

procedure TItemNF.SetAliquotaICMSst(const Value: Double);
begin
  FAliquotaICMSst := Value;
end;

procedure TItemNF.SetComFrete(const Value: Boolean);
begin
  FComFrete:= Value;
end;
procedure TItemNF.SetComSegur(const Value: Boolean);
begin
  FComSegur:= Value;
end;
procedure TItemNF.SetComDespe(const Value: Boolean);
begin
  FComDespe:= Value;
end;
procedure TItemNF.SetComDesco(const Value: Boolean);
begin
  FComDesco:= Value;
end;
procedure TItemNF.SetComIpi(const Value: Boolean);
begin
  FComIpi:= Value;
end;

function TItemNF.NotaFiscal: TNotaFiscal;
begin
  Result := (Owner as TNotaFiscal);
end;

function TItemNF.GetVL_ICMS_ST: Currency;
var
  lAliq: Double;
begin
  if not (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    if CST_ICMS in [cst00, cst20, cst40, cst41, cst50, cst51] then
      Result := 0
    else
    begin
      lAliq := aliquotaicmsst; //TEstados.AliquotaInterEstadual(NotaFiscal.EmitenteNF.Estado); feito da forma antiga
      Result := TFuncoes.Percentual(lAliq, BC_ICMS_ST);
      Result := Result - VL_ICMS_OP;
    end;
  end
  else
    Result := 0;
end;

function TItemNF.GetVL_TOTAL_LIQ: Currency;
begin
  Result := VL_TOTAL_BRT + VL_IPI + VL_FRETE_PROP + VL_SEGUR_PROP + VL_DESPAC_PROP + VL_ICMS_ST;
end;

{ TDuplicataNF }

procedure TDuplicataNF.Assign(const pDuplicataNF: TDuplicataNF);
begin

end;

constructor TDuplicataNF.Create(AOwner: TComponent);
begin
  inherited;
  Inicializar;
end;

procedure TDuplicataNF.Inicializar;
begin

end;

{ TPessoaFisJur }

procedure TPessoaFisJur.Assign(const pPessoaFisJur: TPessoaFisJur);
begin
  Inicializar;
  NomeRazaoSocial := pPessoaFisJur.NomeRazaoSocial;
  Estado := pPessoaFisJur.Estado;
  CRT := pPessoaFisJur.CRT;
  ALiqCSOSN := pPessoaFisJur.ALiqCSOSN;
end;

constructor TPessoaFisJur.Create(AOwner: TComponent);
begin
  inherited;
  Inicializar;
end;

procedure TPessoaFisJur.Inicializar;
begin
  NomeRazaoSocial := EmptyStr;
  Estado := EmptyStr;
  CRT := crtSimplesNacional;
  ALiqCSOSN := 0;
end;

{ TValoresNF }

procedure TValoresNF.Assign(const pValoresNF: TValoresNF);
begin

end;

constructor TValoresNF.Create(AOwner: TComponent);
begin
  inherited;
  Inicializar;
end;

function TValoresNF.GetBS_ICMS: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].BC_ICMS_OP;
end;

function TValoresNF.GetVL_TOTAL_NF: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].VL_TOTAL_LIQ;
end;

function TValoresNF.GetVL_TOTAL_PROD: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].VL_TOTAL_BRT;
end;

function TValoresNF.GetVL_CREDITO_CSOSN: Currency;
var
  lItens: SmallInt;
begin
  if (NotaFiscal.EmitenteNF.CRT = crtSimplesNacional) then
  begin
    Result := 0;

    for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
      Result := Result + NotaFiscal.ItensNF[lItens].VL_CREDITO_CSOSN;
  end
  else
    Result := 0;
end;

function TValoresNF.GetVL_DESCONTO: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].ValorDesconto;
end;

function TValoresNF.GetVL_ICMS: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].VL_ICMS_OP;
end;

procedure TValoresNF.Inicializar;
begin
  VL_FRETE := 0;
  VL_SEGURO := 0;
  VL_DESPACESS := 0;
end;

function TValoresNF.NotaFiscal: TNotaFiscal;
begin
  Result := (Owner as TNotaFiscal);
end;

function TValoresNF.GetBS_ICMS_ST: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].BC_ICMS_ST;
end;

function TValoresNF.GetVL_ICMS_ST: Currency;
var
  lItens: SmallInt;
begin
  Result := 0;

  for lItens := 0 to NotaFiscal.ItensNF.Count -1 do
    Result := Result + NotaFiscal.ItensNF[lItens].VL_ICMS_ST;
end;

{ TEstados }

class function TEstados.AliquotaInterEstadual(const pEstadoOrigem, pEstadoDestino: String): Double;
var
  lEstadoDestino: SmallInt;
begin
  lEstadoDestino := TEstados.CodEstado(pEstadoDestino);

  if pEstadoOrigem = 'AC' then Result := cAliquotaAC[lEstadoDestino] else
  if pEstadoOrigem = 'AL' then Result := cAliquotaAL[lEstadoDestino] else
  if pEstadoOrigem = 'AM' then Result := cAliquotaAM[lEstadoDestino] else
  if pEstadoOrigem = 'AP' then Result := cAliquotaAP[lEstadoDestino] else
  if pEstadoOrigem = 'BA' then Result := cAliquotaBA[lEstadoDestino] else
  if pEstadoOrigem = 'CE' then Result := cAliquotaCE[lEstadoDestino] else
  if pEstadoOrigem = 'DF' then Result := cAliquotaDF[lEstadoDestino] else
  if pEstadoOrigem = 'ES' then Result := cAliquotaES[lEstadoDestino] else
  if pEstadoOrigem = 'GO' then Result := cAliquotaGO[lEstadoDestino] else
  if pEstadoOrigem = 'MA' then Result := cAliquotaMA[lEstadoDestino] else
  if pEstadoOrigem = 'MT' then Result := cAliquotaMT[lEstadoDestino] else
  if pEstadoOrigem = 'MS' then Result := cAliquotaMS[lEstadoDestino] else
  if pEstadoOrigem = 'MG' then Result := cAliquotaMG[lEstadoDestino] else
  if pEstadoOrigem = 'PA' then Result := cAliquotaPA[lEstadoDestino] else
  if pEstadoOrigem = 'PB' then Result := cAliquotaPB[lEstadoDestino] else
  if pEstadoOrigem = 'PR' then Result := cAliquotaPR[lEstadoDestino] else
  if pEstadoOrigem = 'PE' then Result := cAliquotaPE[lEstadoDestino] else
  if pEstadoOrigem = 'PI' then Result := cAliquotaPI[lEstadoDestino] else
  if pEstadoOrigem = 'RN' then Result := cAliquotaRN[lEstadoDestino] else
  if pEstadoOrigem = 'RS' then Result := cAliquotaRS[lEstadoDestino] else
  if pEstadoOrigem = 'RJ' then Result := cAliquotaRJ[lEstadoDestino] else
  if pEstadoOrigem = 'RO' then Result := cAliquotaRO[lEstadoDestino] else
  if pEstadoOrigem = 'RR' then Result := cAliquotaRR[lEstadoDestino] else
  if pEstadoOrigem = 'SC' then Result := cAliquotaSC[lEstadoDestino] else
  if pEstadoOrigem = 'SP' then Result := cAliquotaSP[lEstadoDestino] else
  if pEstadoOrigem = 'SE' then Result := cAliquotaSE[lEstadoDestino] else
  if pEstadoOrigem = 'TO' then Result := cAliquotaTO[lEstadoDestino] else Result := 0;
end;

class function TEstados.AliquotaInterEstadual(const pEstadoOrigem: String): Double;
begin
  Result := AliquotaInterEstadual(pEstadoOrigem, pEstadoOrigem);
end;

class function TEstados.CodEstado(const pEstado: String): SmallInt;
begin
  if pEstado = 'AC' then Result := 00 else
  if pEstado = 'AL' then Result := 01 else
  if pEstado = 'AM' then Result := 02 else
  if pEstado = 'AP' then Result := 03 else
  if pEstado = 'BA' then Result := 04 else
  if pEstado = 'CE' then Result := 05 else
  if pEstado = 'DF' then Result := 06 else
  if pEstado = 'ES' then Result := 07 else
  if pEstado = 'GO' then Result := 08 else
  if pEstado = 'MA' then Result := 09 else
  if pEstado = 'MT' then Result := 10 else
  if pEstado = 'MS' then Result := 11 else
  if pEstado = 'MG' then Result := 12 else
  if pEstado = 'PA' then Result := 13 else
  if pEstado = 'PB' then Result := 14 else
  if pEstado = 'PR' then Result := 15 else
  if pEstado = 'PE' then Result := 16 else
  if pEstado = 'PI' then Result := 17 else
  if pEstado = 'RN' then Result := 18 else
  if pEstado = 'RS' then Result := 19 else
  if pEstado = 'RJ' then Result := 20 else
  if pEstado = 'RO' then Result := 21 else
  if pEstado = 'RR' then Result := 22 else
  if pEstado = 'SC' then Result := 23 else
  if pEstado = 'SP' then Result := 24 else
  if pEstado = 'SE' then Result := 25 else
  if pEstado = 'TO' then Result := 26 else Result := 0;
end;

class function TEstados.CodIBGEEstado(const pEstado: String): SmallInt;
begin
  if pEstado = 'RO' then Result := 11 else
  if pEstado = 'AC' then Result := 12 else
  if pEstado = 'AM' then Result := 13 else
  if pEstado = 'RR' then Result := 14 else
  if pEstado = 'PA' then Result := 15 else
  if pEstado = 'AP' then Result := 16 else
  if pEstado = 'TO' then Result := 17 else
  if pEstado = 'MA' then Result := 21 else
  if pEstado = 'PI' then Result := 22 else
  if pEstado = 'CE' then Result := 23 else
  if pEstado = 'RN' then Result := 24 else
  if pEstado = 'PB' then Result := 25 else
  if pEstado = 'PE' then Result := 26 else
  if pEstado = 'AL' then Result := 27 else
  if pEstado = 'SE' then Result := 28 else
  if pEstado = 'BA' then Result := 29 else
  if pEstado = 'MG' then Result := 31 else
  if pEstado = 'ES' then Result := 32 else
  if pEstado = 'RJ' then Result := 33 else
  if pEstado = 'SP' then Result := 35 else
  if pEstado = 'PR' then Result := 41 else
  if pEstado = 'SC' then Result := 42 else
  if pEstado = 'RS' then Result := 43 else
  if pEstado = 'MS' then Result := 50 else
  if pEstado = 'MT' then Result := 51 else
  if pEstado = 'GO' then Result := 52 else
  if pEstado = 'DF' then Result := 53 else Result := 0;
end;

{ TFuncoes }

class function TFuncoes.Percentual(const pPercentual: Double; const pValor: Currency): Currency;
begin
  Result := 0;

  if pValor > 0 then
    Result := (pValor * pPercentual) / 100;
end;

class function TFuncoes.RetornaPercentual(const pValorTotal, pValor: Currency): Currency;
begin
  Result := 0;

  if pValorTotal > 0 then
    Result := ((pValor / pValorTotal) * 100);
end;

end.
