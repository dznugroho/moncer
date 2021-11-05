<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Datausulan extends CI_Controller
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

	public function addFile(){
		$config['upload_path']          = './upload/file/';
		$config['allowed_types']        = 'pdf|docx|doc';
		$config['file_name']            = $this->session->userdata('id').time();
		$config['overwrite']			= true;
		$config['max_size']             = 1024;
        
		$this->load->library('upload',$config);
		
	    if($this->upload->do_upload("file")){
			$data = array('upload_data' => $this->upload->data());
			
			$id		= $this->input->post('id');
			$file 	= $data['upload_data']['file_name'];

		$this->usulan_model->addFile($id,$file);

		}
		redirect('usulan/datausulan');
	}

	public function index()
	{
		if($this->session->userdata('role')=='1'){
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['usulans']		= $this->usulan_model->getUsulan();
			$data['bidangs']		= $this->bidang_model->getBidang();
			$this->load->view('usulan_admin/index', $data);
		}else{
			return redirect('home');
		}
	}

	public function create()
	{
		if($this->session->userdata('role')=='1'){
			$data['bidangs']			= $this->bidang_model->getBidang();
			$data['subbidangs']			= $this->bidang_model->getSubbidang();
			$data['kecamatans']			= $this->wilayah_model->getKecamatan();
			$data['desas']				= $this->wilayah_model->getDesa();
			$data['satuan']				= $this->usulan_model->getSatuan();
	
			$this->load->view('usulan_admin/create', $data);
		}else{
			
			redirect('home');
			
		}
	}

	public function store()
	{
		$usulan		= $this->usulan_model;
			
			$usulan->save();
			// print_r($usulan);
			$this->session->set_flashdata('success', 'Data has been saved');
			return redirect('usulan/datausulan');

	}

	public function edit($id=null)
	{	
		if(!isset($id)) redirect('usulan/datausulan');

		if($this->session->userdata('role')=='1'){
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['subbidangs']		= $this->bidang_model->getSubbidang();
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['satuan']			= $this->usulan_model->getSatuan();
			$data["usulan"]			= $this->usulan_model->getUsulanById($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("usulan_admin/edit", $data);

		}else{
			return redirect('home');
		}
	}

	public function update()
	{	
		$post	= $this->input->post();
		$usulan	= $this->usulan_model;
		
		$inputanggaran = $post["anggaran"];
		$pagu_anggaran = $result = preg_replace("/[^0-9]/", "", $inputanggaran);

		$id					= $post["id"];
		$bidang_id			= $post["bidang"];
		$subbidang_id		= $post["subbidang"];
		$nama_kegiatan		= $post["nama_kegiatan"];
		$thn_pengusulan		= $post["tahun_pengusulan"];
		$jumlah_target		= $post["jumlah_target"];
		$satuan_id			= $post["satuan_id"];
		$anggaran			= $pagu_anggaran;
		$hasil_kegiatan		= $post["hasil_kegiatan"];
		$kecamatan_id		= $post["kecamatan"];
		$desa_id			= $post["desa"];
		$alamat_kegiatan	= $post["alamat_kegiatan"];
		$nama_pengusul		= $post["nama_pengusul"];
		$status_pengajuan	= 1;
		$id_pengusul		= $this->session->userdata('id');

		if (!empty($_FILES["file"]["name"])) {
			$file 			= $usulan->uploadFile();
		} else {
			$file 			= $post["old_file"];
		}

		$usulan->update($id,$bidang_id,$subbidang_id,$nama_kegiatan,
						$thn_pengusulan,$jumlah_target,$satuan_id,$anggaran,
						$hasil_kegiatan,$kecamatan_id,$desa_id,
						$alamat_kegiatan,$nama_pengusul,$status_pengajuan,
						$id_pengusul,$file);
		$this->session->set_flashdata('success', 'Data has been updated');
		return redirect('usulan/datausulan');
		// print_r($usulan);
		
	}

	public function show($id=null)
	{
		if(!isset($id)) redirect('usulan/datausulan');

		if($this->session->userdata('role')=='1'){
			$data['bidangs']		= $this->bidang_model->getBidang();
			$data['subbidangs']		= $this->bidang_model->getSubbidang();
			$data['kecamatans']		= $this->wilayah_model->getKecamatan();
			$data['desas']			= $this->wilayah_model->getDesa();
			$data['satuan']			= $this->usulan_model->getSatuan();
			$data["usulan"]			= $this->usulan_model->getUsulanById($id);
			if(!$data["usulan"]) show_404();

			$this->load->view("usulan_admin/detail", $data);

		}else{
			return redirect('home');
		}
	}

	public function cari()
	{
		$data['kecamatans']		= $this->wilayah_model->getKecamatan();
		$data['desas']			= $this->wilayah_model->getDesa();
		$data['bidangs']		= $this->bidang_model->getBidang();
		$data['satuan']			= $this->usulan_model->getSatuan();
		$data['usulans']		= $this->usulan_model->cariData();
		$this->load->view('usulan_admin/index', $data);

	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		$this->usulan_model->delete($id);
		$this->session->set_flashdata('success', 'Data has been deleted');
		redirect(site_url('usulan/datausulan'));
	}
}
