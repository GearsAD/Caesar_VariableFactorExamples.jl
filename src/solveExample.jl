#### This example is a basic test of the new variables and factors
#### that are added in this repo. The example is derived from
#### the hexagonal test example.

using Caesar, RoME
using Caesar_VariableFactorExamples # Your new variable/factor repository
# Using plotting for experiment validation
using RoMEPlotting

# 1. Init factor graph
fg = initfg()

# 2. Add variables
addNode!(fg, :x0, ExamplePose2)
addNode!(fg, :x1, ExamplePose2)
addNode!(fg, :x2, ExamplePose2)
addNode!(fg, :x3, ExamplePose2)

# 3. Add factors
# 3a. Add a new test prior
# 3b. Add new types of odometry factors.

# 4. Solve graph
batchSolve!(fg)

# 5. Graph solution - assuming that you have this open in Atom.
drawPoses(fg)
