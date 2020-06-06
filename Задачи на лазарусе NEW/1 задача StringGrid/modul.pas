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
procedure save(FileName:string;s1,s2:real);          //Сохранения начальных данных
procedure OTCH(SG:Integer;FileName:string;var m:mas);//вывод отчета
procedure Open(FileName:string;var N,R:real);        //Загрузка ранее сохраненных данных
implementation
procedure save(FileName:string; s1,s2:real);
var f:file of real;
begin
  Assignfile(f,FileName);
  rewrite(f);
  write(f,s1);
  write(f,s2);
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
procedure Open(FileName:string;var N,R:real);
var f:file of real;
    //s:string;
begin
    Assignfile(f,FileName);
    reset(f);
    seek(f,0);
    read(f,N);
    read(f,R);
    closefile(f);
end;

end.
