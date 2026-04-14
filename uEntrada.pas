unit uEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmEntrada = class(TForm)
    pnlTopo: TPanel;
    lblTitulo: TLabel;
    pnlCampos: TPanel;
    lblPlaca: TLabel;
    edtPlaca: TEdit;
    lblModelo: TLabel;
    edtModelo: TEdit;
    lblCor: TLabel;
    edtCor: TEdit;
    lblTipo: TLabel;
    cmbTipo: TComboBox;
    lblVaga: TLabel;
    edtVaga: TEdit;
    lblObs: TLabel;
    mmoObs: TMemo;
    pnlBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPlacaExit(Sender: TObject);
  private
    function ValidarPlaca(const APlaca: string): Boolean;
    function VeiculoJaEstacionado(const APlaca: string): Boolean;
  public
  end;

var
  frmEntrada: TfrmEntrada;

implementation

{$R *.dfm}

uses
  uDM;

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
  cmbTipo.Items.Clear;
  cmbTipo.Items.Add('Carro');
  cmbTipo.Items.Add('Moto');
  cmbTipo.Items.Add('Caminh'#227'o');
  cmbTipo.Items.Add('Van');
  cmbTipo.Items.Add('Outro');
  cmbTipo.ItemIndex := 0;
end;

function TfrmEntrada.ValidarPlaca(const APlaca: string): Boolean;
var
  P: string;
  I: Integer;
begin
  P := UpperCase(Trim(APlaca));
  Result := False;

  // Formato antigo: ABC-1234 (7 chars sem hifen)
  // Formato Mercosul: ABC1D23 (7 chars)
  P := StringReplace(P, '-', '', [rfReplaceAll]);

  if Length(P) <> 7 then
    Exit;

  // Verifica se os 3 primeiros s'#227'o letras
  for I := 1 to 3 do
    if not CharInSet(P[I], ['A'..'Z']) then
      Exit;

  // Formato antigo: ABC1234
  // Formato Mercosul: ABC1D23
  if CharInSet(P[4], ['0'..'9']) then
  begin
    // Pode ser antigo ou Mercosul
    if CharInSet(P[5], ['A'..'Z']) then
    begin
      // Mercosul: ABC1D23
      if CharInSet(P[6], ['0'..'9']) and CharInSet(P[7], ['0'..'9']) then
        Result := True;
    end
    else if CharInSet(P[5], ['0'..'9']) then
    begin
      // Antigo: ABC1234
      if CharInSet(P[6], ['0'..'9']) and CharInSet(P[7], ['0'..'9']) then
        Result := True;
    end;
  end;
end;

function TfrmEntrada.VeiculoJaEstacionado(const APlaca: string): Boolean;
begin
  DM.qryAux.Close;
  DM.qryAux.SQL.Text :=
    'SELECT COUNT(*) AS total FROM veiculos ' +
    'WHERE placa = :placa AND status = ''Estacionado''';
  DM.qryAux.ParamByName('placa').AsString := UpperCase(Trim(APlaca));
  DM.qryAux.Open;
  Result := DM.qryAux.FieldByName('total').AsInteger > 0;
  DM.qryAux.Close;
end;

procedure TfrmEntrada.edtPlacaExit(Sender: TObject);
begin
  edtPlaca.Text := UpperCase(Trim(edtPlaca.Text));
end;

procedure TfrmEntrada.btnConfirmarClick(Sender: TObject);
var
  Placa: string;
begin
  Placa := UpperCase(Trim(edtPlaca.Text));

  if Placa = '' then
  begin
    ShowMessage('Informe a placa do ve'#237'culo.');
    edtPlaca.SetFocus;
    Exit;
  end;

  if not ValidarPlaca(Placa) then
  begin
    ShowMessage('Placa inv'#225+'lida. Use o formato ABC-1234 ou ABC1D23.');
    edtPlaca.SetFocus;
    Exit;
  end;

  if VeiculoJaEstacionado(Placa) then
  begin
    ShowMessage('Este ve'#237'culo j'#225' est'#225' estacionado!');
    edtPlaca.SetFocus;
    Exit;
  end;

  DM.FDConnection.ExecSQL(
    'INSERT INTO veiculos (placa, modelo, cor, tipo, vaga, data_entrada, status, observacao) ' +
    'VALUES (:placa, :modelo, :cor, :tipo, :vaga, :data_entrada, ''Estacionado'', :obs)',
    [Placa,
     Trim(edtModelo.Text),
     Trim(edtCor.Text),
     cmbTipo.Text,
     Trim(edtVaga.Text),
     Now,
     Trim(mmoObs.Text)]
  );

  ShowMessage('Ve'#237'culo registrado com sucesso!' + sLineBreak +
    'Placa: ' + Placa + sLineBreak +
    'Entrada: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

  ModalResult := mrOk;
end;

procedure TfrmEntrada.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
