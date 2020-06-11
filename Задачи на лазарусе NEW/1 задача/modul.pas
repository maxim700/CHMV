Unit modul;
{$mode objfpc}{$H+}
interface
procedure save(Filename:string;s1,s2:real);
procedure Open(FileName:string;var N,R:real);
implementation
procedure save(Filename:string;s1,s2:real);
var f:file of real;
begin
  Assignfile(f,FileName);
  rewrite(f);
  write(f,s1);
  write(f,s2);
  closefile(f);
end;

procedure Open(FileName:string;var N,R:real);
var f:file of real;
    s:string;
begin

    Assignfile(f,FileName);
    reset(f);
    seek(f,0);
    read(f,N);
    read(f,R);
    closefile(f);
end;

end.
