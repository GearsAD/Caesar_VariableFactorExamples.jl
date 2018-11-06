module Caesar_VariableFactorExamples

using DocStringExtensions
using Caesar


# Include the variables and factor
include("variables/ExamplePose2.jl")
export ExamplePose2

include("factors/ExamplePrior.jl")
export ExamplePrior
export getSample

include("factors/ExamplePose2Pose2.jl")
export ExamplePose2Pose2

end
