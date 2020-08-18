<?php 
include 'koneksi.php';
if(isset($_GET['reqpin']) && $_GET['reqpin'] == 'edit')
{
	$namaform = "<i class = 'fa fa-edit'></i> Edit";
	$id_pinjaman 	= $_GET['id_pinjaman'];
	$query 			= mysql_query("SELECT * FROM pinjaman WHERE id_pinjaman='".$id_pinjaman."'");
	$data 			= mysql_fetch_array($query);
	$hasilkode 		= $data['id_pinjaman'];
	$nama_pinjaman  = $data['nama_pinjaman'];
	$id_anggota		= $data['id_anggota'];
	$besar_pinjaman = $data['besar_pinjaman'];
	$tgl_pengajuan_pinjaman = $data['tgl_pengajuan_pinjaman'];
	$tgl_acc_pinjaman = $data['tgl_acc_pinjaman'];
	$tgl_pinjaman 	= $data['tgl_pinjaman'];
	$tgl_pelunasan 	= $data['tgl_pelunasan'];
	$button 		= "<i class='fa fa-save'></i> Update";
}
elseif (isset($_GET['reqpin']) && $_GET['reqpin'] == 'add') 
{
	$nama_pinjaman     	= '';
	$id_anggota			= '';
	$besar_pinjaman    	= '';
	$tgl_pelunasan 		= '';
	$namaform = "<i class = 'fa fa-plus'></i> Tambah";
	$carikode = mysql_query("select max(id_pinjaman) from pinjaman") or die (mysql_error());
    $datakode = mysql_fetch_array($carikode);
    if ($datakode) 
    {   
     $nilaikode = substr($datakode[0], 3);
     $kode = (int) $nilaikode;
     $kode = $kode + 1;
     $hasilkode = "PMJ".str_pad($kode, 3, "0", STR_PAD_LEFT);
    }
	$_SESSION['id_anggota'] = $hasilkode;
	 date_default_timezone_get('Asia/Jakarta');
	 $tgl_pengajuan_pinjaman = date('Y-m-d');
	 $tambah_tanggal = mktime(0,0,0,date('m')+0,date('d')+1,date('Y')+0);
	 $tgl_acc_pinjaman = date('Y-m-d',$tambah_tanggal);
	 $tambah_tanggal_pinjaman = mktime(0,0,0,date('m')+0,date('d')+2,date('Y')+0);
	 $tgl_pinjaman = date('Y-m-d',$tambah_tanggal_pinjaman);
	 
	 $tambah_lunas_pendek = mktime(0,0,0,date('m')+9,date('d')+2,date('Y')+0);
	 $tanggal_lunas_pendek = date('Y-m-d',$tambah_lunas_pendek);
	 $tambah_lunas_menengah = mktime(0,0,0,date('m')+20,date('d')+2,date('Y')+0);
	 $tanggal_lunas_menengah = date('Y-m-d',$tambah_lunas_menengah);
	 $tambah_lunas_panjang = mktime(0,0,0,date('m')+30,date('d')+2,date('Y')+0);
	 $tanggal_lunas_panjang = date('Y-m-d',$tambah_lunas_panjang);
	 
	$button = "<i class='fa fa-save'></i> Simpan";	
}
?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small></h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="box">
            <div class="box-header">
              <h3 class="box-title"><?php  echo $namaform; ?> Data Pinjaman</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <?php 
				/*if (isset($_GET['nama']))
				{
					echo '<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					Nama Tidak Boleh Kosong!!!
					</div>';
				}
				else if (isset($_GET['alamat']))
				{
					echo '<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					Alamat Anda Kosong!!!
					</div>';
				}
				else if (isset($_GET['no_hp']))
				{
					echo '<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					No Handphone Anda Kosong!!!
					</div>';
				}
				else if (isset($_GET['tmp_lahir']))
				{
					echo '<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					Tempat Lahir Anda Kosong!!!
					</div>';
				}
				else if (isset($_GET['tgl_lahir']))
				{
					echo '<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					Tanggal Lahir Anda Kosong!!!
					</div>';
				}
				else if (isset($_GET['ket']))
				{
					echo '<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					Keterangan Anda Kosong!!!
					</div>';
				}*/
			
			?>
           <form role="form" action="proses.php" method="POST">
           <input type="hidden" name="reqpin" value="<?php echo $_GET['reqpin'] ?>">
           <input type="hidden" name="id_pinjaman" value="<?php echo $id_pinjaman ?>">
              <div class="box-body">
              <div class="form-group">
                  <label>ID Pinjaman</label>
                  <p style="color:#F00;"<small>*id pinjaman tidak dapat di ubah</small></p>
                  <input type="text" value="<?php echo $hasilkode ?>" class="form-control" name="id_pinjaman" rows="3" placeholder="ID Pinjaman">
                </div>
                <div class="form-group">
                  <label>Nama Pinjaman</label>
                  <select class="form-control" name="nama_pinjaman" onchange="inTEXTbox(this.value)" >
                  	<option selected="selected" value="0">-Pilih-</option>
						<?php
                    $result = mysql_query("select * from k_pinjaman");    
                    while ($row = mysql_fetch_array($result)) 
					{   
					?>
                        <option value="<?php echo $row['nama_pinjaman']; ?>"
                        <?php 
							if (isset($_GET['reqpin']) && $_GET['reqpin'] == 'edit')
							{
								if ($data['nama_pinjaman'] == $row['nama_pinjaman'])
								{
									echo 'selected="selected"';
								}
							}
						?>
                        ><?php echo $row['nama_pinjaman']; ?></option> 
                    
					<?php  } ?>    
                  </select>
                </div>
                <div class="form-group">
                <label>Nama Anggota</label>
                <select class="form-control select2 select2-hidden-accessible" style="width: 100%;" tabindex="-1" aria-hidden="false" name="id_anggota">
                  <option selected="selected" value="">-Pilih-</option>
                  <?php 
				  
				  $sql = mysql_query("SELECT * FROM anggota");
				  while ($r = mysql_fetch_array($sql)) {
				  ?>
                  <option value="<?php echo $r['id_anggota']?>" 
                  <?php 
							if (isset($_GET['reqpin']) && $_GET['reqpin'] == 'edit')
							{
								if ($data['id_anggota'] == $r['id_anggota'] || $data['id_anggota'] == $r['nama'])
								{
									echo 'selected="selected"';
								}
							}
				  ?>>
				  	<?php
						echo $r['id_anggota']. "&nbsp;|&nbsp;".$r['nama'];
					?>
                  </option>
                  <?php } ?>
                </select>
              	</div>

                
                <div class="form-group">
                  <label>Besar Pinjaman</label>
                  <input type="number" value="<?php echo $besar_pinjaman ?>" class="form-control" name="besar_pinjaman" rows="3" placeholder="Contoh 1000000">
                </div>
                <label for="exampleInputEmail1">Tanggal Pengajuan Pinjaman</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control" name="tgl_pengajuan_pinjaman" value="<?php echo $tgl_pengajuan_pinjaman ?>" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask="">
                </div>
                <label for="exampleInputEmail1">Tanggal Acc Peminjam</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control" name="tgl_acc_peminjam" value="<?php echo $tgl_acc_pinjaman ?>" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask="">
                </div>
                <label for="exampleInputEmail1">Tanggal Pinjaman</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control" name="tgl_pinjaman" value="<?php echo $tgl_pinjaman ?>" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask="">
                </div>
                <label for="exampleInputEmail1">Tanggal Pelunasan</label>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control" id="MicampoTXTO" name="tgl_pelunasan" value="<?php echo $tgl_pelunasan ?>" data-inputmask="'alias': 'yyyy/mm/dd'" data-mask="">
                </div>
                </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary"><?php echo $button ?></button>
              </div>
            </form>
            </div>
         </div>
    </section>
    <!-- /.content -->
  </div>