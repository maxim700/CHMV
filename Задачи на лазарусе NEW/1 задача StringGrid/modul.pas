Unit modul;
{$mode objfpc}{$H+}
interface
uses
  SysUtils;
type data = record
          n:integer;
          r:real;
          res:real;
     end;
     mas = array of data;
procedure save(FileName:string;s1,s2:string);
procedure OTCH(SG:Integer;FileName:string;var m:mas);
procedure Open(FileName:string;var N,R:string);
implementation
procedure save(FileName:string; s1,s2:string);
var f:text;
begin
  Assignfile(f,FileName);
  rewrite(f);
  writeln(f,s1);
  writeln(f,s2);
  closefile(f);
end;
procedure OTCH(SG:Integer;FileName:string;var m:mas);
var f:textfile;
    i:integer;
begin
    Assignfile(f,FileName);
    if FileExists(FileName) then
       append(f)
    else
        rewrite(f);
    for i:=1 to SG do
        begin
          writeln(f,'N сторон: '+inttostr(m[i].n));
          writeln(f,'Радиус: '+floattostr(m[i].r));
          writeln(f,'Результат: '+floattostr(m[i].res));
          writeln(f);
        end;
    closefile(f);
end;
procedure Open(FileName:string;var N,R:string);
var f:text;
    s:string;
begin
    Assignfile(f,FileName);
    reset(f);
    readln(f,s);
    N:=s;
    readln(f,s);
    R:=s;
    closefile(f);
end;

end.
