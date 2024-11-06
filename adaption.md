#### Changes

Here I state what I changed in the skeleton of this repo for my purposes.


1. I added 1c0p data with activity score of DALA_Km and normalized DALA_KM (wt_norm). 
2. In the regression.py I changed that the normalized values are taken as observables instead of the unnormalized ("score" --> unnormalized, "wt_norm" --> normalized) 
3. I created the split directory and created predefined splits for the 1c0p data
4. I added pooling layer to the model
5. the 1c0p_log2 is where the normalized wt scores are transofmred back with log2.
6. added both 1c0p and 1c0p_log2 to constants.py
7. I created 