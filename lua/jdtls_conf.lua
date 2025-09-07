local home = os.getenv("USERPROFILE")

local jdtls_path   = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls"
local launcher_jar = vim.fn.glob(jdtls_path .. "\\plugins\\org.eclipse.equinox.launcher_*.jar")
local config_path  = jdtls_path .. "\\config_win"
local workspace    = home .. "\\.cache\\jdtls\\workspace"

local config = {
  cmd = {
    "C:/Program Files/Java/jdk-21/bin/java", -- 👈 force Java 21 here
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher_jar,
    "-configuration", config_path,
    "-data", workspace,
  },
}

return config
