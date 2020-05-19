unit modul;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

procedure Open(var Opendialog:TOpendialog;var EditA,EditB,EditC:TEdit);
procedure Save(var Savedialog:Tsavedialog;var EditA,EditB,EditC:TEdit);
procedure OTCH(var Savedialog:TSavedialog; var Memo:Tmemo);

implementation
procedure Save(var Savedialog:Tsavedialog;var EditA,EditB,EditC:TEdit);
var f:text;
begin
  if savedialog.Execute then
  begin
    Assignfile(f,savedialog.FileName);
    rewrite(f);
    writeln(f,EditA.Text);
    writeln(f,EditB.Text);
    writeln(f,EditC.Text);
    closefile(f);
  end;
end;

procedure OTCH(var Savedialog:TSavedialog; var Memo:Tmemo);
begin
  if Savedialog.Execute then
  begin
    Memo.Lines.SaveToFile(Savedialog.FileName);
  end;

end;

procedure Open(var Opendialog:TOpendialog;var EditA,EditB,EditC:TEdit);
  var f:text;
    s:string;
begin
  if opendialog.Execute then
  begin
    if opendialog.Fileneme<>'' then
    begin
    Assignfile(f,opendialog.FileName);
    reset(f);
    readln(f,s);
    EditA.Text:=s;
    readln(f,s);
    EditB.Text:=s;
    readln(f,s);
    EditC.Text:=s;
    closefile(f);
    end;
  end;
end;

end.

