unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Grids,
  Math, modul;

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
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;                  //Поля класса
    SG: TStringGrid;
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
  m:mas;

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
  SetLength(m,length(m)+1);
  m[length(m)-1].n:=strtoint(EditN.Text);
  m[length(m)-1].r:=strtofloat(EditR.Text);
  r:=strtofloat(EditR.Text);
  n:=strtofloat(EditN.Text);
  m[length(m)-1].res:=round((2*r*n*tan(pi/n))*100)/100;
  SG.RowCount:=SG.RowCount+1;
  SG.Cells[0,SG.RowCount-1]:=inttostr(m[length(m)-1].n);
  SG.Cells[1,SG.RowCount-1]:=floattostr(m[length(m)-1].r);
  SG.Cells[2,SG.RowCount-1]:=floattostr(m[length(m)-1].res);
  Except
    Showmessage('Ошибка в полях ввода');
  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  setlength(m,0);
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
  if savedialog1.Execute then
  begin
    Save(savedialog1.FileName, EditN.Text, EditR.Text);
  end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  if Savedialog1.Execute then
  begin
    if savedialog1.FileName<>'' then
    begin
      OTCH(SG.RowCount-1,Savedialog1.FileName,m);
    end;
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var s1,s2:string;
begin
  if opendialog1.Execute then
  begin
    if opendialog1.FileName<>'' then
    begin
      Open(Opendialog1.FileName,s1,s2);
      editN.Text:=s1;
      editR.Text:=s2;
    end;
  end;
end;

end.

