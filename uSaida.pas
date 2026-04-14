unit uSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.DateUtils;

type
  TfrmSaida = class(TForm)
    pnlTopo: TPanel;
    lblTitulo: TLabel;
    pnlInfo: TPanel;
    lblPlaca: TLabel;
    lblPlacaValor: TLabel;
    lblModelo: TLabel;
    lblModeloValor: TLabel;
    lblCor: TLabel;
    lblCorValor: TLabel;
    lblTipo: TLabel;
    lblTipoValor: TLabel;
    lblVaga: TLabel;
    lblVagaValor: TLabel;
    lblEntrada: TLabel;
    lblEntradaValor: TLabel;
    lblSaida: TLabel;
    lblSaidaValor: TLabel;
    lblPermanencia: TLabel;
    lblPermanenciaValor: TLabel;
    pnlValor: TPanel;
    lblValorTotal: TLabel;
    lblValorTotalValor: TLabel;
    pnlBotoes: TPanel;
    btnConfirmarSaida: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarSaidaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FPlacaVeiculo: string;
    FVeiculoId: Integer;
    FDataEntrada: TDateTime;
    FValorCobrado: Currency;
    procedure CarregarDadosVeiculo;
    function CalcularValor(AEntrada, ASaida: TDateTime): Currency;
    function FormatarPermanencia(AEntrada, ASaida: TDateTime): string;
  public
    property PlacaVeiculo: string read FPlacaVeiculo write FPlacaVeiculo;
  end;

var
  frmSaida: TfrmSaida;

implementation

{$R *.dfm}

uses
  uDM;

procedure TfrmSaida.FormShow(Sender: TObject);
begin
  CarregarDadosVeiculo;
end;

procedure TfrmSaida.CarregarDadosVeiculo;
var
  DataSaida: TDateTime;
begin
  DM.qryAux.Close;
  DM.qryAux.SQL.Text :=
    'SELECT * FROM veiculos WHERE placa = :placa AND status = ''Estacionado''';
  DM.qryAux.ParamByName('placa').AsString := FPlacaVeiculo;
  DM.qryAux.Open;

  if DM.qryAux.IsEmpty then
  begin
    ShowMessage('Ve'#237'culo n'#227'o encontrado!');
    ModalResult := mrCancel;
    Exit;
  end;

  FVeiculoId := DM.qryAux.FieldByName('id').AsInteger;
  FDataEntrada := DM.qryAux.FieldByName('data_entrada').AsDateTime;
  DataSaida := Now;

  lblPlacaValor.Caption := DM.qryAux.FieldByName('placa').AsString;
  lblModeloValor.Caption := DM.qryAux.FieldByName('modelo').AsString;
  lblCorValor.Caption := DM.qryAux.FieldByName('cor').AsString;
  lblTipoValor.Caption := DM.qryAux.FieldByName('tipo').AsString;
  lblVagaValor.Caption := DM.qryAux.FieldByName('vaga').AsString;
  lblEntradaValor.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', FDataEntrada);
  lblSaidaValor.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', DataSaida);
  lblPermanenciaValor.Caption := FormatarPermanencia(FDataEntrada, DataSaida);

  FValorCobrado := CalcularValor(FDataEntrada, DataSaida);
  lblValorTotalValor.Caption := FormatCurr('R$ #,##0.00', FValorCobrado);

  DM.qryAux.Close;
end;

function TfrmSaida.CalcularValor(AEntrada, ASaida: TDateTime): Currency;
var
  MinutosTotais: Int64;
  HorasCompletas: Int64;
  MinutosRestantes: Int64;
  ValorHora, ValorFracao: Currency;
  Tolerancia: Integer;
begin
  MinutosTotais := MinutesBetween(ASaida, AEntrada);
  Tolerancia := DM.GetToleranciaMinutos;
  ValorHora := DM.GetValorHora;
  ValorFracao := DM.GetValorFracao15Min;

  // Dentro da toler'#226'ncia, n'#227'o cobra
  if MinutosTotais <= Tolerancia then
  begin
    Result := 0;
    Exit;
  end;

  HorasCompletas := MinutosTotais div 60;
  MinutosRestantes := MinutosTotais mod 60;

  Result := HorasCompletas * ValorHora;

  // Cobrar fra'#231#245'es de 15 minutos
  if MinutosRestantes > 0 then
  begin
    if MinutosRestantes <= 15 then
      Result := Result + ValorFracao
    else if MinutosRestantes <= 30 then
      Result := Result + (ValorFracao * 2)
    else if MinutosRestantes <= 45 then
      Result := Result + (ValorFracao * 3)
    else
      Result := Result + ValorHora; // Cobra hora cheia
  end;
end;

function TfrmSaida.FormatarPermanencia(AEntrada, ASaida: TDateTime): string;
var
  Dias, Horas, Minutos: Integer;
  TotalMinutos: Int64;
begin
  TotalMinutos := MinutesBetween(ASaida, AEntrada);
  Dias := TotalMinutos div (24 * 60);
  Horas := (TotalMinutos mod (24 * 60)) div 60;
  Minutos := TotalMinutos mod 60;

  Result := '';
  if Dias > 0 then
    Result := Result + IntToStr(Dias) + 'd ';
  if Horas > 0 then
    Result := Result + IntToStr(Horas) + 'h ';
  Result := Result + IntToStr(Minutos) + 'min';
end;

procedure TfrmSaida.btnConfirmarSaidaClick(Sender: TObject);
begin
  if MessageDlg('Confirmar sa'#237'da do ve'#237'culo ' + FPlacaVeiculo + '?' + sLineBreak +
    'Valor: ' + FormatCurr('R$ #,##0.00', FValorCobrado),
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.FDConnection.ExecSQL(
      'UPDATE veiculos SET data_saida = :saida, valor_cobrado = :valor, ' +
      'status = ''Finalizado'' WHERE id = :id',
      [Now, FValorCobrado, FVeiculoId]
    );

    ShowMessage('Sa'#237'da registrada com sucesso!' + sLineBreak +
      'Placa: ' + FPlacaVeiculo + sLineBreak +
      'Valor cobrado: ' + FormatCurr('R$ #,##0.00', FValorCobrado));

    ModalResult := mrOk;
  end;
end;

procedure TfrmSaida.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
