unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math, modul;

type

  { TForm1 }

  TForm1 = class(TForm)     //Класс формы
    Button1: TButton;           //Поля класса
    EditN: TEdit;
    EditR: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    PoleOtcheta: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;                  //Поля класса
    procedure Button1Click(Sender: TObject);   //Методы класса (Объявление)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject); //Методы класса (Объявление)
  private

  public

  end;
Const INF ='Автор:Лягоцкий Максим'+#13#10+'Задача №8'+#13#10+'Определить периметр правильного n-угольника, описанного около окружности радиуса r.';
var
  Form1: TForm1;      //Экземпляр класса
  i:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);       //Метод класса (Определение)
var r,n:real;
begin
  Try
  PoleOtcheta.Lines[i]:='N:='+EditN.Text;
  PoleOtcheta.Lines[i+1]:='R:='+EditR.Text;
  r:=strtofloat(EditR.Text);
  n:=strtofloat(EditN.Text);
  PoleOtcheta.Lines[i+2]:='P:='+floattostr(round((2*r*n*tan(pi/n))*100)/100);
  PoleOtcheta.Lines[i+3]:='---------';
  i:=i+4;
  Except
    Showmessage('Ошибка в полях ввода');
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  i:=0;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  ShowMessage(INF);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Save(savedialog1, EditN.Text, EditR.Text);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  OTCH(PoleOtcheta,Savedialog1);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Open(Opendialog1,EditN,EditR);
end;

end.

