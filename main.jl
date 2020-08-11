using DataFrames, Query, VegaDatasets, VegaLite

cars = dataset("cars") 

cars |> @select(:Accleration, :Name) |> collect

function foo(data, origin)
    df = data |> @filter(_.Origin==origin) |> DataFrame

    return df |> @vlplot(:point, :Acceleration, :Miles_per_Gallon)
end

p = foo(cars, "USA")

p |> save("foo.png")