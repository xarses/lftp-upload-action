# lftp upload action

This action is set up to perform FTPs (SSL/TLS over FTP) that some sites require. This is accomplished using the `mirror --reverse` command in lftp, which by default does not delete the remote files that are not present on the local.

## Inputs

### `host`
The host name of the server you want to connect to.

### `port` (optional)
The port you want to connect to. Specify if its not on a protocol standard.

### `protocol` (optional)
The protocol to connect with (default: ftp)

### `password`
The username to authenticate with.

### `password`
The password to authenticate with.

### `ssl_verify_cert` (optional)
Verify the x509 SSL certificate presented by the remote host (default: true)

### `ssl_force` (optional)
Force LFTP to only connect with TLS/SSL (default: false). This causes LFTP to abort if TLS/SSL can not be negotiated.

### `ssl_priority` (optional)
Cipher priority string to pass to gnutls (default: ""). In some strange cases, you may need to set these to extend compatibility with normally disabled ciphers. If you need generic compat, Set to `NORMAL:%COMPAT:+VERS-TLS1.0` 

### `args` (optional)
Any additional arguments to pass to the mirror command (default: "")

### `local_path`
the local path to upload from the deployment repo

### `remote_path`
the path to upload the files to on the remote host
