#!/usr/bin/env bash

# Data Parameters
DATASET='shapenet'
NPTS=$((1*(2048)))

# Model Parameters
NET='TopNet' #TopNet/Folding
ENCODER_ID=1 #0 for PointNet, 1 for PCN Encoder
CODE_NFTS=1024
DIST_FUN='chamfer' #emd
NLEVELS=6
NFEAT=8


# Training Parameters
TRAIN=1
EVAL=$((1-$TRAIN))
RESUME=0
BENCHMARK=0
OPTIM='adagrad'
LR=0.5e-2
EPOCHS=300
SAVE_EPOCH=5
TEST_EPOCH=$SAVE_EPOCH
BATCH_SIZE=32
NWORKERS=4

# Data Augmentation
SCALE=0
ROT=1
MIRROR=0.5

PROGRAM="main.py"

python -u $PROGRAM --epochs $EPOCHS --lr $LR --batch_size $BATCH_SIZE \
    --nworkers  $NWORKERS --NET $NET --dataset $DATASET \
    --pc_augm_scale $SCALE --pc_augm_rot $ROT --pc_augm_mirror_prob $MIRROR \
    --eval $EVAL --optim $OPTIM --code_nfts $CODE_NFTS \
    --resume $RESUME --npts $NPTS --ENCODER_ID $ENCODER_ID --dist_fun $DIST_FUN \
    --save_nth_epoch $SAVE_EPOCH --test_nth_epoch $TEST_EPOCH \
    --benchmark $BENCHMARK --NLEVELS $NLEVELS --NFEAT $NFEAT
