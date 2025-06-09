{ ...}:
{
  programs.bash = {
    enable = true;

    initExtra = ''
      alias la="ls -lha --color=auto"

      command -v kubecolor >/dev/null 2>&1 && alias kubectl="kubecolor"
      source <(kubectl completion bash)
      alias k=kubectl
      alias kns="kubectl config set-context --current --namespace "
      complete -F __start_kubectl k

      alias analyze_fs="ncdu --exclude /mnt --exclude /nix/store "

      alias mnt_nas_muc="sudo mount.davfs https://de-biasi-munich.synology.me:5006 /mnt/nas_muc_dav/ -o uid=1000"

      alias calc="speedcrunch"
    '';

  };
}
