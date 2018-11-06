using Test
using Distributions
using Caesar_VariableFactorExamples

@testset "Factor Creation" begin
z = MvNormal([0, 0, 0], eye(3))
examplePrior = ExamplePrior(z)
@test examplePrior != nothing
end

@testset "Testing Sampler and Residual" begin
@test getSample(examplePrior, 100)
end
