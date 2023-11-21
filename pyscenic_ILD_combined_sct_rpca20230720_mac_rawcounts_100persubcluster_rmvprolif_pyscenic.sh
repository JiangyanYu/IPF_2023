docker run -it --rm \
    -v /media/agschlitzer/DATA1/SCENIC:/data \
    aertslab/pyscenic_scanpy:0.12.1_1.9.1 pyscenic grn \
        --num_workers 26 \
        -o /data/IPF/rmv_prolif/expr_mat.adjacencies.tsv \
        /data/IPF/rmv_prolif/ILD_combined_sct_rpca20230720_mac_rawcounts_100persubcluster_rmvprolif_scenic.loom \
        /data/resources/allTFs_hg38_lastmodi20220427.txt
        
docker run -it --rm \
    -v /media/agschlitzer/DATA1/SCENIC:/data \
    aertslab/pyscenic_scanpy:0.12.1_1.9.1 pyscenic ctx \
        /data/IPF/rmv_prolif/expr_mat.adjacencies.tsv \
        /data/resources/hg38_500bp_up_100bp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather \
        /data/resources/hg38_10kbp_up_10kbp_down_full_tx_v10_clust.genes_vs_motifs.rankings.feather \
        --annotations_fname /data/resources/motifs-v10nr_clust-nr.hgnc-m0.001-o0.0.tbl \
        --expression_mtx_fname /data/IPF/rmv_prolif/ILD_combined_sct_rpca20230720_mac_rawcounts_100persubcluster_rmvprolif_scenic.loom \
        --mode "custom_multiprocessing" \
        --output /data/IPF/rmv_prolif/regulons.csv \
        --num_workers 26
        
docker run -it --rm \
    -v /media/agschlitzer/DATA1/SCENIC:/data \
    aertslab/pyscenic_scanpy:0.12.1_1.9.1 pyscenic aucell \
        /data/IPF/rmv_prolif/ILD_combined_sct_rpca20230720_mac_rawcounts_100persubcluster_rmvprolif_scenic.loom \
        /data/IPF/rmv_prolif/regulons.csv \
        -o /data/IPF/rmv_prolif/auc_mtx.csv \
        --num_workers 26                
