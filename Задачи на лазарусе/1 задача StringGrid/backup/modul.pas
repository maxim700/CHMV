Unit modul;
{$mode objfpc}{$H+}
interface
uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls, Grids;
type data = record
          n:integer;
          r:real;
          res:real;
     end;
     mas = array of data;
procedure save(var Savedialog:Tsavedialog;s1,s2:string);
procedure OTCH(var SG:TStringgrid;var Savedialog:TSaveDialog);
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
procedure OTCH(var SG:TStringgrid;var Savedialog:TSaveDialog);
var f:textfile;
    i:integer;
begin
  if Savedialog.Execute then
  begin
    if savedialog.FileName<>'' then
    begin
    Assignfile(f,savedialog.FileName);
    if FileExists(savedialog.FileName) then
       append(f)
    else
        rewrite(f);
    for i:=1 to SG.rowCount-1 do
        begin
          writeln(f,SG.Cells[0,0]+': '+SG.Cells[1,i]);
          writeln(f,SG.Cells[1,0]+': '+SG.Cells[2,i]);
          writeln(f,SG.Cells[2,0]+': '+SG.Cells[3,i]);
          writeln(f);
        end;
    closefile(f);
    end;
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
