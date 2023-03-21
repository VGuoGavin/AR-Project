# Force Estimation in Robotic Manipulators: Modeling, Simulation and Experiments
## The UR5 Manipulator as a Case Study

These files are part of my [master thesis (2014)](http://folk.ntnu.no/tomgra/Diplomer/Kufieta.pdf) which I used to model and simulate the UR5. It includes a simple version of force estimation based on the motor current measurements.

The simulations were done in Matlab & Simulink. Model C is based on my method to reconstruct the mass center points of the links. Here's a preview of how I've created Model C:

<img src="https://github.com/kkufieta/force_estimate_ur5/blob/master/Modeling_UR5.png" width="600"/>

## Contributions & Acknowledgements
When I was working on my master thesis, I did not expect it to become popular. My code was written solely for the purpose to create results quickly and not with the intention to make it reusable. Therefore, contributions to expand upon it or improve code quality are more than welcome!

If you wish, feel free to translate the code into any other language than Matlab & Simulink to further increase usability. To make life easier for fellow researchers, please send a pull request to this repo, so we all can find the core code at this single source. Other than that, feel free to use the code for your own research.

Once you manage to create new results based on this code, it is appreciated if you mention my thesis. For reference, here is my [Google Scholar profile](https://scholar.google.com/citations?user=c9lfwEwAAAAJ&hl=en).
