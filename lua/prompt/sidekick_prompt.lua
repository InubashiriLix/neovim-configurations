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
    -- subagent
    subagent = [[
## 并行与 Subagent 使用建议

开工前先花几秒想想:这任务里有哪些部分是可以同时做的?

- **能并行就并行**:互不依赖的搜索、读文件、调研,尽量一次性发起,别一个个等。
- **善用 subagent**:遇到开放式探索(某功能在哪实现、大范围找调用点、调研多个方案)时,丢给 subagent 在独立上下文里跑,只让它回结论,省主上下文。
- **注意依赖**:后一步要用前一步结果的,就老实串行;同一文件别并发写。
- **小任务别硬拆**:一步能搞定的就直接做,不必为并行而并行。
    ]],

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
]],
    -- oracle remote target
    oracle_remote = [[
Remote target is `oracle-web-server`.

The remote machine has no reliable Internet access.

Never download packages, dependencies, source code, or artifacts from
the Internet on the remote machine. Acquire them locally and transfer
them to the remote machine.

The following system-wide remote tools are available:

    oracle-run <command...>
        Execute a command on the remote machine.

    oracle-upload <local-path> <remote-path>
        Upload files or directories to the remote machine.

    oracle-download <remote-path> <local-path>
        Download files or directories from the remote machine.

Prefer these tools over manually invoking ssh, scp, or rsync.

Use the remote machine primarily for execution, testing, service
management, logs, and workloads requiring the remote environment.
]]
    -- oracle remote tools
}

function M.load()
    return M.sidekick_prompt
end

return M
