#### Simple example of a new Variable in Caesar.
#### This variable is a duplication of Pose2 in RoME.

"""
    $(SIGNATURES)

An example variable duplicated from the Pose2 variable in RoME.
"""
struct ExamplePose2 <: IncrementalInference.InferenceVariable
 dims::Int # x, y, theta - so it's 3 DOF
 labels::Vector{String}
 ExamplePose2() = new(3, String["POSE";])
end
