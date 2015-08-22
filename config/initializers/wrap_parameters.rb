ActiveSupport.on_load(:action_controller) do
  if respond_to?(:wrap_parameters)
    wrap_parameters format: [:json]
  end
end
