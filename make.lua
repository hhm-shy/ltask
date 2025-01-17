local lm = require "luamake"

lm:lua_dll "ltask" {
    c = "c11",
    sources = "src/*.c",
    defines = {
        --"DEBUGLOG",
        lm.mode=="debug" and "DEBUGTHREADNAME",
    },
    windows = {
        links = {
            "ws2_32",
            "winmm",
        }
    },
    msvc = {
        flags = {
            "/experimental:c11atomics"
        },
        ldflags = {
            "-export:luaopen_ltask",
            "-export:luaopen_ltask_bootstrap",
            "-export:luaopen_ltask_exclusive",
            "-export:luaopen_ltask_root",
        },
    },
    gcc = {
        links = "pthread",
        visibility = "default",
        defines = "_XOPEN_SOURCE=600",
    }
}
