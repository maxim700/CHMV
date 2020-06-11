unit modul;

{$mode objfpc}{$H+}

interface

procedure Save(FileName:string; A,B,C:real);
procedure Open(FileName:string;var A,B,C:real);

implementation
procedure Save(FileName:string; A,B,C:real);
var f:file of real;
begin
    Assignfile(f,FileName);
    rewrite(f);
    write(f,A);
    write(f,B);
    write(f,C);
    closefile(f);
end;


procedure Open(FileName:string;var A,B,C:real);
  var f:file of real;
    s:string;
begin
    Assignfile(f,FileName);
    reset(f);
    seek(f,0);
    read(f,A);
    read(f,B);
    read(f,C);
    closefile(f);
end;

end.

