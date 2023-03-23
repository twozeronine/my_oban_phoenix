defmodule MyObanPhoenix.MyImportantJob do
  use Oban.Worker, queue: :events

  @impl Oban.Worker
  def perform(%Oban.Job{args: args}) do
    IO.inspect(args)
    :ok
  end

  ## MyObanPhoenix.MyImportantJob.new(%{id: 1, params: []}) |> Oban.insert()
  # {:ok, %Oban.Job{}}
  # Oban.start_queue(queue: :events, limit: 4) > 작업이 실행됨.
end
