unit modul;

{$mode objfpc}{$H+}

interface

procedure Save(FileName:string; A,B,C:String);
procedure Open(FileName:string;var A,B,C:String);

implementation
procedure Save(FileName:string; A,B,C:String);
var f:text;
begin
    Assignfile(f,FileName);
    rewrite(f);
    writeln(f,A);
    writeln(f,B);
    writeln(f,C);
    closefile(f);
end;


procedure Open(FileName:string;var A,B,C:String);
  var f:text;
    s:string;
begin
    Assignfile(f,FileName);
    reset(f);
    readln(f,s);
    A:=s;
    readln(f,s);
    B:=s;
    readln(f,s);
    C:=s;
    closefile(f);
end;

end.

