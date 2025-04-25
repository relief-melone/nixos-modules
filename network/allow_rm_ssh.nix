{ ... }:
{
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  users.users.relief-melone.openssh.authorizedKeys.keyFiles = [
    ./ssh_pub_keys/id_rsa.pub
  ];
}
