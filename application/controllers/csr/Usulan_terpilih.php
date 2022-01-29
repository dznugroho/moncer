<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Usulan_terpilih extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('csr_model');
		$this->load->model('admin_model');
		$this->load->model('wilayah_model');
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
	}

	public function index()
	{
		if($this->session->userdata('role')=='1'){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['usulans']		= $this->csr_model->getValidasiDana();
			$data['csr']			= $this->csr_model->getDatacsrVal();
			$this->load->view('csr/usulan_terpilih', $data);
		}
	}

	public function validasidana()
	{
		if($this->session->userdata('role')=='1'){
			
			$post				= $this->input->post();
			$status_csr			= $post["status_csr"];

			if($status_csr == 2){
				$csr_id				= $post["csr_id"];
				$status_csr			= $post["status_csr"];
				
				$this->csr_model->saveLapKegiatan($csr_id);
				$this->csr_model->validasiPendanaan($csr_id,$status_csr);

				$this->session->set_flashdata('success', 'Pendanaan Telah Dikonfirmasi');
				return redirect('csr/usulan_terpilih');
			}
// 			}else if($status_csr == 3){
// 				$csr_id				= $post["csr_id"];
// 				$status_csr			= $post["status_csr"];

// 				$usulan_id			= $post["usulan_id"];

// 				$this->csr_model->validasiPendanaan($csr_id,$status_csr);
// 				$this->csr_model->updateStatusPendanaan($usulan_id);
// 				// $this->csr_model->deleteLapKegiatan($csr_id);

// 				$this->session->set_flashdata('success', 'Status Pendanaan Telah Diubah');
// 				return redirect('csr/usulan_terpilih');
// 			}	
		}
	}

	// public function show($id=null)
	// {
	// 	if(!isset($id)) redirect('csr/dana_csr');

	// 	if($this->session->userdata('role')=='1'){
	// 		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
	// 		$data['desas']			= $this->wilayah_model->getDesa();
	// 		$data["usulan"]			= $this->csr_model->getById($id);
	// 		$data["perusahaan"]		= $this->csr_model->getPerusahaan($id);
	// 		if(!$data["usulan"]) show_404();

	// 		$this->load->view("csr/tinjau_pendanaan", $data);

	// 	}
	// }

	

}
