Unit modil;
interface
procedure save(FileName:string;s1,s2:string;);
implementation
procedure save(FileName:string;s1,s2:string;);
var f:text;
begin
  Assignfile(f,FileName);
  rewrite(f);
  writeln(f,s1);
  writeln(f,s2);
  closefile(f);   
end;
end.
