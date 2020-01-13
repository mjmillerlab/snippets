#! /bin/bash

### Prior to running this, you have to convert the fasta file to one without line breaks. I do this in BBEdit; you can do a batch search for all of these
### Requires the following software:   mafft (conda install mafft), seqmagick (conda install seqmagick), and paup (http://phylosolutions.com/paup-test/)
### Put the paup executable into a folder containing the two edited_genes.fa files (one for Bocas and one for Darien), name the folder by the Genus

### Separate out each gene ##

for file in *_edited.fa; do awk '/12S/{print;getline;print}' $file >> 12S.fasta; done
for file in *_edited.fa; do awk '/16S/{print;getline;print}' $file >> 16S.fasta; done
for file in *_edited.fa; do awk '/ATPase 6/{print;getline;print}' $file >> ATPase_6.fasta; done
for file in *_edited.fa; do awk '/ATPase 8/{print;getline;print}' $file >> ATPase_8.fasta; done
for file in *_edited.fa; do awk '/COI/{print;getline;print}' $file >> COI.fasta; done
for file in *_edited.fa; do awk '/COII/{print;getline;print}' $file >> COII.fasta; done
for file in *_edited.fa; do awk '/COIII/{print;getline;print}' $file >> COIII.fasta; done
for file in *_edited.fa; do awk '/Cyt b/{print;getline;print}' $file >> Cyt_b.fasta; done
for file in *_edited.fa; do awk '/ND1/{print;getline;print}' $file >> ND1.fasta; done
for file in *_edited.fa; do awk '/ND2/{print;getline;print}' $file >> ND2.fasta; done
for file in *_edited.fa; do awk '/ND3/{print;getline;print}' $file >> ND3.fasta; done
for file in *_edited.fa; do awk '/ND4/{print;getline;print}' $file >> ND4.fasta; done
for file in *_edited.fa; do awk '/ND4L/{print;getline;print}' $file >> ND4L.fasta; done
for file in *_edited.fa; do awk '/ND5/{print;getline;print}' $file >> ND5.fasta; done
for file in *_edited.fa; do awk '/ND6/{print;getline;print}' $file >> ND6.fasta; done
for file in *_edited.fa; do awk '/tRNA-Ala/{print;getline;print}' $file >> tRNA-Ala.fasta; done
for file in *_edited.fa; do awk '/tRNA-Arg/{print;getline;print}' $file >> tRNA-Arg.fasta; done
for file in *_edited.fa; do awk '/tRNA-Asn/{print;getline;print}' $file >> tRNA-Asn.fasta; done
for file in *_edited.fa; do awk '/tRNA-Asp/{print;getline;print}' $file >> tRNA-Asp.fasta; done
for file in *_edited.fa; do awk '/tRNA-Cys/{print;getline;print}' $file >> tRNA-Cys.fasta; done
for file in *_edited.fa; do awk '/tRNA-Gln/{print;getline;print}' $file >> tRNA-Gln.fasta; done
for file in *_edited.fa; do awk '/tRNA-Glu/{print;getline;print}' $file >> tRNA-Glu.fasta; done
for file in *_edited.fa; do awk '/tRNA-Gly/{print;getline;print}' $file >> tRNA-Gly.fasta; done
for file in *_edited.fa; do awk '/tRNA-His/{print;getline;print}' $file >> tRNA-His.fasta; done
for file in *_edited.fa; do awk '/tRNA-Ile/{print;getline;print}' $file >> tRNA-Ile.fasta; done
for file in *_edited.fa; do awk '/tRNA-Leu/{print;getline;print}' $file >> tRNA-Leu.fasta; done
for file in *_edited.fa; do awk '/tRNA-Lys/{print;getline;print}' $file >> tRNA-Lys.fasta; done
for file in *_edited.fa; do awk '/tRNA-Met/{print;getline;print}' $file >> tRNA-Met.fasta; done
for file in *_edited.fa; do awk '/tRNA-Phe/{print;getline;print}' $file >> tRNA-Phe.fasta; done
for file in *_edited.fa; do awk '/tRNA-Pro/{print;getline;print}' $file >> tRNA-Pro.fasta; done
for file in *_edited.fa; do awk '/tRNA-Ser/{print;getline;print}' $file >> tRNA-Ser.fasta; done
for file in *_edited.fa; do awk '/tRNA-Thr/{print;getline;print}' $file >> tRNA-Thr.fasta; done
for file in *_edited.fa; do awk '/tRNA-Trp/{print;getline;print}' $file >> tRNA-Trp.fasta; done
for file in *_edited.fa; do awk '/tRNA-Tyr/{print;getline;print}' $file >> tRNA-Tyr.fasta; done
for file in *_edited.fa; do awk '/tRNA-Val/{print;getline;print}' $file >> tRNA-Val.fasta; done


### Align each pairwise gene ##

for name in *.fasta; do mafft  --retree 2 --maxiterate 2 $name > ${name%.fasta}_aln.fasta; done


### Convert fasta alignment to nexus ##

for alignment in *_aln.fasta; do seqmagick convert $alignment ${alignment%_aln.fasta}.nex --alphabet dna; done


### Add Paup Block to nexus files ##

for alignment in 12S.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=12S.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in 16S.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=16S.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ATPase_6.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ATPase_6.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ATPase_8.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ATPase_8.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in COI.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=COI.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in COII.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=COII.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in COIII.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=COIII.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in Cyt_b.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=Cyt_b.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND1.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND1.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND2.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND2.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND3.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND3.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND4.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND4.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND4L.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND4L.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND5.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND5.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in ND6.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=ND6.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Ala.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Ala.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Arg.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Arg.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Asn.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Asn.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Asp.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Asp.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Cys.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Cys.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Gln.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Gln.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Glu.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Glu.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Gly.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Gly.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-His.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-His.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Ile.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Ile.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Leu.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Leu.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Lys.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Lys.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Met.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Met.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Phe.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Phe.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Pro.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Pro.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Ser.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Ser.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Thr.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Thr.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Trp.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Trp.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Tyr.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Tyr.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done
for alignment in tRNA-Val.nex; do echo "begin paup;" >> $alignment; echo "set autoclose=yes;" >> $alignment; echo "set criterion=distance;" >> $alignment; echo "Dset distance =GTR;"  >> $alignment; echo "SaveDist File=tRNA-Val.nex_dist.txt;" >> $alignment; echo "quit;" >> $alignment; done


## Run paup on each file 

./paup4a166_osx tRNA-Asp.nex
./paup4a166_osx tRNA-Cys.nex
./paup4a166_osx tRNA-Gln.nex
./paup4a166_osx tRNA-Glu.nex
./paup4a166_osx tRNA-Gly.nex
./paup4a166_osx tRNA-His.nex
./paup4a166_osx tRNA-Ile.nex
./paup4a166_osx tRNA-Leu.nex
./paup4a166_osx tRNA-Lys.nex
./paup4a166_osx tRNA-Met.nex
./paup4a166_osx tRNA-Phe.nex
./paup4a166_osx tRNA-Pro.nex
./paup4a166_osx tRNA-Ser.nex
./paup4a166_osx tRNA-Thr.nex
./paup4a166_osx tRNA-Trp.nex
./paup4a166_osx tRNA-Tyr.nex
./paup4a166_osx tRNA-Val.nex
./paup4a166_osx 12S.nex
./paup4a166_osx 16S.nex
./paup4a166_osx ATPase_6.nex
./paup4a166_osx ATPase_8.nex
./paup4a166_osx COI.nex
./paup4a166_osx COII.nex
./paup4a166_osx COIII.nex
./paup4a166_osx Cyt_b.nex
./paup4a166_osx ND1.nex
./paup4a166_osx ND2.nex
./paup4a166_osx ND3.nex
./paup4a166_osx ND4.nex
./paup4a166_osx ND4L.nex
./paup4a166_osx ND5.nex
./paup4a166_osx ND6.nex
./paup4a166_osx tRNA-Ala.nex
./paup4a166_osx tRNA-Arg.nex
./paup4a166_osx tRNA-Asn.nex

