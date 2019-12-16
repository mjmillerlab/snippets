# snippets


## Structure

#### Quickly extract likelihoods from a set of files and write to output file (which can be processed in BBEDIT)

`egrep -r 'Mean value of ln likelihood =' Process/ | cat >output2.txt`

## Process huge folder of alignments

##### compute consensus for each for BLASTN
(must install EMBOSS package: conda install emboss)
(if you need an alignment, you can use a mafft one liner)
`for i in *.fasta; do cons -sequence $i -outseq w_cons/$i.con; done
`awk '{if( FNR==1)print ">"FILENAME;else print}' * > W_consensus.fasta
