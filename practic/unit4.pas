unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.lfm}

{ TForm4 }



procedure TForm4.Button1Click(Sender: TObject);
var c:string;
begin
  c:= Format ('INSERT INTO football.www(number,player,nationality,team,rent,age,height,weight,position,goals,record) values ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s")',[Edit1.Text,Edit2.Text,Edit9.Text,Edit3.Text,Edit4.Text,Edit5.Text,Edit6.Text,Edit7.Text,Edit8.Text,Edit10.Text,Edit11.Text]);
  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add(c);
  Form1.SQLQuery1.ExecSQL;
  Form1.SQLTransaction1.Commit;
  Form1.SQLQuery1.Close;
  Form1.SQLQuery1.SQL.Clear;
  Form1.SQLQuery1.SQL.Add('select * from football.www');
  Form1.SQLQuery1.Active:=True;
  MessageDlg('Успешно','Запись добавленна',mtInformation, [mbOK],0);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin

end;

end.

