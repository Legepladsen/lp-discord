local projectName = GetConvar('sv_projectName', '[lp-discord] No project name set')
print(projectName)
SetConvarReplicated('sv_projectName', projectName)