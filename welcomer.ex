defmodule Inmana.Welcomer do
  # Receber uma nome e umda idade do usuario
  # Se o usuario chamar banana e tiver idade 42, ele recebe uma mesagem especial
  # Se o usuario for maior de idade, ele recebe uma mensagem normal
  # se o usuario for menor de idade, retornamos um erro
  # temos que tratar o nome do usuarioi para entradas de dados erradas, como "BaNaNa"

  def welcome(%{"name" => name, "age" => age}) do
    age = age |> String.to_integer()

    name 
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  # If value == banana e 42
  defp evaluate("banana", 42) do
    {:ok, "You are very special banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You sall not pass #{name}"}
  end
end
