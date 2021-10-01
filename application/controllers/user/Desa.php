<?php
defined('BASEPATH') OR exit('No direct script allowed');

class Desa extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('desa_model');
		$this->load->model('wilayah_model');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->cek_status();
		if($this->session->userdata('role')!='1') redirect('home');
	}

	public function index()
	{
		$data['desas'] = $this->desa_model->getAll();
		$this->load->view('desa/index', $data);
	}

	public function create()
	{	
		$data['kecamatans'] = $this->wilayah_model->getKecamatan();
		$this->load->view("desa/create", $data);

	}

	public function store()
	{	
		$desa = $this->desa_model;
		$validation = $this->form_validation;
		$validation->set_rules($desa->rules());
		$validation->set_rules('password','Password','required|min_length[8]');
		
		if($validation->run() == FALSE){

			$data['kecamatans'] = $this->wilayah_model->getKecamatan();
			$this->load->view('desa/create', $data);
		}else{
			$desa->save();
			$this->session->set_flashdata('success', 'Data has been saved');
			return redirect('user/desa');
		}

	}

	public function edit($id=null)
	{	
		if(!isset($id)) redirect('user/desa');

		$data['kecamatans']	= $this->wilayah_model->getKecamatan();
		$data['desas']		= $this->wilayah_model->getDesa();
		$data["desa"]		= $this->desa_model->getById($id);
		if(!$data["desa"]) show_404();

		$this->load->view("desa/edit", $data);
	}

	public function update()
	{	
		$post	= $this->input->post();
		$desa_model	= $this->desa_model;
		
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
			$data["desa"] 		= $desa_model->getById($id);

			$this->load->view('desa/create', $data);
			
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

				$desa_model->update($id,$username,$name,$email,$kecamatan,
							$desa,$alamat,$no_telp);
				$this->session->set_flashdata('success', 'Data has been updated');
				return redirect('user/desa');

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

				$desa_model->updateWithPass($id,$username,$name,$password,$email,
									$kecamatan,$desa,$alamat,$no_telp);
				$this->session->set_flashdata('success', 'Data has been updated');
				return redirect('user/desa');
			}
		}
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		$this->desa_model->delete($id);
		$this->session->set_flashdata('success', 'Data has been deleted');
		redirect(site_url('user/desa'));
			
		
	}
}
