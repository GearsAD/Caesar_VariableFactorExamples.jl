#### Simple example of a new Variable in Caesar.
#### This variable is a duplication of Pose2Pose2 in RoME.


"""
    $(SIGNATURES)

A duplication of the Pose2Pose2 factor structure for demonstration purposes.
Note that this a FunctorPairwise factor.
"""
struct ExamplePose2Pose2{T <: IIF.SamplableBelief} <: IIF.AbstractRelativeRoots
  Z::T  
end

"""
    $(SIGNATURES)

The sampler for the ExamplePose2Pose2 structure.
This provides N samples from the factor s.
"""
pgetSample(cfo::CalcFactor{<:ExamplePose2Pose2}, N::Int=1) = (reshape(rand(cfo.factor.Z,N),1,N), )

"""
    $(SIGNATURES)

???
"""
function (s::Pose2Pose2})(res::Array{Float64},
                    z,
           wxi,
           wxj  )
 #
 wXjhat = SE2(wxi[1:3,idx])*SE2(meas[1][1:3,idx])
 jXjhat = SE2(wxj[1:3,idx]) \ wXjhat
 se2vee!(res, jXjhat)
 nothing
end
