# Multi-Objective DNN hyperparameter Optimization guided by BO
# Main components:

1. Deeparch-xplorer

Model setting and hyperparameters Config
Func: Loop training
Init: Config init; 
Input: New Config generated from spearmint
Output: Accuracy &(Resource Consumption)

2. Spearmint

BO opt method with noices, constraints 
Func: find where to explore next
Init: default Config from deeparch-xplorer
Input: f() from deeparch-xplorer
Output: Which Config to xplore next

# DeepArch-Xplorer

A design space exploration tool for deep neural architectures: exploring a highly-dimensional space of hyper-parameters, design architecture, and their deployment over edge cloud.


# Install

```bash
git clone https://github.com/pooyanjamshidi/deeparch-xplorer.git
cd deeparch-xplorer
make
```

# Usage

```python
python3 run_exp.py
```

# Maintainer

If you need a new feature to be added, please contact [Pooyan Jamshidi](https://pooyanjamshidi.github.io).

