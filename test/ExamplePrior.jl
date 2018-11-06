# Arrange
z = MvNormal([0, 0, 0], eye(3))
examplePrior = ExamplePrior(z)

@testset "Factor Creation" begin
    # Assert
    @test examplePrior != nothing
end

@testset "Testing Sampler and Residual" begin
    # Assert
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

    # Packing and Uunpacking
    packed = convert(PackedExamplePrior, examplePrior)
    unpacked = convert(ExamplePrior, packed)
    repacked = convert(PackedExamplePrior, unpacked)
    # Assert
    @test JSON.json(packed) === JSON.json(repacked)
end
