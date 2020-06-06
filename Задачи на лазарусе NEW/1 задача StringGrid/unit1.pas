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
    MSpravka: TMenuItem;
    MExit: TMenuItem;
    MSave: TMenuItem;
    MSaveOt: TMenuItem;
    MZag: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;                  //Поля класса
    SG: TStringGrid;
    //Методы класса (Объявление)
    procedure Button1Click(Sender: TObject);   //Активация рассчетов
    procedure FormShow(Sender: TObject);       //Обнуление длины масива
    procedure MSpravkaClick(Sender: TObject);  //Вызов справки
    procedure MExitClick(Sender: TObject);     //Выход из программы
    procedure MSaveClick(Sender: TObject);     //Вызов сохранения данных
    procedure MSaveOtClick(Sender: TObject);   //Вызов отчета
    procedure MZagClick(Sender: TObject);      //Вызов загрузки данных
    //Методы класса (Объявление)
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



procedure TForm1.FormShow(Sender: TObject);
begin
  setlength(m,0);
end;

procedure TForm1.MSpravkaClick(Sender: TObject);
begin
  ShowMessage(INF);
end;

procedure TForm1.MExitClick(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.MSaveClick(Sender: TObject);
begin
  if savedialog1.Execute then
  begin
    Save(savedialog1.FileName, strtofloat(EditN.Text), strtofloat(EditR.Text));
  end;
end;

procedure TForm1.MSaveOtClick(Sender: TObject);
begin
  if Savedialog1.Execute then
  begin
    if savedialog1.FileName<>'' then
    begin
      OTCH(SG.RowCount-1,Savedialog1.FileName,m);
    end;
  end;
end;

procedure TForm1.MZagClick(Sender: TObject);
var s1,s2:real;
begin
  if opendialog1.Execute then
  begin
    if opendialog1.FileName<>'' then
    begin
      Open(Opendialog1.FileName,s1,s2);
      editN.Text:=floattostr(s1);
      editR.Text:=floattostr(s2);
    end;
  end;
end;

end.

