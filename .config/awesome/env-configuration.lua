local env = {}

-- This is used later as the default terminal and editor to run.
env.terminal = "st"
env.editor = os.getenv("EDITOR") or "vim"
env.editor_cmd = env.terminal .. " -e " .. env.editor

return env
