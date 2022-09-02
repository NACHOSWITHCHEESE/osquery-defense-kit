SELECT *
FROM systemd_units
WHERE active_state != "inactive"
    AND sub_state != "plugged"
    AND sub_state != "mounted"
    AND fragment_path != ""
    AND NOT (
        (
            fragment_path LIKE '/lib/systemd/system/%'
            OR fragment_path LIKE '/usr/lib/systemd/system/%'
            OR fragment_path LIKE "/etc/systemd/system/%"
            OR fragment_path LIKE "/run/systemd/generator/%"
            OR fragment_path LIKE "/run/systemd/generator.late/%.service"
            OR fragment_path LIKE "/run/systemd/transient/%"
        )
        AND (
            id IN (
                'abrt-journal-core.service',
                'abrt-oops.service',
                'abrt-xorg.service',
                'abrtd.service',
                'accounts-daemon.service',
                'acpid.path',
                'acpid.service',
                'acpid.socket',
                'akmods-keygen.target',
                'akmods-shutdown.service',
                'flatpak-system-helper.service',
                'zfs-snapshot-hourly.service',
                'zfs-snapshot-frequent.service',
                'akmods.service',
                'alsa-restore.service',
                'alsa-state.service',
                'alsa-store.service',
                'anacron.timer',
                'anacron.service',
                'apcupsd.service',
                'apparmor.service',
                'apport.service',
                'apt-daily-upgrade.timer',
                'apt-daily.timer',
                'audit.service',
                'auditd.service',
                'avahi-daemon.service',
                'avahi-daemon.socket',
                'basic.target',
                'blk-availability.service',
                'blockdev@dev-mapper-cryptoswap.target',
                'bluetooth.service',
                'bluetooth.target',
                'bolt.service',
                'chronyd.service',
                'colord.service',
                'console-setup.service',
                'containerd.service',
                'cron.service',
                'cronie.service',
                'cryptsetup.target',
                'cups-browsed.service',
                'cups.path',
                'cups.service',
                'cups.socket',
                'dbus-broker.service',
                'dbus.service',
                'dbus.socket',
                'dev-mapper-cryptoswap.swap',
                'dhcpcd.service',
                'display-manager.service',
                'dkms.service',
                'dm-event.socket',
                'dnf-makecache.timer',
                'docker.service',
                'docker.socket',
                'dpkg-db-backup.timer',
                'dracut-shutdown.service',
                'e2scrub_all.timer',
                'firewall.service',
                'firewalld.service',
                'fstrim.timer',
                'fwupd-refresh.service',
                'fwupd-refresh.timer',
                'fwupd.service',
                'gdm.service',
                'geoclue.service',
                'getty-pre.target',
                'getty.target',
                'graphical.target',
                'gssproxy.service',
                'iio-sensor-proxy.service',
                'import-state.service',
                'integritysetup.target',
                'irqbalance.service',
                'iscsid.socket',
                'iscsiuio.socket',
                'iwd.service',
                'kerneloops.service',
                'keyboard-setup.service',
                'kmod-static-nodes.service',
                'kolide-launcher.service',
                'launcher.kolide-k2.service',
                'ldconfig.service',
                'lightdm.service',
                'livesys-late.service',
                'livesys.service',
                'lm_sensors.service',
                'local-fs-pre.target',
                'local-fs.target',
                'logrotate-checkconf.service',
                'logrotate.timer',
                'low-memory-monitor.service',
                'lvm2-lvmpolld.socket',
                'lvm2-monitor.service',
                'lvm2.service',
                'machine.slice',
                'machines.target',
                'man-db.timer',
                'mcelog.service',
                'ModemManager.service',
                'modprobe@chromeos_pstore.service',
                'modprobe@efi_pstore.service',
                'modprobe@mtdpstore.service',
                'modprobe@pstore_blk.service',
                'modprobe@pstore_zone.service',
                'modprobe@ramoops.service',
                'motd-news.timer',
                'mount-pstore.service',
                'multi-user.target',
                'network-interfaces.target',
                'network-local-commands.service',
                'network-online.target',
                'network-pre.target',
                'network-setup.service',
                'network.target',
                'networkd-dispatcher.service',
                'NetworkManager-wait-online.service',
                'NetworkManager.service',
                'nfs-client.target',
                'nginx.service',
                'nix-daemon.service',
                'nix-daemon.socket',
                'nix-gc.timer',
                'nscd.service',
                'nss-lookup.target',
                'nss-user-lookup.target',
                'nvidia-persistenced.service',
                'openvpn.service',
                'packagekit.service',
                'paths.target',
                'pcscd.service',
                'pcscd.socket',
                'phpsessionclean.timer',
                'plocate-updatedb.timer',
                'plymouth-quit-wait.service',
                'plymouth-read-write.service',
                'plymouth-start.service',
                'polkit.service',
                'power-profiles-daemon.service',
                'proc-sys-fs-binfmt_misc.automount',
                'raid-check.timer',
                'reflector.timer',
                'reload-systemd-vconsole-setup.service',
                'remote-fs-pre.target',
                'remote-fs.target',
                'resolvconf.service',
                'rpc_pipefs.target',
                'rpc-statd-notify.service',
                'rsyslog.service',
                'rtkit-daemon.service',
                'setvtrgb.service',
                'shadow.service',
                'shadow.timer',
                'slices.target',
                'smartcard.target',
                'snapd.apparmor.service',
                'snapd.seeded.service',
                'snapd.service',
                'snapd.socket',
                'sockets.target',
                'sound.target',
                'sshd.service',
                'sssd-kcm.service',
                'sssd-kcm.socket',
                'swap.target',
                'switcheroo-control.service',
                'sysinit.target',
                'syslog.socket',
                'sysstat-collect.timer',
                'sysstat-summary.timer',
                'sysstat.service',
                'systemd-ask-password-console.path',
                'systemd-ask-password-plymouth.path',
                'systemd-ask-password-wall.path',
                'systemd-backlight@backlight:intel_backlight.service',
                'systemd-backlight@leds:dell::kbd_backlight.service',
                'systemd-backlight@leds:tpacpi::kbd_backlight.service',
                'systemd-binfmt.service',
                'systemd-boot-update.service',
                'systemd-coredump.socket',
                'systemd-cryptsetup@cryptoswap.service',
                'systemd-fsckd.socket',
                'systemd-homed-activate.service',
                'systemd-homed.service',
                'systemd-hwdb-update.service',
                'systemd-initctl.socket',
                'systemd-journal-catalog-update.service',
                'systemd-journal-flush.service',
                'systemd-journald-audit.socket',
                'systemd-journald-dev-log.socket',
                'systemd-journald.service',
                'systemd-journald.socket',
                'systemd-logind.service',
                'systemd-machined.service',
                'systemd-modules-load.service',
                'systemd-network-generator.service',
                'systemd-oomd.service',
                'systemd-oomd.socket',
                'systemd-random-seed.service',
                'systemd-remount-fs.service',
                'systemd-resolved.service',
                'systemd-rfkill.socket',
                'systemd-sysctl.service',
                'systemd-sysusers.service',
                'systemd-timesyncd.service',
                'systemd-tmpfiles-clean.timer',
                'systemd-tmpfiles-setup-dev.service',
                'systemd-tmpfiles-setup.service',
                'systemd-udev-settle.service',
                'systemd-udev-trigger.service',
                'systemd-udevd-control.socket',
                'systemd-udevd-kernel.socket',
                'systemd-udevd.service',
                'systemd-update-done.service',
                'systemd-update-utmp.service',
                'systemd-user-sessions.service',
                'systemd-userdbd.service',
                'systemd-userdbd.socket',
                'systemd-vconsole-setup.service',
                'tailscaled.service',
                'thermald.service',
                'time-set.target',
                'timers.target',
                'tlp.service',
                'ua-timer.timer',
                'udisks2.service',
                'ufw.service',
                'unattended-upgrades.service',
                'unbound-anchor.timer',
                'update-notifier-download.timer',
                'update-notifier-motd.timer',
                'updatedb.timer',
                'upower.service',
                'uresourced.service',
                'user.slice',
                'uuidd.socket',
                'veritysetup.target',
                'virtinterfaced.socket',
                'virtlockd.socket',
                'virtlogd.socket',
                'virtnetworkd.socket',
                'virtnodedevd.socket',
                'virtnwfilterd.socket',
                'virtproxyd.socket',
                'virtqemud-admin.socket',
                'virtqemud-ro.socket',
                'virtqemud.socket',
                'virtsecretd.socket',
                'virtstoraged.socket',
                'whoopsie.path',
                'wpa_supplicant.service',
                'zfs-import-cache.service',
                'zfs-import.target',
                'zfs-load-key-rpool.service',
                'zfs-load-module.service',
                'zfs-mount.service',
                'zfs-scrub.timer',
                'zfs-share.service',
                'zfs-snapshot-daily.timer',
                'zfs-snapshot-frequent.timer',
                'zfs-snapshot-hourly.timer',
                'zfs-snapshot-monthly.timer',
                'zfs-snapshot-weekly.timer',
                'zfs-volume-wait.service',
                'zfs-volumes.target',
                'zfs-zed.service',
                'zfs.target',
                'znapzend.service',
                'zpool-trim.timer'
            )
            OR id LIKE 'blockdev@dev-mapper-luks%.target'
            OR id LIKE 'blockdev@dev-mapper-nvme%.target'
            OR id LIKE 'dbus-:%-org.freedesktop.problems@0.service'
            OR id LIKE 'dev-disk-by%.swap'
            OR id LIKE 'dev-mapper-%.swap'
            OR id LIKE 'dev-zram%.swap'
            OR id LIKE 'docker-%.scope'
            OR id LIKE 'getty@tty%.service'
            OR id LIKE 'home-manager-%.service'
            OR id LIKE 'lvm2-pvscan@%.service'
            OR id LIKE 'session-%.scope'
            OR id LIKE 'system-systemd%cryptsetup.slice'
            OR id LIKE 'systemd-backlight@%.service'
            OR id LIKE 'systemd-cryptsetup@luks%.service'
            OR id LIKE 'systemd-cryptsetup@nvme%.service'
            OR id LIKE 'systemd-fsck@dev-disk-by%service'
            OR id LIKE 'systemd-zram-setup@zram%.service'
            OR id LIKE 'user-runtime-dir@%.service'
            OR id LIKE 'user@%.service'
            OR id LIKE 'akmods@%64.service'
        )
    )