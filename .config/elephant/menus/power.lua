Name = "power"
NamePretty = "Power Menu"
Icon = "system-shutdown"
Terminal = false
Cache = true
Action = "%VALUE%"

function GetEntries()
  return {
    { Text = "Shutdown", Value = "systemctl poweroff", Icon = "system-shutdown" },
    { Text = "Restart",   Value = "systemctl reboot",   Icon = "system-reboot" },
    { Text = "Sleep",  Value = "systemctl suspend",  Icon = "system-suspend" },
  }
end
