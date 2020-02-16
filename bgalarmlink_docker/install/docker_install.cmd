call docker_env.cmd

setx /m BG_PACKAGEROOT c:\systems\packages

netsh http add urlacl url=http://+:7289/ user=Everyone
