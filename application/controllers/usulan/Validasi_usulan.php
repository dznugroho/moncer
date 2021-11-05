<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Validasi_usulan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('usulan_model');
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
			$data['usulans']		= $this->usulan_model->getValidasi();
			$data['satuan']			= $this->usulan_model->getSatuan();
			$this->load->view('usulan_admin/validasi_usulan', $data);
		}
	}

	public function show($id=null)
	{
		if(!isset($id)) redirect('usulan_admin/validasi_usulan');

		if($this->session->userdata('role')=='1'){
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['subbidangs']		= $this->bidang_model->getSubbidang();
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data["usulan"]			= $this->usulan_model->getById($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("usulan_admin/detail_validasi", $data);

		}
	}


	public function validasi()
	{
		if($this->session->userdata('role')=='1'){
			
			$post	= $this->input->post();
			$usulan	= $this->usulan_model;
			
			$id					= $post["id"];
			$status_pengajuan	= $post["status_pengajuan"];
			$ket_pengajuan		= $post["ket_pengajuan"];
			
			$usulan->validasi_usulan($id,$status_pengajuan,$ket_pengajuan);
			$this->session->set_flashdata('success', 'Data has been updated');
			return redirect('usulan/validasi_usulan');
			
		}
	}
}
