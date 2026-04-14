unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmConfig = class(TForm)
    pnlTopo: TPanel;
    lblTitulo: TLabel;
    pnlCampos: TPanel;
    lblNomeEstacionamento: TLabel;
    edtNomeEstacionamento: TEdit;
    lblTotalVagas: TLabel;
    edtTotalVagas: TEdit;
    lblValorHora: TLabel;
    edtValorHora: TEdit;
    lblValorFracao: TLabel;
    edtValorFracao: TEdit;
    lblTolerancia: TLabel;
    edtTolerancia: TEdit;
    lblInfoFracao: TLabel;
    lblInfoTolerancia: TLabel;
    pnlBotoes: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure CarregarConfiguracoes;
    procedure SalvarConfig(const AChave, AValor: string);
    function GetConfig(const AChave: string): string;
  public
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses
  uDM;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

function TfrmConfig.GetConfig(const AChave: string): string;
begin
  DM.qryAux.Close;
  DM.qryAux.SQL.Text := 'SELECT valor FROM configuracoes WHERE chave = :chave';
  DM.qryAux.ParamByName('chave').AsString := AChave;
  DM.qryAux.Open;
  Result := DM.qryAux.FieldByName('valor').AsString;
  DM.qryAux.Close;
end;

procedure TfrmConfig.CarregarConfiguracoes;
begin
  edtNomeEstacionamento.Text := GetConfig('nome_estacionamento');
  edtTotalVagas.Text := GetConfig('total_vagas');
  edtValorHora.Text := GetConfig('valor_hora');
  edtValorFracao.Text := GetConfig('valor_fracao_15min');
  edtTolerancia.Text := GetConfig('tolerancia_minutos');
end;

procedure TfrmConfig.SalvarConfig(const AChave, AValor: string);
begin
  DM.FDConnection.ExecSQL(
    'UPDATE configuracoes SET valor = :valor WHERE chave = :chave',
    [AValor, AChave]
  );
end;

procedure TfrmConfig.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNomeEstacionamento.Text) = '' then
  begin
    ShowMessage('Informe o nome do estacionamento.');
    edtNomeEstacionamento.SetFocus;
    Exit;
  end;

  if StrToIntDef(edtTotalVagas.Text, 0) <= 0 then
  begin
    ShowMessage('Total de vagas deve ser maior que zero.');
    edtTotalVagas.SetFocus;
    Exit;
  end;

  if StrToCurrDef(edtValorHora.Text, 0) <= 0 then
  begin
    ShowMessage('Valor da hora deve ser maior que zero.');
    edtValorHora.SetFocus;
    Exit;
  end;

  if StrToCurrDef(edtValorFracao.Text, 0) <= 0 then
  begin
    ShowMessage('Valor da fra'#231#227'o deve ser maior que zero.');
    edtValorFracao.SetFocus;
    Exit;
  end;

  if StrToIntDef(edtTolerancia.Text, -1) < 0 then
  begin
    ShowMessage('Toler'#226'ncia deve ser um valor v'#225'lido.');
    edtTolerancia.SetFocus;
    Exit;
  end;

  SalvarConfig('nome_estacionamento', Trim(edtNomeEstacionamento.Text));
  SalvarConfig('total_vagas', Trim(edtTotalVagas.Text));
  SalvarConfig('valor_hora', Trim(edtValorHora.Text));
  SalvarConfig('valor_fracao_15min', Trim(edtValorFracao.Text));
  SalvarConfig('tolerancia_minutos', Trim(edtTolerancia.Text));

  ShowMessage('Configura'#231#245'es salvas com sucesso!');
  ModalResult := mrOk;
end;

procedure TfrmConfig.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
