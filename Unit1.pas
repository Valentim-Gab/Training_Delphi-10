unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit2, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Samples.Gauges, System.DateUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    ProgressBar1: TProgressBar;
    Gauge1: TGauge;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button5: TButton;
    Button6: TButton;
    Image2: TImage;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button7: TButton;
    Label4: TLabel;
    TabControl1: TTabControl;
    Label5: TLabel;
    TabControl2: TTabControl;

    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private
    { Private declarations }

    vetor: Array [1..10] of integer;
    lista: Array of integer;
    name: String;


    procedure ExibeVariavel(Valor: String);

    function fncExibeTexto: String;
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  Form2: TForm2;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  vetor[1]:=10;
  setLength(lista, 10);
  lista[1]:=10;

   //Outra aula

  //name:=Edit1.Text;
  ExibeVariavel(fncExibeTexto);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Lines.add(Edit1.Text);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  var contador: integer;

  for contador := 0 to 100 do
    if (contador mod 2) = 1 then
      Memo1.Lines.add(Integer.ToString(contador));
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    image2.picture.LoadFromFile(OpenDialog1.FileName);
    ShowMessage('Carregado com sucesso!');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    image2.picture.SaveToFile(SaveDialog1.FileName);
    ShowMessage('Salvo com sucesso!');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  var data: String;
    data := data + ('Dias: ' + IntToStr(DaysBetween(DateTimePicker1.Date, DateTimePicker2.Date)));
    data := data + (' / Meses: ' + IntToStr(MonthsBetween(DateTimePicker1.Date, DateTimePicker2.Date)));
    data := data + (' / Anos: ' + IntToStr(YearsBetween(DateTimePicker1.Date, DateTimePicker2.Date)));
    label4.Caption := data;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Edit1.Enabled := CheckBox1.Checked;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Label1.Caption := ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TForm1.ExibeVariavel(Valor: String);
begin
  Form1.Caption := valor;
  ShowMessage('Executei a procedure corretamente');
  ShowMessage(Valor);
  Application.CreateForm(TForm2,Form2);
  Form2.Show;
  Form2.Caption := valor;
end;

function TForm1.fncExibeTexto: string;
begin
    Result:= Edit1.Text;
    if Result = 'magic' then
      Button2.enabled := True;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  Label2.Caption := RadioGroup1.Items[RadioGroup1.ItemIndex];
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Label1.Font.Size := SpinEdit1.Value;
  Label2.Font.Size := SpinEdit1.Value;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  Label5.Caption := TabControl1.Tabs[TabControl1.TabIndex];
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Label3.Caption := ('Horário: ' + TimeToStr(Time));
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  ProgressBar1.Position := TrackBar1.Position;
  Gauge1.progress := TrackBar1.Position;
end;

end.
