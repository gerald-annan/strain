defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filter(list, fun, [])
  end

  def filter(list, fun, acc) do
    case list do
      [hd | tl] ->
        if fun.(hd) == true, do: filter(tl, fun, acc ++ [hd]), else: filter(tl, fun, acc)

      _ ->
        acc
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
  end
end
