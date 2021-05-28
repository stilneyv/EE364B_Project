# EE364B Final Project
## Implementation of Total Variation Algorithms for Image Denoising
This project aims to be a pedagogical project focused on education and application. Users can open the Matlab appl (instructions below) to experiment with 3+ different convex optimization algorithms on images of their choice. In addition, this aims to be a framework that users can easy add onto, implementing their own algorithms with application support and receiving timely qualitative and quantitative results that can be easily compared with other SOTA image denoising algorithms. 


## Opening the Matlab App

1. Clone the repo. 
2. Open Matlab, and navigate to the cloned repo directory. 
3. Open `denoiser.mlapp`, either in the sidebar or in your OS. 
4. When the Matlab Application Designer Start Page appears, press the green "Run" button at the top.
5. Load an image, select the amount of noise to use, regularization constant, and algorithm type.
6. Press the "Run" button in the middle of the controls quadrant. This will run the program and you will see updates in the Matlab console in the backround.

Note: Matlab Application Designer does allow the user to export any applications into binary, such that usage is more universal. However, this also means that users cannot see the updates of the algorithm while the optimization process is running. Future updates will redirect console output into a separate app window and make the application more suitable for a binary format. 
