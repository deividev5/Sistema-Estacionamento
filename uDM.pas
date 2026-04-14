unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Data.DB;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    qryVeiculos: TFDQuery;
    qryConfig: TFDQuery;
    qryRelatorio: TFDQuery;
    qryAux: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CriarBanco;
    procedure CriarConfigPadrao;
  public
    function GetValorHora: Currency;
    function GetValorFracao15Min: Currency;
    function GetToleranciaMinutos: Integer;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  DBPath: string;
begin
  DBPath := ExtractFilePath(ParamStr(0)) + 'estacionamento.db';

  FDConnection.Params.Clear;
  FDConnection.Params.DriverID := 'SQLite';
  FDConnection.Params.Database := DBPath;
  FDConnection.Params.Add('LockingMode=Normal');
  FDConnection.LoginPrompt := False;
  FDConnection.Connected := True;

  CriarBanco;
end;

procedure TDM.CriarBanco;
begin
  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS veiculos (' +
    '  id INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  placa VARCHAR(10) NOT NULL,' +
    '  modelo VARCHAR(50),' +
    '  cor VARCHAR(30),' +
    '  tipo VARCHAR(20) DEFAULT ''Carro'',' +
    '  vaga VARCHAR(10),' +
    '  data_entrada DATETIME NOT NULL,' +
    '  data_saida DATETIME,' +
    '  valor_cobrado DECIMAL(10,2) DEFAULT 0,' +
    '  status VARCHAR(20) DEFAULT ''Estacionado'',' +
    '  observacao TEXT' +
    ')'
  );

  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS configuracoes (' +
    '  id INTEGER PRIMARY KEY AUTOINCREMENT,' +
    '  chave VARCHAR(50) UNIQUE NOT NULL,' +
    '  valor VARCHAR(100) NOT NULL' +
    ')'
  );

  CriarConfigPadrao;
end;

procedure TDM.CriarConfigPadrao;
var
  Count: Integer;
begin
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT COUNT(*) AS total FROM configuracoes';
  qryAux.Open;
  Count := qryAux.FieldByName('total').AsInteger;
  qryAux.Close;

  if Count = 0 then
  begin
    FDConnection.ExecSQL('INSERT INTO configuracoes (chave, valor) VALUES (''valor_hora'', ''10.00'')');
    FDConnection.ExecSQL('INSERT INTO configuracoes (chave, valor) VALUES (''valor_fracao_15min'', ''3.00'')');
    FDConnection.ExecSQL('INSERT INTO configuracoes (chave, valor) VALUES (''tolerancia_minutos'', ''10'')');
    FDConnection.ExecSQL('INSERT INTO configuracoes (chave, valor) VALUES (''total_vagas'', ''50'')');
    FDConnection.ExecSQL('INSERT INTO configuracoes (chave, valor) VALUES (''nome_estacionamento'', ''Meu Estacionamento'')');
  end;
end;

function TDM.GetValorHora: Currency;
begin
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT valor FROM configuracoes WHERE chave = :chave';
  qryAux.ParamByName('chave').AsString := 'valor_hora';
  qryAux.Open;
  Result := StrToCurrDef(qryAux.FieldByName('valor').AsString, 10.00);
  qryAux.Close;
end;

function TDM.GetValorFracao15Min: Currency;
begin
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT valor FROM configuracoes WHERE chave = :chave';
  qryAux.ParamByName('chave').AsString := 'valor_fracao_15min';
  qryAux.Open;
  Result := StrToCurrDef(qryAux.FieldByName('valor').AsString, 3.00);
  qryAux.Close;
end;

function TDM.GetToleranciaMinutos: Integer;
begin
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT valor FROM configuracoes WHERE chave = :chave';
  qryAux.ParamByName('chave').AsString := 'tolerancia_minutos';
  qryAux.Open;
  Result := StrToIntDef(qryAux.FieldByName('valor').AsString, 10);
  qryAux.Close;
end;

end.
