# snippets


## Structure

### Quickly extract likelihoods from a set of files and write to output file (which can be processed in BBEDIT)

`egrep -r 'Mean value of ln likelihood =' Process/ | cat >output2.txt`


## Multifasta

##### get a list of contig sizes

`cat fasta.fa | awk '$0 ~ ">" {if (NR > 1) {print c;} c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }'`

####### ht: Daniel Cook: https://www.danielecook.com/generate-fasta-sequence-lengths/


## Process huge folder of alignments

###### compute consensus for each for BLASTN
(must install EMBOSS package: conda install emboss)
(if you need an alignment, you can use a mafft one liner)

##### uses the cons package in EMBOSS to generate consensus
`for i in *.fasta; do cons -sequence $i -outseq w_cons/$i.con; done`

##### EMBOSS adds a weird header to the consensus, this fixes it
`awk '{if( FNR==1)print ">"FILENAME;else print}' * > W_consensus.fasta`

##### Run the blast
`blastn -db mel_blast -query W_consensus.fasta -out w_blast.out -word_size 11 -outfmt 6 -max_target_seqs 1`

##### Select the first hit 
`sort -k1,1 -k12,12nr -k11,11n w_blast.out | sort -u -k1,1 --merge > w_top_hit.out`
