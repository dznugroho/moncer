<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Datausulan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('usulan_model');
		$this->load->model('csr_model');
		$this->load->model('perusahaan_model');
		$this->load->model('wilayah_model');
		$this->load->model('bidang_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
		if($this->session->userdata('role')!='3') redirect('home');

	}

	function getsubbidang(){
		$id = $this->input->post('id',TRUE);
		$data = $this->bidang_model->getSubbidangID($id)->result();
		echo json_encode($data);
	}
	
	public function embed()
    {
        $file = $this->uri->segment(4);
        echo "<embed src='".base_url('upload/file/'.$file)."' width='100%' height='100%'></embed>";
	}

	public function index()
	{
		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
		$data['desas']			= $this->wilayah_model->getDesa();
		$data['usulans'] 		= $this->usulan_model->getUsulan();
		$data['bidangs']		= $this->bidang_model->getBidang();

		$this->load->view('perusahaan/usulan_index', $data);
			
	}

	public function cari()
	{
		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
		$data['desas']			= $this->wilayah_model->getDesa();
		$data['bidangs']		= $this->bidang_model->getBidang();
		$data['satuan']			= $this->usulan_model->getSatuan();
		$data['usulans']		= $this->usulan_model->cariData();
		$this->load->view('perusahaan/usulan_index', $data);

	}
	
	public function pilihkegiatan()
	{	
		$post			= $this->input->post();
		$usulan_id		= $post["usulan_id"];
		$perusahaan_id	= $this->session->userdata('id');
		
		$cek_datacsr	= $this->csr_model->cekDataCSR($usulan_id,$perusahaan_id);
 
        if($cek_datacsr->num_rows() > 0){
			$post			= $this->input->post();
			$usulan_id		= $post["usulan_id"];
			$perusahaan_id	= $this->session->userdata('id');

			$this->csr_model->deleteCSR($usulan_id,$perusahaan_id);
			$this->usulan_model->savePilihKegiatan();
			$this->usulan_model->updateStatusPendanaan($usulan_id);

			$this->session->set_flashdata('success', 'Kegiatan berhasil dipilih');
			return redirect('perusahaan/datausulan');
		
		}else {
			$post			= $this->input->post();
			$usulan_id		= $post["usulan_id"];

			$this->usulan_model->savePilihKegiatan();
			$this->usulan_model->updateStatusPendanaan($usulan_id);

			$this->session->set_flashdata('success', 'Kegiatan berhasil dipilih');
			return redirect('perusahaan/datausulan');
		}
		
		
	}

	public function pilih($id=null)
	{
		if(!isset($id)) redirect('perusahaan/datausulan');

		$data['bidangs']		= $this->bidang_model->getBidang();
		$data['subbidangs']		= $this->bidang_model->getSubbidang();
		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
		$data['desas']			= $this->wilayah_model->getDesa();
		$data['satuan']			= $this->usulan_model->getSatuan();
		$data["usulan"]			= $this->usulan_model->getUsulanById($id);

		$this->load->view("perusahaan/pilih_kegiatan", $data);
		
	}


}
