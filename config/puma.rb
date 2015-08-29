workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

# In production, I'm still seeing errors like:
#
#     PG::ConnectionBad: PQconsumeInput() SSL error:
#     decryption failed or bad record mac
#
# I'm going to try this `disconnect`, but if that doesn't
# work, I'll have to switch back to webrick.
on_worker_boot do
  ROM.env.gateways[:default].connection.disconnect
end
