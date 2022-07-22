<!DOCTYPE html>
<html lang="en">
<head>
  <?php $this->load->view('include/head.php') ?>
	<!-- CSS Libraries -->
	<link rel="stylesheet" href="<?= base_url('assets/modules/dataTables.bootstrap4.min.css')?>">
  <link rel="stylesheet" href="<?= base_url('assets/modules/select.bootstrap4.min.css')?>">  
  <style>
.highcharts-figure,
.highcharts-data-table table {
    min-width: 310px;
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 400px;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

  </style>
</head>
<body>
  <div id="app">
    <div class="main-wrapper">
	  <div class="navbar-bg"></div>
	  
	  <?php $this->load->view('include/navbar.php') ?>
	  
	  <?php $this->load->view('include/sidebar.php') ?>

<!-- Main Content -->
<div class="main-content">
<section class="section">
    <div class="section-header">
      <h1>Dashboard</h1>
    </div>
    <div class="row">
    <?php if( $this->session->userdata('role') == 1){ ?>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-danger">
            <i class="fas fa-comment-alt"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Usulan Kegiatan</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_diterima); ?>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-warning">
            <i class="fas fa-check"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Usulan Belum Konfirmasi</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_validasi); ?>

            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-primary">
            <i class="fas fa-dollar-sign"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Usulan Didanai</h4>
            </div>
            <div class="card-body">
             
                 <?php echo count($usulan_didanai); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-success">
            <i class="fas fa-tasks"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Laporan Diterima</h4>
            </div>
            <div class="card-body">
            <?php echo count($laporan); ?>
              
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body">
            <figure class="highcharts-figure">
                <div id="pelaksanaan"></div>
                
            </figure>
          </div>
        </div>
      </div> -->
      <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body">
            <figure class="highcharts-figure">
                <div id="statuslaporan"></div>
                
            </figure>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body">
            <figure class="highcharts-figure">
                <div id="totalpendanaan"></div>
                
            </figure>
          </div>
        </div>
      </div>
    <?php
      // ADMIN
      $pendanaan1 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 2 ");
      $tot_pendanaan1 = $pendanaan1->result();
   
      // PERUSAHAAN
      // $perusahaan_id = $this->session->userdata('id');
      $status_lap2 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 2 ");
      $lap2 = $status_lap2->result();
      // echo json_encode($lap2);
      $status_lap1 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 1 ");
      $lap1 = $status_lap1->result();

      $status_lap3 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 3 ");
      $lap3 = $status_lap3->result();

      // DESA
      date_default_timezone_set('Asia/Jakarta');
      $pelaksanaan1 = $this->db->query("SELECT tgl_mulai, 
      DATEDIFF(CURRENT_DATE() , tgl_mulai) FROM CSR 
      RIGHT JOIN usulans ON usulans.id = csr.usulan_id
      RIGHT JOIN laporan ON laporan.csr_id	= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 1
      AND CURRENT_DATE() >= csr.tgl_mulai");
      $status_pelaksanaan1 = $pelaksanaan1->result();

      $pelaksanaan2 = $this->db->query("SELECT tgl_mulai, 
      DATEDIFF(CURRENT_DATE() , tgl_mulai) FROM CSR 
      RIGHT JOIN usulans ON usulans.id = csr.usulan_id
      RIGHT JOIN laporan ON laporan.csr_id	= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 1
      AND CURRENT_DATE() < csr.tgl_mulai");
      $status_pelaksanaan2 = $pelaksanaan2->result();

      $pelaksanaan3 = $this->db->query("SELECT tgl_mulai, 
      DATEDIFF(CURRENT_DATE() , tgl_mulai) FROM CSR 
      RIGHT JOIN usulans ON usulans.id = csr.usulan_id
      RIGHT JOIN laporan ON laporan.csr_id	= csr.csr_id
      where status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND CURRENT_DATE() > csr.tgl_mulai");
      $status_pelaksanaan3 = $pelaksanaan3->result();
    ?>

    <?php }elseif( $this->session->userdata('role') == 2) { ?>

      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-primary">
            <i class="far fa-comment"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Pengajuan</h4>
            </div>
            <div class="card-body">
             
                 <?php echo count($total_pengajuan); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-warning">
            <i class="fas fa-hourglass"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Pengajuan Diproses</h4>
            </div>
            <div class="card-body">
            <?php echo count($pengajuan_diproses); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-success">
            <i class="fas fa-check"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Pengajuan Diterima</h4>
            </div>
            <div class="card-body">
            <?php echo count($pengajuan_diterima); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-danger">
            <i class="fas fa-times"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Pengajuan Ditolak</h4>
            </div>
            <div class="card-body">
            <?php echo count($pengajuan_ditolak); ?>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
            <canvas id="myChart2" width="302" height="151" style="display: block; width: 302px; height: 151px;" class="chartjs-render-monitor"></canvas>
          </div>
        </div>
      </div> -->
      
      <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body">
            <figure class="highcharts-figure">
                <div id="pelaksanaan"></div>
                
            </figure>
          </div>
        </div>
      </div>

    <?php 
      // DESA
      date_default_timezone_set('Asia/Jakarta');
      $id_pengusul = $this->session->userdata('id');

      $pelaksanaan1 = $this->db->query("SELECT tgl_mulai, 
      DATEDIFF(CURRENT_DATE() , tgl_mulai) FROM CSR 
      RIGHT JOIN usulans ON usulans.id = csr.usulan_id
      RIGHT JOIN laporan ON laporan.csr_id	= csr.csr_id
      where id_pengusul = '".$id_pengusul."' AND status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 1
      AND CURRENT_DATE() >= csr.tgl_mulai");
      $status_pelaksanaan1 = $pelaksanaan1->result();

      $pelaksanaan2 = $this->db->query("SELECT tgl_mulai, 
      DATEDIFF(CURRENT_DATE() , tgl_mulai) FROM CSR 
      RIGHT JOIN usulans ON usulans.id = csr.usulan_id
      RIGHT JOIN laporan ON laporan.csr_id	= csr.csr_id
      where id_pengusul = '".$id_pengusul."' AND status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 1
      AND CURRENT_DATE() < csr.tgl_mulai");
      $status_pelaksanaan2 = $pelaksanaan2->result();

      $pelaksanaan3 = $this->db->query("SELECT tgl_mulai, 
      DATEDIFF(CURRENT_DATE() , tgl_mulai) FROM CSR 
      RIGHT JOIN usulans ON usulans.id = csr.usulan_id
      RIGHT JOIN laporan ON laporan.csr_id	= csr.csr_id
      where id_pengusul = '".$id_pengusul."' AND status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND CURRENT_DATE() > csr.tgl_mulai");
      $status_pelaksanaan3 = $pelaksanaan3->result();
    ?>
      <!-- <div class="card">
      <canvas id="myChart"></canvas>
      </div> -->
    <?php }else{ ?>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-info">
            <i class="fas fa-comment-alt"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Total Usulan Kegiatan</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_diterima); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-primary">
            <i class="fas fa-dollar-sign"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Usulan Didanai</h4>
            </div>
            <div class="card-body">
            <?php echo count($usulan_danai); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-warning">
            <i class="fas fa-hourglass"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Pendanaan Diproses</h4>
            </div>
            <div class="card-body">
            <?php echo count($pendanaan_diproses); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
          <div class="card-icon bg-success">
            <i class="fas fa-check"></i>
          </div>
          <div class="card-wrap">
            <div class="card-header">
              <h4>Pendanaan Diterima</h4>
            </div>
            <div class="card-body">
            <?php echo count($pendanaan_diterima); ?>
            </div>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body">
            <figure class="highcharts-figure">
                <div id="statuslaporan"></div>
                
            </figure>
          </div>
        </div>
      </div>
      <?php
      // PERUSAHAAN
      $perusahaan_id = $this->session->userdata('id');
      $status_lap2 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where perusahaan_id = '".$perusahaan_id."' AND status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 2 ");
      $lap2 = $status_lap2->result();
      // echo json_encode($lap2);
      $status_lap1 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where perusahaan_id = '".$perusahaan_id."' AND status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 1 ");
      $lap1 = $status_lap1->result();

      $status_lap3 = $this->db->query("SELECT usulans.bidang_id AS itung FROM CSR 
      LEFT JOIN usulans ON usulans.id = csr.usulan_id
      LEFT JOIN laporan ON laporan.csr_id			= csr.csr_id
      where perusahaan_id = '".$perusahaan_id."' AND status_csr = 2 
      AND status_pengajuan = 2 AND status_pendanaan = 2
      AND status_validasi = 3 ");
      $lap3 = $status_lap3->result();

      ?>
      <!-- <div class="col-12 col-md-6 col-lg-6">
        <div class="card">
          <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
            <canvas id="myChart" width="302" height="151" style="display: block; width: 302px; height: 151px;" class="chartjs-render-monitor"></canvas>
          </div>
        </div>
      </div> -->
    <?php }?>
    </div>    
</section>
</div>

  <?php $this->load->view('include/footer.php') ?>

	<?php $this->load->view('include/script.php') ?>
	
  <!-- Page Specific JS File -->
  <!-- <script src="<?= base_url()?>assets/js/page/index-0.js"></script> -->
  <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>
  <script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script type="text/javascript">

<?php if($this->session->userdata('role')==1) { ?>
  Highcharts.chart('statuslaporan', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'STATUS LAPORAN CSR'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
            'Status Laporan Pelaksanaan CSR'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} Usulan</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Terlapor',
        data: [<?php echo count($lap2) ?> ]

    }, {
        name: 'Belum Terlapor',
        data: [<?php echo count($lap1) ?>]

    }, {
        name: 'Diterima',
        data: [<?php echo count($lap3) ?>]

    }]
  });
 
  // Highcharts.chart('pelaksanaan', {
  //   chart: {
  //       type: 'column'
  //   },
  //   title: {
  //       text: 'STATUS PELAKSANAAN CSR'
  //   },
  //   subtitle: {
  //       text: ''
  //   },
  //   xAxis: {
  //       categories: [
  //           'Status Pelaksanaan CSR'
  //       ],
  //       crosshair: true
  //   },
  //   yAxis: {
  //       min: 0,
  //       title: {
  //           text: ''
  //       }
  //   },
  //   tooltip: {
  //       headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
  //       pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
  //           '<td style="padding:0"><b>{point.y} Usulan</b></td></tr>',
  //       footerFormat: '</table>',
  //       shared: true,
  //       useHTML: true
  //   },
  //   plotOptions: {
  //       column: {
  //           pointPadding: 0.2,
  //           borderWidth: 0
  //       }
  //   },
  //   series: [{
  //       name: 'Dalam Pelaksanaan',
  //       data: [<?php echo count($status_pelaksanaan1) ?> ]

  //   }, {
  //       name: 'Belum Terlaksana',
  //       data: [<?php echo count($status_pelaksanaan2) ?>]

  //   }, {
  //       name: 'Terlaksana',
  //       data: [<?php echo count($status_pelaksanaan3) ?>]

  //   }]
  // });

  Highcharts.chart('totalpendanaan', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'TOTAL PENDANAAN CSR'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
            'Status Pendanaan CSR'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y}</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: '2020',
        data: [100000000 ]

    }, {
        name: '2021',
        data: [200000000 ]

    }, {
        name: '2022',
        data: [135000000 ]

    }]
  });

<?php }elseif($this->session->userdata('role')==2) { ?>
  Highcharts.chart('pelaksanaan', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'STATUS PELAKSANAAN CSR'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
            'Status Pelaksanaan CSR'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} Usulan</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Dalam Pelaksanaan',
        data: [<?php echo count($status_pelaksanaan1) ?> ]

    }, {
        name: 'Belum Terlaksana',
        data: [<?php echo count($status_pelaksanaan2) ?>]

    }, {
        name: 'Terlaksana',
        data: [<?php echo count($status_pelaksanaan3) ?>]

    }]
  });

<?php }else{ ?>

  Highcharts.chart('statuslaporan', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'STATUS LAPORAN CSR'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
            'Status Laporan Pelaksanaan CSR'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y} Usulan</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Terlapor',
        data: [<?php echo count($lap2) ?> ]

    }, {
        name: 'Belum Terlapor',
        data: [<?php echo count($lap1) ?>]

    }, {
        name: 'Diterima',
        data: [<?php echo count($lap3) ?>]

    }]
  });

<?php } ?>

</script>
</body>
</html>
