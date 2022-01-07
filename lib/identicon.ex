defmodule Identicon do


  def main(input) do
    input
    |> hash_input
    |> pic_color
  end

  def pic_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do
    # first way
    # %Identicon.Image{hex: hex_list} = image
    # [r,g,b | _tail] = hex_list
    # second way, the short one
    # %Identicon.Image{hex: [r,g,b | _tail]} = image
    %Identicon.Image{image | color: {r,g,b}}
  end

  @spec hash_input(any) :: %Identicon.Image{hex: [byte]}
  def hash_input(input) do
    hex = :crypto.hash(:md5,input)
    |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end


end
