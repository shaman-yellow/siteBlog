---
contributors:
- LiChuang Huang
title: "Bioinformatics"
date: "2023-04-30T16:26:03+00:00"
lastmod: "2023-04-30T16:26:06+00:00"
draft: false
images: []
menu:
  docs:
    parent: "notes"
weight: 1001
toc: true
---



## Prologue

...

## Sequence database

>- [GenBank](http://www.ncbi.nlm.nih.gov/)
>- [EMBL-Bank](http://www.ebi.ac.uk/)
>- [DDBJ](http://www.ddbj.nig.ac.jp/)



<figure>
<center><img src="/docs/notes//figs/fig1.svg"></center>
<center><figcaption>INSDC</figcaption></center>
</figure>



<figure>
<center><img src="/docs/notes//figs/fig2.svg"></center>
<center><figcaption>Entrez system</figcaption></center>
</figure>

### GenBank

- Genome DNA Database
    - STSs 序列标签位点
    - GSSs 基因组勘测序列
    - HTGS 高通量基因组序列

- RNA level
    - cDNA Database
    - ESTs 表达序列标签
    - UniGene

### RefSeq

为每一个基因的正常（无突变）传录本和正常的蛋白质产物提供最有代表性的序列。

### CLI Tool: EDirect

><http://www.ncbi.nlm.nih.gov/books/NBK179288/>


```bash
esearch -db pubmed -query "pevsner j AND gnaq" | efetch -format docsum
```

### BioMart

...

## Dual Sequence Matching

### Concept

- 同源性
- 空位
    - 起始空位
    - 延伸空位
- ...

### Margaret Dayhoff

Margaret Dayhoff (1966, 1978)

1. PAM: 可接受点突变
2. f: 氨基酸出现的频率
3. 氨基酸的相对突变率
4. 进化距离为1PAM的突变概率矩阵
5. PAM250和其他PAM矩阵
6. 相关优势值矩阵
7. 对数优势值矩阵

### Algorithms

#### Global

- Needleman-Wunsch (1970)

#### Local

- Smith-Waterman (1981)
- BLAST (1990)
- FASTA (1988)

### Signifiant

E-value...

## BLAST

### Program

- BLASTP: protein -> protein
- BLASTN: DNA -> DNA
- BLASTX: DNA -> protein
- TBLASTN: protein -> DNA
- TBLASTX: DNA -> DNA

### Parameters

- Query, e.g., FASTA
- Limit by Entrez Query, ...
- Max target sequence, ...
- Short queries, 短查询序列
- Expected thereshold, E-value
- Word size, ...
- Max mathes in a query range, ...
- Matrix, ...
- Gap costs, 空位成本
- Compositional adjustment, adjust E-value.
- Masking, 避免匹配到低复杂度或重复的片段

### BLAST software

><http://blast.ncbi.nlm.nih.gov/>
>
><http://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html#downloadblastdata>

## Advance database search

### Spetial BLAST

...

### Search for distantly related 'proteins'

#### 位置特异性迭代BLAST (PSI-BLAST)

当一个基因组被完整测序，需要寻找预测蛋白的同源物，可以用到PSI-BLAST（NCBI提供）。

- 查询序列搜索，例如BLASTP。
- 利用搜索结果创建多序列比对，基于此构建专门的、个体化的搜索矩阵。位置特异性打分矩阵（PSSM）
- PSSM用于再次搜索。
- 显著性评估。
- 迭代搜索，一般迭代5次。

污染问题：无关序列的虚假扩增。措施：

- 过滤算法。
- 调低入选阈值，如E-value
- 人工检查可疑序列。

#### 反向位置特异BLAST（RPS-BLAST）

将查询蛋白在PSSM数据库中搜索。

#### 结构域增强的查找时间加速的BLAST（DELTA-BLAST）

DELTA-BLAST用RPS-BLAST搜索预先计算好的PSSM库，用新得到的PSSM来搜索蛋白质数据库。

#### 模式识别BLASR（PHI-BLAST)

...

#### Profile hidden Markov models (HMMs)

生成用于识别远源序列相似度的位置特异性打分系统，类似于PSSMs。

>HMMER sortware: <http://hmmer.janelia.org/>

### BLAST-like fast search for genomic 'DNA'

基因组DNA搜索的特殊需求：

- 基因组DNA包含外显子和内含子。能找到外显子。
- 考虑测序的引入错误。
- 基因组DNA比较。
- DNA序列的微小差异。

#### PatternHunter

提高灵敏度和速度。

#### BLASTZ

物种基因组比对。

#### Enredo, Pecan

#### MegaBLAST, 不连续MegaBLAST

NCBI的优化用于快速比对长DNA查询序列的工具。

#### BLAT

#### LAGAN

基因组DNA成对比对的方法。

#### SSAHA2

二代测序读段应用到参考基因组上。

### Comparison of NGS read segments with the reference genome

#### 基于哈希表的比对

MAQ, ELANDv2 (Illumina), SSAHA2

#### Burrows-Wheeler (BWT)

对高考基因组进行变换和压缩，提高检索速度。

## Multiple Sequence Aligment (MSA)

使用多重序列比对：

- 蛋白质或基因与一大组蛋白质相关。
- 蛋白质家族有远源成员。
- 查看数据库搜索结果时，显示保守的残基与模体。
- 预测有害突变。
- 种群数据研究。
- 基因组测序时，定义所有基因产物所属的蛋白质家族。
- 生成系统发育树。
- ...

### The 5 Main Algorithm

#### 精确法

相当耗时。

#### 渐进比对法

计算待比对序列的两两比对得分，开始于醉相思的序列，渐进添加更多序列。

>ClustalM: <http://www.ebi.ac.uk/Tools/>

- 计算相似度——距离矩阵。
- 计算得到引导树。
- 基于引导树多序列比对。

#### 迭代法

渐进比对法的改进（改进距离矩阵，引导树）

>MAFFT: <http://mafft.cbrc.jp/alignment/software>
>
>PRALINE: <http://www.ibi.vu.nl/programs/pralinewww/>

#### 基于一致性方法

整合了来自多重序列比对的证据指导双序列比对。例如，x比对z，z比对y，那么x比对上y。

>**ProbCons**: <http://probcons.stanford.edu/>
>
>T-COFFEE: <http://www.tcoffee.org/>

#### 基于结构的方法 

T-COFFEE Expresso
PRALINE

### Evaluation of software or algorithm by reference dataset

- BAliBASE
- HOMSTRAD
- OXBench
- PREFAB
- SABmark
- IRMBASE (virtual)

### Database for multiple sequences comparisons

#### Pfam

HMMs 模型的蛋白质家族数据库。

>Pfam: <http://pfam.sanger.ac.uk/>, <http://pfam.janelia.org/>, <http://pfam>

#### SMART

类似于Pfam，...

>SMART: <http://smart.embl-hei-delberg.de/>

#### 整合型数据库

>InterPro: <http://www.ebi.ac.uk/interpro/release_notes.html>

>iProClass: ...

### Multiple sequence alignment of genomic regions

>- UCSC: <http://genome.ucsc.edu/>
>- Galaxy
>- Ensembl

## Phylogeny and evolution at the molecular level

物种变化主要机制：

- 生长条件影响发育。
- 有性繁殖的机制确保传代。
- 受选择的突变和遗传漂变导致基因和更大范围的染色体改变。

### Principles

#### 分子钟假说

对于每一个给定的基因而言，分子进化速率时相对恒定的。限制：

- 不同物种可能有不同的分子进化速率。
- 分子钟对不同基因，或者不同部分有所不同。
- 基因只有在进化过程中保持生物学功能才适用。

#### 正选择和负选择

在分子水平上，进化观点认为正选择和负选择也作用在DNA序列上。

#### 中性理论

大部分观测到的DNA替代时中性的或近中性的，因为大部分非同义突变都是有害的。

### Characteristics

>MEGA: <http://www.megasoftware.net/>

系统发育树包括两大主要信息：拓扑结构和分支长度。

- OTU (operational taxonomic unit)，操作分类单位。
- 二叉树，叉状分枝树，一个内节点只有两个直接后代谱系。
- 有根树和无根树。

>一些系统发育研究项目为上千个分类群构建了进化树：
>
>- Deep Green plant project: <http://ucjeps.berkeley.edu/GPphylo/>
>- 核糖体数据库：<http://rdp.cme.msu.edu/>

穷举检索法检索所有可能的树并选择最合适的。

### Types

- 物种树与基因/蛋白质树。
- 基于DNA、RNA、或蛋白质的数。
    - DNA包含同义突变和非同义突变的研究
    - ...
    - 蛋白质有20种状态（氨基酸），包含更强的系统发育信号。

### Analysis

#### 序列获取

FASTA格式

- NCBI HomoloGene
- BLAST家族蛋白质

#### 多重序列比对

- 确保同源
- 降低罚分，容纳远缘
- 限制为可用的蛋白质或核苷酸序列部分

#### DNA和氨基酸替代模型

- Jukes-Cantor 单参数模型
- Kimura 双参数模型
- gamma 模型

#### 构树的方法

以下为方法和相关软件

- 距离法：
- 最大简约法：PAUP
- 最大似然法：TREE-PUZZLE <http://www.treepuzzle.de/>
- 贝叶斯法：MrBayes <http://mrbayes.sourceforge.net/index.php>
- MEGA：<http://www.megasoftware.net/>
- PHYLIP：<http://evolution.genetics.washington.edu/phylip/general.html>


