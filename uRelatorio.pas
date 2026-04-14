unit uRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Vcl.ComCtrls;

type
  TfrmRelatorio = class(TForm)
    pnlTopo: TPanel;
    lblTitulo: TLabel;
    pnlFiltros: TPanel;
    lblDataInicio: TLabel;
    dtpInicio: TDateTimePicker;
    lblDataFim: TLabel;
    dtpFim: TDateTimePicker;
    lblFiltroStatus: TLabel;
    cmbStatus: TComboBox;
    btnFiltrar: TBitBtn;
    pnlGrid: TPanel;
    dbgRelatorio: TDBGrid;
    dsRelatorio: TDataSource;
    pnlResumo: TPanel;
    lblTotalVeiculos: TLabel;
    lblTotalArrecadado: TLabel;
    lblTicketMedio: TLabel;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarRelatorio;
    procedure AtualizarResumo;
  public
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

{$R *.dfm}

uses
  uDM;

procedure TfrmRelatorio.FormCreate(Sender: TObject);
begin
  dtpInicio.Date := Date - 30; // Ultimo mes
  dtpFim.Date := Date;

  cmbStatus.Items.Clear;
  cmbStatus.Items.Add('Todos');
  cmbStatus.Items.Add('Estacionado');
  cmbStatus.Items.Add('Finalizado');
  cmbStatus.ItemIndex := 0;
end;

procedure TfrmRelatorio.FormShow(Sender: TObject);
begin
  CarregarRelatorio;
end;

procedure TfrmRelatorio.CarregarRelatorio;
var
  SQLBase, SQLFiltro: string;
  StatusFiltro: string;
begin
  SQLBase :=
    'SELECT id, placa, modelo, cor, tipo, vaga, ' +
    '  data_entrada, data_saida, valor_cobrado, status ' +
    'FROM veiculos ' +
    'WHERE date(data_entrada) >= :data_inicio ' +
    '  AND date(data_entrada) <= :data_fim';

  StatusFiltro := cmbStatus.Text;
  if StatusFiltro <> 'Todos' then
    SQLFiltro := ' AND status = :status'
  else
    SQLFiltro := '';

  DM.qryRelatorio.Close;
  DM.qryRelatorio.SQL.Text := SQLBase + SQLFiltro + ' ORDER BY data_entrada DESC';
  DM.qryRelatorio.ParamByName('data_inicio').AsDate := dtpInicio.Date;
  DM.qryRelatorio.ParamByName('data_fim').AsDate := dtpFim.Date;

  if StatusFiltro <> 'Todos' then
    DM.qryRelatorio.ParamByName('status').AsString := StatusFiltro;

  DM.qryRelatorio.Open;
  dsRelatorio.DataSet := DM.qryRelatorio;

  // Configurar colunas
  if dbgRelatorio.Columns.Count > 0 then
  begin
    dbgRelatorio.Columns[0].Visible := False; // id
    dbgRelatorio.Columns[1].Title.Caption := 'Placa';
    dbgRelatorio.Columns[1].Width := 80;
    dbgRelatorio.Columns[2].Title.Caption := 'Modelo';
    dbgRelatorio.Columns[2].Width := 110;
    dbgRelatorio.Columns[3].Title.Caption := 'Cor';
    dbgRelatorio.Columns[3].Width := 60;
    dbgRelatorio.Columns[4].Title.Caption := 'Tipo';
    dbgRelatorio.Columns[4].Width := 60;
    dbgRelatorio.Columns[5].Title.Caption := 'Vaga';
    dbgRelatorio.Columns[5].Width := 50;
    dbgRelatorio.Columns[6].Title.Caption := 'Entrada';
    dbgRelatorio.Columns[6].Width := 120;
    dbgRelatorio.Columns[7].Title.Caption := 'Sa'#237'da';
    dbgRelatorio.Columns[7].Width := 120;
    dbgRelatorio.Columns[8].Title.Caption := 'Valor (R$)';
    dbgRelatorio.Columns[8].Width := 80;
    dbgRelatorio.Columns[9].Title.Caption := 'Status';
    dbgRelatorio.Columns[9].Width := 80;
  end;

  AtualizarResumo;
end;

procedure TfrmRelatorio.AtualizarResumo;
var
  TotalVeiculos: Integer;
  TotalArrecadado, TicketMedio: Currency;
begin
  TotalVeiculos := DM.qryRelatorio.RecordCount;
  TotalArrecadado := 0;

  DM.qryRelatorio.First;
  while not DM.qryRelatorio.Eof do
  begin
    TotalArrecadado := TotalArrecadado +
      DM.qryRelatorio.FieldByName('valor_cobrado').AsCurrency;
    DM.qryRelatorio.Next;
  end;
  DM.qryRelatorio.First;

  if TotalVeiculos > 0 then
    TicketMedio := TotalArrecadado / TotalVeiculos
  else
    TicketMedio := 0;

  lblTotalVeiculos.Caption := Format('Total de ve'#237'culos: %d', [TotalVeiculos]);
  lblTotalArrecadado.Caption := Format('Total arrecadado: %s',
    [FormatCurr('R$ #,##0.00', TotalArrecadado)]);
  lblTicketMedio.Caption := Format('Ticket m'#233'dio: %s',
    [FormatCurr('R$ #,##0.00', TicketMedio)]);
end;

procedure TfrmRelatorio.btnFiltrarClick(Sender: TObject);
begin
  CarregarRelatorio;
end;

procedure TfrmRelatorio.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

end.
