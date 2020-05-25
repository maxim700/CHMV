Unit modul;
{$mode objfpc}{$H+}
interface
procedure save(Filename:string;s1,s2:string);
procedure Open(FileName:string;var N,R:string);
implementation
procedure save(Filename:string;s1,s2:string);
var f:text;
begin
  Assignfile(f,FileName);
  rewrite(f);
  writeln(f,s1);
  writeln(f,s2);
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
