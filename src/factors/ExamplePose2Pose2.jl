#### Simple example of a new Variable in Caesar.
#### This variable is a duplication of Pose2Pose2 in RoME.


"""
    $(SIGNATURES)

A duplication of the Pose2Pose2 factor structure for demonstration purposes.
Note that this a FunctorPairwise factor.
"""
mutable struct ExamplePose2Pose2{T} <: IncrementalInference.FunctorPairwise where {T <: IIF.SamplableBelief}
 z::T
 ExamplePose2Pose2{T}() where {T <: IIF.SamplableBelief} = new{T}()
 ExamplePose2Pose2{T}(z1::T) where {T <: IIF.SamplableBelief} = new{T}(z1)
end

"""
    $(SIGNATURES)

Constructor for the ExamplePose2Pose2 factor structure.
"""
ExamplePose2Pose2(z::T) where {T <: IIF.SamplableBelief} = ExamplePose2Pose2{T}(z)

"""
    $(SIGNATURES)

The sampler for the ExamplePose2Pose2 structure.
This provides N samples from the factor s.
"""
getSample(s::Pose2Pose2{<:IIF.SamplableBelief}, N::Int=1) = (rand(s.z,N), )

"""
    $(SIGNATURES)

???
"""
function (s::Pose2Pose2{<:IIF.SamplableBelief})(res::Array{Float64},
           userdata,
           idx::Int,
           meas::Tuple,
           wxi::Array{Float64,2},
           wxj::Array{Float64,2}  )
 #
 wXjhat = SE2(wxi[1:3,idx])*SE2(meas[1][1:3,idx])
 jXjhat = SE2(wxj[1:3,idx]) \ wXjhat
 se2vee!(res, jXjhat)
 nothing
end
