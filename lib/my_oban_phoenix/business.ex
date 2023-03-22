defmodule MyObanPhoenix.Business do
  use Oban.Worker, queue: :events

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id} = args}) do
    model = MyObanPhoenix.Repo.get(MyObanPhoenix.Business.Man, id)

    case args do
      %{"in_the" => "business"} ->
        IO.inspect(model)

      %{"vote_for" => vote} ->
        IO.inspect([vote, model])

      _ ->
        IO.inspect(model)
    end

    :ok
  end
end
