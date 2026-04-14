unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    lblTitulo: TLabel;
    lblVagasInfo: TLabel;
    pnlBotoes: TPanel;
    btnEntrada: TBitBtn;
    btnSaida: TBitBtn;
    btnRelatorio: TBitBtn;
    btnConfig: TBitBtn;
    btnAtualizar: TBitBtn;
    pnlGrid: TPanel;
    dbgVeiculos: TDBGrid;
    dsVeiculos: TDataSource;
    StatusBar: TStatusBar;
    tmrAtualizar: TTimer;
    edtBusca: TEdit;
    lblBusca: TLabel;
    btnBuscar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnEntradaClick(Sender: TObject);
    procedure btnSaidaClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure tmrAtualizarTimer(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AtualizarGrid;
    procedure AtualizarVagasInfo;
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uDM, uEntrada, uSaida, uRelatorio, uConfig;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Caption := 'Sistema de Estacionamento';
  Position := poScreenCenter;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  AtualizarGrid;
  AtualizarVagasInfo;
end;

procedure TfrmPrincipal.AtualizarGrid;
var
  Busca: string;
begin
  Busca := Trim(edtBusca.Text);

  DM.qryVeiculos.Close;
  if Busca = '' then
  begin
    DM.qryVeiculos.SQL.Text :=
      'SELECT id, placa, modelo, cor, tipo, vaga, ' +
      '  data_entrada, status ' +
      'FROM veiculos ' +
      'WHERE status = ''Estacionado'' ' +
      'ORDER BY data_entrada DESC';
  end
  else
  begin
    DM.qryVeiculos.SQL.Text :=
      'SELECT id, placa, modelo, cor, tipo, vaga, ' +
      '  data_entrada, status ' +
      'FROM veiculos ' +
      'WHERE status = ''Estacionado'' ' +
      '  AND (placa LIKE :busca OR modelo LIKE :busca OR vaga LIKE :busca) ' +
      'ORDER BY data_entrada DESC';
    DM.qryVeiculos.ParamByName('busca').AsString := '%' + Busca + '%';
  end;
  DM.qryVeiculos.Open;

  dsVeiculos.DataSet := DM.qryVeiculos;

  // Configurar colunas
  if dbgVeiculos.Columns.Count > 0 then
  begin
    dbgVeiculos.Columns[0].Visible := False; // id
    dbgVeiculos.Columns[1].Title.Caption := 'Placa';
    dbgVeiculos.Columns[1].Width := 100;
    dbgVeiculos.Columns[2].Title.Caption := 'Modelo';
    dbgVeiculos.Columns[2].Width := 150;
    dbgVeiculos.Columns[3].Title.Caption := 'Cor';
    dbgVeiculos.Columns[3].Width := 80;
    dbgVeiculos.Columns[4].Title.Caption := 'Tipo';
    dbgVeiculos.Columns[4].Width := 80;
    dbgVeiculos.Columns[5].Title.Caption := 'Vaga';
    dbgVeiculos.Columns[5].Width := 70;
    dbgVeiculos.Columns[6].Title.Caption := 'Entrada';
    dbgVeiculos.Columns[6].Width := 140;
    dbgVeiculos.Columns[7].Title.Caption := 'Status';
    dbgVeiculos.Columns[7].Width := 100;
  end;
end;

procedure TfrmPrincipal.AtualizarVagasInfo;
var
  TotalVagas, Ocupadas: Integer;
begin
  DM.qryAux.Close;
  DM.qryAux.SQL.Text := 'SELECT valor FROM configuracoes WHERE chave = :chave';
  DM.qryAux.ParamByName('chave').AsString := 'total_vagas';
  DM.qryAux.Open;
  TotalVagas := StrToIntDef(DM.qryAux.FieldByName('valor').AsString, 50);
  DM.qryAux.Close;

  DM.qryAux.SQL.Text := 'SELECT COUNT(*) AS total FROM veiculos WHERE status = ''Estacionado''';
  DM.qryAux.Open;
  Ocupadas := DM.qryAux.FieldByName('total').AsInteger;
  DM.qryAux.Close;

  lblVagasInfo.Caption := Format('Vagas: %d / %d (Livres: %d)',
    [Ocupadas, TotalVagas, TotalVagas - Ocupadas]);

  StatusBar.Panels[0].Text := Format('Veiculos estacionados: %d', [Ocupadas]);
  StatusBar.Panels[1].Text := Format('Data/Hora: %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]);
end;

procedure TfrmPrincipal.btnEntradaClick(Sender: TObject);
begin
  frmEntrada := TfrmEntrada.Create(Self);
  try
    frmEntrada.ShowModal;
  finally
    frmEntrada.Free;
  end;
  AtualizarGrid;
  AtualizarVagasInfo;
end;

procedure TfrmPrincipal.btnSaidaClick(Sender: TObject);
var
  PlacaSelecionada: string;
begin
  if DM.qryVeiculos.IsEmpty then
  begin
    ShowMessage('Nenhum ve' + #237 + 'culo estacionado.');
    Exit;
  end;

  PlacaSelecionada := DM.qryVeiculos.FieldByName('placa').AsString;

  frmSaida := TfrmSaida.Create(Self);
  try
    frmSaida.PlacaVeiculo := PlacaSelecionada;
    frmSaida.ShowModal;
  finally
    frmSaida.Free;
  end;
  AtualizarGrid;
  AtualizarVagasInfo;
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
begin
  frmRelatorio := TfrmRelatorio.Create(Self);
  try
    frmRelatorio.ShowModal;
  finally
    frmRelatorio.Free;
  end;
end;

procedure TfrmPrincipal.btnConfigClick(Sender: TObject);
begin
  frmConfig := TfrmConfig.Create(Self);
  try
    frmConfig.ShowModal;
  finally
    frmConfig.Free;
  end;
  AtualizarVagasInfo;
end;

procedure TfrmPrincipal.btnAtualizarClick(Sender: TObject);
begin
  edtBusca.Text := '';
  AtualizarGrid;
  AtualizarVagasInfo;
end;

procedure TfrmPrincipal.btnBuscarClick(Sender: TObject);
begin
  AtualizarGrid;
end;

procedure TfrmPrincipal.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btnBuscarClick(Sender);
  end;
end;

procedure TfrmPrincipal.tmrAtualizarTimer(Sender: TObject);
begin
  AtualizarVagasInfo;
end;

end.
