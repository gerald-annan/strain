defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    keep_filter(list, fun, [])
  end

  def keep_filter([hd | tl], fun, acc) do
    if fun.(hd), do: keep_filter(tl, fun, acc ++ [hd]), else: keep_filter(tl, fun, acc)
  end

  def keep_filter(_, _, acc), do: acc

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    discard_filter(list, fun, [])
  end

  def discard_filter([hd | tl], fun, acc) do
    if !fun.(hd), do: discard_filter(tl, fun, acc ++ [hd]), else: discard_filter(tl, fun, acc)
  end

  def discard_filter(_, _, acc), do: acc
end
