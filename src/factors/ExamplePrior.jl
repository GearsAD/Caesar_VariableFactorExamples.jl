
### Factor Definition
struct ExamplePrior{T} <: IncrementalInference.FunctorSingleton where T <: SamplableBelief
  Z::T
end

### Sampler and Residual Functions
getSample(s::ExamplePrior, N::Int=1) = (reshape(rand(s.Z,N),:,N), )

### Packed Converters
struct PackedExamplePrior <: PackedInferenceType
  Z::String
  PackedExamplePrior() = new()
  PackedExamplePrior(z::AS) where {AS <: AbstractString} = new(z)
end
function convert(::Type{PackedExamplePrior}, d::Prior)
  return PackedExamplePrior(string(d.Z))
end
function convert(::Type{ExamplePrior}, d::PackedExamplePrior)
  return ExamplePrior(extractdistribution(d.Z))
end

### JSON Converters
"""
Converter: ExamplePrior -> PackedExamplePrior::Dict{String, Any}
"""
function convert(::Type{Dict{String, Any}}, prior::ExamplePrior)
    z = convert(Dict{String, Any}, prior.Z)
    return JSON.parse(JSON.json(Packed_Factor([z], "ExamplePrior")))
end

"""
Converter: PackedPrior::Dict{String, Any} -> ExamplePrior
"""
function convert(::Type{ExamplePrior}, prior::Dict{String, Any})
    # Genericize to any packed type next.
    z = prior["measurement"][1]
    z = convert(_evalType(z["distType"]), z)
    return ExamplePrior(z)
end
