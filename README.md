# Claude second-account launcher

Small Windows and macOS launchers that open the installed Claude Desktop application with a separate user-data directory. This repository does not contain a multi-agent framework or a cloned application.

## Usage

The scripts are in [`claude-ikinci-hesap/`](claude-ikinci-hesap/).

- **Windows:** run `windows-claude-hesap2.bat`, which invokes the adjacent PowerShell script.
- **macOS:** make `mac-claude-hesap2.command` executable, then open it.
- Sign in to the second account in the new window. The normal application shortcut continues to use the original profile.

The default separate folder is `~/claude-hesap2`; `CLAUDE_HESAP2_DIR` can override the supported launcher setting. Read the platform script before running it. Never point the alternate launcher at your existing profile directory.

## Limits and related project

Application updates, MSIX behavior and single-instance locks can prevent a second window. Separate data folders are not a security sandbox and do not isolate the OS account or registry.

[Ikiz](https://github.com/Bluetwinklez/ikiz) is the broader Windows instance-management project. Use this repository for the simple launcher; use Ikiz when you need instance cards and lifecycle management.

The default branch is `claude/ikinci-hesap-launcher`. The [original Turkish instructions](claude-ikinci-hesap/README.md) remain available. No real account sign-in was performed during the repository audit.

[Security policy](SECURITY.md) · [Repository security audit](SECURITY_AUDIT.md)
