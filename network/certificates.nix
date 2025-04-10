{ lib, ... }:
let 
  files =
    if builtins.pathExists ../certs then
      builtins.attrNames (builtins.readDir ../certs)
    else
      [];
  certs = builtins.filter (f: builtins.match ".*\.pem" f != null) files;
  certContents = map (v: builtins.readFile (lib.path.append ../certs "${v}")) certs;
in
{
  security.pki.certificates = certContents;

}
