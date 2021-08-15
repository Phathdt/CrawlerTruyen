# defmodule Crawl.CrawlerServer do
#   def get_request(id) do
#     :timer.sleep(1000)
#     "{user:{id: #{id}}}"
#   end

#   def async_get_request(id) do
#     caller = self

#     spawn(fn ->
#       send(caller, {:result, get_request(id)})
#     end)
#   end

#   def get_result do
#     receive do
#       {:result, result} -> result
#     end
#   end
# end
