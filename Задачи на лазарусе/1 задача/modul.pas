Unit modul;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;
procedure save(var Savedialog:Tsavedialog;s1,s2:string);
procedure OTCH(var Memo:Tmemo;var Savedialog:TSaveDialog);
procedure Open(var Opendialog:TOpendialog;var EditN,EditR:TEdit);
implementation
procedure save(var Savedialog:Tsavedialog;s1,s2:string);
var f:text;
begin
  if savedialog.Execute then
  begin
  Assignfile(f,Savedialog.FileName);
  rewrite(f);
  writeln(f,s1);
  writeln(f,s2);
  closefile(f);
  end;
end;
procedure OTCH(var Memo:Tmemo;var Savedialog:TSaveDialog);
begin
  if Savedialog.Execute then
  begin
    Memo.Lines.SaveToFile(Savedialog.FileName);
  end;
end;
procedure Open(var Opendialog:TOpendialog;var EditN,EditR:TEdit);
var f:text;
    s:string;
begin
  if opendialog.Execute then
  begin
    if opendialog.FileName<>'' then
    begin
    Assignfile(f,opendialog.FileName);
    reset(f);
    readln(f,s);
    EditN.Text:=s;
    readln(f,s);
    EditR.Text:=s;
    closefile(f);
    end;
  end;
end;

end.
