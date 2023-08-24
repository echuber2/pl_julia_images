using Pluto

cd("/home/julia")

server_options = Pluto.Configuration.ServerOptions(; host="0.0.0.0", 
                        port=1234, 
                        launch_browser=false,
                        notebook="/home/julia/notebook.jl",
                    )
security_options = Pluto.Configuration.SecurityOptions(; require_secret_for_access=false)
Pluto.run(Pluto.Configuration.Options(; server=server_options, security=security_options))