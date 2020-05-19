unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Math, modul;

type

  { TForm1 }

  TForm1 = class(TForm)        //Класс
    Button1: TButton;          //Поля класса
    EditB: TEdit;
    EditA: TEdit;
    EditC: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;   //Поля класса
    procedure Button1Click(Sender: TObject);   //Методы класса (объявление)
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject); //Методы класса (объявление)
  private

  public

  end;
Const INF = 'Автор:Лягоцкий Максим'+#13#10+'Задача №23'+#13#10+'Треугольник задан длинами сторон. Найти длины биссектрис.';
var
  Form1: TForm1;
  i:integer;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);   //Метод класса (Определение)
var a,b,c:real;
begin
  try
  Memo1.Lines[i]:='а:='+EditA.Text;
  Memo1.Lines[i+1]:='b:='+EditB.Text;
  Memo1.Lines[i+2]:='c:='+EditC.Text;
  a:=strtofloat(EditA.Text);
  b:=strtofloat(EditB.Text);
  c:=strtofloat(EditC.Text);
  Memo1.Lines[i+3]:='Биссектриса к стороне а= '+floattostr(round((sqrt(b*c*(a+b+c)*(b+c-a))/(b+c))*100)/100);
  Memo1.Lines[i+4]:='Биссектриса к стороне b= '+floattostr(round((sqrt(a*c*(a+b+c)*(a+c-b))/(a+c))*100)/100);
  Memo1.Lines[i+5]:='Биссектриса к стороне c= '+floattostr(round((sqrt(a*b*(a+b+c)*(a+b-c))/(a+b))*100)/100);
  Memo1.Lines[i+6]:='-----------';
  i:=i+7;
  Except
  Showmessage('Ошибка в полях ввода');
  end;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  i:=0;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

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
  Save(Savedialog1,EditA,EditB,EditC);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  OTCH(Savedialog1,Memo1);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Open(Opendialog1,EditA,EditB,EditC);
end;

end.

