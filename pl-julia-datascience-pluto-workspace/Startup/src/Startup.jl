module Startup

using Pluto
using PrecompileTools

@setup_workload begin
    @compile_workload begin
        if "PL_PRECOMPILE" ∈ keys(ENV)
            server_options = Pluto.Configuration.ServerOptions(; host="0.0.0.0",
                port=1234,
                launch_browser=false,
                notebook=joinpath(@__DIR__, "precompile_notebook.jl"),
                dismiss_update_notification=true
            )
            eval_options = Pluto.Configuration.EvaluationOptions(;
                workspace_use_distributed=false # Using distributed doubles the memory usage.
            )
            security_options = Pluto.Configuration.SecurityOptions(; require_secret_for_access=false)

            t = @async Pluto.run(Pluto.Configuration.Options(; server=server_options, security=security_options, evaluation=eval_options))

            sleep(120)
            @info "throwing interrupt"
            @async Base.throwto(t, InterruptException())
            sleep(2)
            @info "done"
        end
    end
end

end # module Startup
