#!/usr/bin/awk -f

{
  for (f=1; f<=NF; ++f) {
    split($f,parsed,"="); k=parsed[1]; v=parsed[2];
    #print("key:"k, "val:"v);
    if(k ~ /ipv[46]/) { p=sprintf("%s%s",$3,substr(k,length(k),1)) }
    if(k == "src") { s=v }
    if(k == "sport") { s=sprintf("%s:%s",s,v) }
    if(k == "dst") { d=v }
    if(k == "dport") { d=sprintf("%s:%s",d,v) }
    if(k == "packets") { pk=v }
    if(k == "bytes") { b=v/1000000 }
  }

  print sprintf("%.1f",b),pk,p,s,"→",d
  p=s=sp=d=dp=b="";

}
