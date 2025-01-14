-- Find processes running that are tied to binaries with unsual permissions. Namely, 0777.
--
-- references:
--   * https://attack.mitre.org/techniques/T1222/
--
-- false positives:
--   * poorly written software
--
-- platform: posix
-- tags: persistent filesystem state
SELECT
  p.pid,
  p.name,
  p.cwd,
  p.path,
  f.mode,
  f.uid,
  f.gid,
  hash.sha256,
  pp.name AS parent_name,
  pp.path AS parent_path,
  pp.cmdline AS parent_cmd,
  hash.sha256 AS parent_sha256
FROM
  processes p
  JOIN file f ON p.path = f.path
  LEFT JOIN hash ON p.path = hash.path
  LEFT JOIN processes pp ON pp.pid = p.parent
WHERE
  f.mode NOT IN (
    '0500',
    '0544',
    '0555',
    '0711',
    '0755',
    '0775',
    '0744',
    '6755',
    '0700',
    '2755',
    '4511',
    '4555',
    '4755'
  )
  -- Vendors who are very relaxed about permissions
  AND NOT (
    f.path IN (
      '/Applications/Camera Settings.app/Contents/MacOS/LogitechCamera',
      '/Applications/motionVFX/Plugins/mUtility.app/Contents/PlugIns/mUtility XPC Service.pluginkit/Contents/MacOS/mUtility XPC Service',
      '/Library/Application Support/Logitech/com.logitech.vc.LogiVCCoreService/LogiVCCoreService.app/Contents/MacOS/LogiVCCoreService'
    )
    AND f.mode = '0777'
    AND f.uid > 500
  )
  AND NOT (
    f.path LIKE '/Users/%/Library/Application Support/Code/User/globalStorage/grafana.vscode-jsonnet/bin/jsonnet-language-server'
    AND f.mode = '0777'
    AND f.uid > 500
  )
  AND NOT (
    f.path = '/usr/bin/sudo'
    AND f.mode = '4111'
    AND f.uid = 0
  )
  AND NOT (
    f.path LIKE '/home/%/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox'
    AND f.mode = '0744'
  )
  AND NOT (
    f.path LIKE '/Users/%/Applications (Parallels)/%.app/Contents/MacOS/WinAppHelper'
    AND f.mode = '0777'
  )
  AND NOT (
    f.path LIKE '/opt/homebrew/Cellar/socket_vmnet/%/bin/socket_vmnet'
    AND f.mode = '1555'
  )
  AND NOT (
    f.path LIKE '/opt/homebrew/Cellar/dnsmasq/%/sbin/dnsmasq'
    AND f.mode = '1555'
  )
