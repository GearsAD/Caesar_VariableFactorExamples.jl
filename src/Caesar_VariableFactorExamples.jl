module Caesar_VariableFactorExamples

using DocStringExtensions
using Caesar
using Caesar.ZmqCaesar
using JSON

# For overloading in the serialization/deserialization
import Base: convert

# Include the variables and factor
include("variables/ExamplePose2.jl")
include("factors/ExamplePrior.jl")
include("factors/ExamplePose2Pose2.jl")

export ExamplePrior
export ExamplePose2
export getSample
export convert

export ExamplePose2Pose2


end
