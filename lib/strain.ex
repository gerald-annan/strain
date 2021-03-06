defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filter(:keep, list, fun, [])
  end

  defp filter(type, [hd | tl], fun, acc) do
    case type do
      :keep ->
        if fun.(hd), do: filter(type, tl, fun, acc ++ [hd]), else: filter(type, tl, fun, acc)

      _ ->
        if !fun.(hd), do: filter(type, tl, fun, acc ++ [hd]), else: filter(type, tl, fun, acc)
    end
  end

  defp filter(_, _, _, acc), do: acc

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    filter(:discard, list, fun, [])
  end
end
