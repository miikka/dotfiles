# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./wifi.nix
    ];

  # Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.loader.systemd-boot.enable = true;

  boot.initrd.luks.devices = {
   root = {
      device = "/dev/sda1";
      preLVM = true;
   };
  };

  # Re-order HDMI and PCH outputs so we can get some sound
  boot.extraModprobeConfig = ''
    options snd_hda_intel index=1,0
  '';

  # networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Configure console
  console = {
    keyMap = "fi";
  };

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty git magic-wormhole source-code-pro stow tmux wget vim 
    emacs firefox chromium nodejs mosh fzf
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  
  programs.ssh.startAgent = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 8008 8989 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver = {
      enable = true;
      windowManager = {
        i3.enable = true;
      };
      desktopManager = {
        xterm.enable = false;
      };
      displayManager = {
        defaultSession = "none+i3";
      };
      extraLayouts.arkkudvorak = {
        description = "Arkkudvorak";
        languages = [ "fin" ];
        symbolsFile = /etc/nixos/arkkudvorak;
      };
  };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  services.xserver.dpi = 177;
  services.xserver.layout = "arkkudvorak";
  services.xserver.xkbOptions = "caps:escape";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin = {
    enable = true;
    user = "miikka";
  };

  services.restic.backups = {
    b2 = {
      paths = [ "/home/miikka" "/etc/nixos" ];
      repository = "b2:miikka-restic:";
      passwordFile = "/etc/nixos/restic/password";
      # It's called "s3" credentials file, but you can put any
      # kind of environmental variables there.
      s3CredentialsFile = "/etc/nixos/restic/env";
      extraBackupArgs = [
        "--exclude-file=/etc/nixos/restic/excludes.txt"
      ];
      # To be enabled if I ever upgrade NixOS
      #pruneOpts = [
      #  "--keep-daily 7"
      #  "--keep-weekly 5"
      #  "--keep-monthly 12"
      #  "--keep-yearly 75"
      #];
    };
  };

  users.users.miikka = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "audio" "wheel" ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
