<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Status_kegiatan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('csr_model');
		$this->load->model('admin_model');
		$this->load->model('desa_model');
		$this->load->model('perusahaan_model');
		$this->load->model('wilayah_model');
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
	}

	public function index()
	{
		if($this->session->userdata('role') =='2'){
					
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['usulans']		= $this->csr_model->getStatusKegiatanDesa();
			$data['csr']			= $this->csr_model->getDataStatusKegiatanDesa();
			$data['laporan']		= $this->csr_model->getDataLapVal();
			$this->load->view('usulan_desa/status_kegiatan', $data);
			// print_r($data['usulans']);
		}elseif($this->session->userdata('role') =='3'){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['usulans']		= $this->csr_model->getStatusKegiatan();
			$data['csr']			= $this->csr_model->getDataStatusKegiatan();
			$this->load->view('perusahaan/status_kegiatan', $data);
		}else {
			return redirect('home');
		}

	}

	public function update()
	{
		$csr				= $this->csr_model;
		$post				= $this->input->post();
		
		$inputdana			= $post["dana"];
		
		$csr_id				= $post["csr_id"];
		$penanggung_jawab	= $post["penanggung_jawab"];
		$jumlah_target		= $post["jumlah_target"];
		$dana				= preg_replace("/[^0-9]/", "", $inputdana);
		$tgl_mulai			= $post["tgl_mulai"];
		$tgl_selesai		= $post["tgl_selesai"];

		$csr->updateDataKegiatan($csr_id,$penanggung_jawab,$jumlah_target,$dana,
								$tgl_mulai,$tgl_selesai);
		// print_r($csr);
		$this->session->set_flashdata('success', 'Data has been updated');
		return redirect('csr/status_kegiatan');

	}

	public function delete($usulan_id=null)
	{
		if(!isset($usulan_id)) show_404();

		$this->csr_model->delete($usulan_id);
		$this->csr_model->updateStatusPendanaan($usulan_id);
		$this->session->set_flashdata('success', 'Data has been deleted');
		redirect(site_url('csr/status_kegiatan'));
	}

	public function deleteWithStatus()
	{
		$post				= $this->input->post();

		$usulan_id			= $post["usulan_id"];
		$csr_id				= $post["csr_id"];

		$this->csr_model->delete($csr_id);
		$this->csr_model->updateStatusPendanaan($usulan_id);
		$this->session->set_flashdata('success', 'Data has been deleted');
		redirect(site_url('csr/status_kegiatan'));
	}
	
	public function konfirmasi_csr()
	{
	    $post				= $this->input->post();

		$konfirmasi_desa	= $post["konfirmasi_desa"];
		$csr_id				= $post["csr_id"];
		
		$this->csr_model->KonfirmasiCSR($csr_id,$konfirmasi_desa);

		$this->session->set_flashdata('success', 'Pelaksanaan Berhasil Dikonfirmasi');
		return redirect('csr/status_kegiatan');
	}

	// public function embed()
    // {
    //     $dokumen_pelaksanaan = $this->uri->segment(4);
    //     echo "<embed src='".base_url('upload/pelaksanaan/'.$dokumen_pelaksanaan)."' width='100%' height='100%'></embed>";
	// }

	// public function addFile(){
	// 	$post = $this->input->post();
	// 	$this->usulan_id				= $post["usulan_id"];

	// 	$config['upload_path']          = './upload/pelaksanaan/';
	// 	$config['allowed_types']        = 'pdf|docx|doc';
	// 	$config['file_name']            = $this->usulan_id.time();
	// 	$config['overwrite']			= true;
	// 	$config['max_size']             = 1024;
        
	// 	$this->load->library('upload',$config);
		
	//     if($this->upload->do_upload("dokumen_pelaksanaan")){
	// 		$data = array('upload_data' => $this->upload->data());
			
	// 		$usulan_id				= $this->input->post('usulan_id');
	// 		$dokumen_pelaksanaan 	= $data['upload_data']['file_name'];

	// 	$this->csr_model->addFile($usulan_id,$dokumen_pelaksanaan);

	// 	}
	// 	redirect('csr/pelaksanaan_csr');
	// }

	// function getsubbidang(){
	// 	$id = $this->input->post('id',TRUE);
	// 	$data = $this->bidang_model->getSubbidangID($id)->result();
	// 	echo json_encode($data);
	// }

	// public function cari()
	// {
	// 	$cari	= $this->input->post('cari');
	// 	if ($cari == 0 ){
	// 		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
	// 		$data['desas']			= $this->wilayah_model->getDesa();
	// 		$data['bidangs']		= $this->bidang_model->getBidang();
	// 		$data['usulans']		= $this->csr_model->cariPelaksanaan();
	// 		$data['pelaksanaan']	= $this->csr_model->getPelaksanaan();
	// 		$data['csr']			= $this->csr_model->getCSR();
	// 		$this->load->view('csr/pelaksanaan_csr', $data);
	// 	}else{
	// 		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
	// 		$data['desas']			= $this->wilayah_model->getDesa();
	// 		$data['bidangs']		= $this->bidang_model->getBidang();
	// 		$data['usulans']		= $this->csr_model->cariPelaksanaan();
	// 		$data['pelaksanaan']	= $this->csr_model->getPelaksanaan();
	// 		$data['csr']			= $this->csr_model->getCSR();
	// 		$this->load->view('laporan/print_pelaksanaan', $data);
	// 	}

	// }

	// public function show($id=null)
	// {
	// 	if(!isset($id)) redirect('csr/pelaksanaan_csr');

	// 	if($this->session->userdata('role')=='1'){
	// 		$data["usulan"]			= $this->csr_model->getById($id);
	// 		$data["perusahaan"]		= $this->csr_model->getPerusahaan($id);
	// 		if(!$data["usulan"]) show_404();

	// 		$this->load->view("csr/detail_penyerahan", $data);

	// 	}
	// }

	

}
