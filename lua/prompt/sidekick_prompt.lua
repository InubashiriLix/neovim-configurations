---@class sidekick_prompt_t
---@field sidekick_prompt table<string, string>
---@field load()
local M = {}
---
---
---@type table<string, string>
M.sidekick_prompt = {
    -- language preset
    language_zh = [[use chiense to explain, ask and anwser in this session.]],
    language_en = [[use English to explain, ask and anwser in this session.]],

    -- hci remote target
    hci_remote = [[
Remote target is `hci-prerelease-dev`.

The remote machine has no reliable Internet access.

Never download packages, dependencies, source code, or artifacts from
the Internet on the remote machine. Acquire them locally and transfer
them to the remote machine.

The following system-wide remote tools are available:

    hci-run <command...>
        Execute a command on the remote machine.

    hci-upload <local-path> <remote-path>
        Upload files or directories to the remote machine.

    hci-download <remote-path> <local-path>
        Download files or directories from the remote machine.

    hci-nix-copy --flake <installable...>
        Realise Nix packages locally and copy their complete closures
        to the remote machine.

    hci-nix-copy <store-path...>
        Copy existing Nix store paths and their closures to the remote.

Prefer these tools over manually invoking ssh, scp, rsync, or nix copy.

For Nix dependencies, always realise them locally first and use
`hci-nix-copy`. Do not attempt to fetch missing Nix dependencies from
the remote machine.

Use the remote machine primarily for execution, testing, service
management, logs, and workloads requiring the remote environment.
]]
    -- hci remote tools
}

function M.load()
    return M.sidekick_prompt
end

return M
