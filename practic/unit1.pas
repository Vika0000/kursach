unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls, Menus, DbCtrls, ExtCtrls,Unit3,Unit4;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MySQL55Connection1: TMySQL55Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.lfm}


{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var aa:string;
begin
  aa:='select * from football.www where number>=1';
 if CheckBox1.Checked=true then aa:=aa+ ' and number="'+Edit1.Text + '"' ;
 if CheckBox2.Checked=true then aa:=aa+ ' and player LIKE "' + Edit2.Text + '%"' ;
 if CheckBox3.Checked=true then aa:=aa+ ' and team LIKE "' + Edit3.Text + '%"';
 if CheckBox4.Checked=true then aa:=aa+ ' and nationality LIKE "' + Edit4.Text+ '%"';
 if CheckBox5.Checked=true then aa:=aa+ ' and record LIKE "' + Edit6.Text+ '%"';
  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add(aa);
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;
  Form1.SQLQuery1.Active:=True;
end;


procedure TForm1.Button2Click(Sender: TObject);
var a:String;
begin
  a:=DataSource1.DataSet.FieldByName('number').AsString;
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('DELETE from www where number="'+a+'"');
  SQLQuery1.ExecSQL;
  SQLTransaction1.Commit;
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('select * from football.www');
  SQLQuery1.Active:=True;
  MessageDlg('Успешно','Запись удалена',mtInformation, [mbOK],0);
end;

procedure TForm1.Button3Click(Sender: TObject);
var a:string;
begin
  a:= 'select * from www';
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add(a);
  SQLQuery1.ExecSQL;
  SQLTransaction1.Commit;
  SQLQuery1.Active:=True;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
   if (CheckBox1.Checked=true) then
                               Edit1.Enabled:=true;

  if (CheckBox1.Checked=False) then
                               Edit1.Enabled:=False;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
   if (CheckBox2.Checked=true) then
                               Edit2.Enabled:=true;

  if (CheckBox2.Checked=False) then
                               Edit2.Enabled:=False;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
   if (CheckBox3.Checked=true) then
                               Edit3.Enabled:=true;

  if (CheckBox3.Checked=False) then
                               Edit3.Enabled:=False;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
   if (CheckBox4.Checked=true) then
                               Edit4.Enabled:=true;

  if (CheckBox4.Checked=False) then
                               Edit4.Enabled:=False;
end;

procedure TForm1.CheckBox5Change(Sender: TObject);
begin
     if (CheckBox5.Checked=true) then
                               Edit6.Enabled:=true;

     if (CheckBox5.Checked=False) then
                               Edit6.Enabled:=False;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

end;

procedure TForm1.Edit5Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
 Form4.ShowModal;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form1.Close;
end;


procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Form3.ShowModal;
end;
end.

