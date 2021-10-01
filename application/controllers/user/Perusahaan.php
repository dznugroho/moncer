<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Perusahaan extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('perusahaan_model');
		$this->load->model('wilayah_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
		if($this->session->userdata('role')!='1') redirect('home');
	}

	public function index()
	{
		$data['perusahaans'] = $this->perusahaan_model->getAll();
		$this->load->view('perusahaan/index', $data);
	}

	public function create()
	{	
		$data['kecamatans'] = $this->wilayah_model->getKecamatan();
		$this->load->view("perusahaan/create", $data);

	}

	public function store()
	{	
		$perusahaan = $this->perusahaan_model;
		$validation = $this->form_validation;
		$validation->set_rules($perusahaan->rules());
		$validation->set_rules('password','Password','required|min_length[8]');
		
		if($validation->run() == FALSE){

			$data['kecamatans'] = $this->wilayah_model->getKecamatan();
			$this->load->view('perusahaan/create', $data);
		}else{
			$perusahaan->save();
			$this->session->set_flashdata('success', 'Data has been saved');
			return redirect('user/perusahaan');
		}

	}

	public function edit($id=null)
	{	
		if(!isset($id)) redirect('user/perusahaan');

		$data['kecamatans']	= $this->wilayah_model->getKecamatan();
		$data['desas']		= $this->wilayah_model->getDesa();
		$data["perusahaan"]		= $this->perusahaan_model->getById($id);
		if(!$data["perusahaan"]) show_404();

		$this->load->view("perusahaan/edit", $data);
	}

	public function update()
	{	
		$post	= $this->input->post();
		$perusahaan	= $this->perusahaan_model;
		
		$validation = $this->form_validation;
		$validation->set_rules('username','Username','required');
		$validation->set_rules('name','Name','required');
		$validation->set_rules('email','Email','required|valid_email');
		$validation->set_rules('password','Password','min_length[8]');
		$validation->set_rules('alamat','Alamat','required');
		$validation->set_rules('no_telp','No_Telp','required|numeric');

		if($validation->run() == FALSE){
			$id					= $this->uri->segment(3);
			$data['kecamatans']	= $this->wilayah_model->getKecamatan();
			$data['desas'] 		= $this->wilayah_model->getDesa();
			$data["perusahaan"] = $perusahaan->getById($id);

			$this->load->view('perusahaan/create', $data);
			
		}else{
			if(empty(trim($post["password"]))){
				$id			= trim($post["id"]);
				$username	= trim($post["username"]);
				$name		= strtoupper($post["name"]);
				$email		= $post["email"];
				$kecamatan	= $post["kecamatan"];
				$desa		= $post["desa"];
				$alamat		= $post["alamat"];
				$no_telp	= $post["no_telp"];

				$perusahaan->update($id,$username,$name,$email,$kecamatan,
							$desa,$alamat,$no_telp);
				$this->session->set_flashdata('success', 'Data has been updated');
				return redirect('user/perusahaan');

			}else{
				$id			= trim($post["id"]);
				$username	= trim($post["username"]);
				$name		= strtoupper($post["name"]);
				$pass		= $post["password"];
				$password	= password_hash($pass, PASSWORD_DEFAULT);
				$email		= $post["email"];
				$kecamatan	= $post["kecamatan"];
				$desa		= $post["desa"];
				$alamat		= $post["alamat"];
				$no_telp	= $post["no_telp"];

				$perusahaan->updateWithPass($id,$username,$name,$password,$email,$kecamatan,
							$desa,$alamat,$no_telp);
				$this->session->set_flashdata('success', 'Data has been updated');
				return redirect('user/perusahaan');
			}
		}
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		$this->perusahaan_model->delete($id);
		$this->session->set_flashdata('success', 'Data has been deleted');
		redirect(site_url('user/perusahaan'));
			
		
	}
}
