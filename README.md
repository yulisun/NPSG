# NPSG
Nonlocal Patch Similarity based Graph (NPSG) for heterogeneous remote sensing change detection
Code: NPSG - PR 2021
This is a test program for the NPSG. NPSG is based on the image self-similarity. 
The relationship between the target patch and its similar patches can be regarded 
as the structure of this target patch, which is quite well preserved across the different types
of imaging modality, then it can be used to build the relationship between heterogeneous images.

The computational time of NPSG is relatively long, to reduce the
computational complexity, we recommend using a larger opt.delt_s and
opt.delt_p, which of course has an impact on accuracy.

Another better suggestion is to use the INLPG algorithm we proposed
(https://github.com/yulisun/INLPG) or the IRG-McS algorithm (https://github.com/yulisun/IRG-McS).

If you use this code for your research, please cite our papers.

@article{sun109nonlocal,

  title={Nonlocal patch similarity based heterogeneous remote sensing change detection},
  author={Sun, Yuli and Lei, Lin and Li, Xiao and Sun, Hao and Kuang, Gangyao}, 
  journal={Pattern Recognition},
  volume={109},
  pages={107598},
  publisher={Elsevier}
  
If you have any queries, please do not hesitate to contact me (yulisun@mail.ustc.edu.cn ).

