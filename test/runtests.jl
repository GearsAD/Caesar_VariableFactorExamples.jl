using Test
using Distributions
using Caesar_VariableFactorExamples
using JSON

@testset "Factor Creation" begin
z = MvNormal([0, 0, 0], eye(3))
examplePrior = ExamplePrior(z)
@test examplePrior != nothing
end

@testset "Testing Sampler and Residual" begin
@test size(getSample(examplePrior, 100)[1]) == (3,100)
end

@testset "Serialization and Deserialization" begin
# JSON Pack
jsonConvert = convert(Dict{String, Any}, examplePrior)
# JSON Unpack
backToFactor = convert(ExamplePrior, jsonConvert)
backToJson = convert(Dict{String, Any}, backToFactor)
# Assert
@test JSON.json(backToJson) == JSON.json(jsonConvert)

# Packing

# Unpacking
end
