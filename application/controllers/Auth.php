<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('auth_model');
		$this->load->library('form_validation');
		$this->load->library('session');
	}

	public function index()
	{
		$this->load->view('auth/login');
	}

	public function login()
	{
		$this->form_validation->set_rules('username','Username','required',
							array('required' => 'Silahkan Masukkan %s.'));
		$this->form_validation->set_rules('password','Password','required',
							array('required' => 'Silahkan Masukkan %s.'));

		if($this->form_validation->run() == FALSE){
			// $errors = $this->form_validation->error_array();
			// $this->session->set_flashdata('errors',$errors);
			// $this->session->set_flashdata('input',$this->input->post());
			// redirect('auth');
			$this->load->view('auth/login');
			
		}else{
			$username	= htmlspecialchars($this->input->post('username'));
			$pass		= htmlspecialchars($this->input->post('password'));
			$cek_login	= $this->auth_model->cek_login($username);

			if($cek_login == FALSE){
				$this->session->set_flashdata('error_login', 'Username yang Anda masukkan tidak terdaftar');
				redirect('auth');

			}else{
				if(password_verify($pass, $cek_login->password)){
					$this->session->set_userdata('id',		$cek_login->id);
					$this->session->set_userdata('username',$cek_login->username);
					$this->session->set_userdata('name',	$cek_login->name);
					$this->session->set_userdata('kecamatan',$cek_login->kecamatan);
					$this->session->set_userdata('desa',	$cek_login->desa);
					$this->session->set_userdata('alamat',	$cek_login->alamat);
					$this->session->set_userdata('no_telp',	$cek_login->no_telp);
					$this->session->set_userdata('email',	$cek_login->email);
					$this->session->set_userdata('role',	$cek_login->role);
					redirect('home');
					
				}else{
					$this->session->set_flashdata('error_login', 'Password yang Anda masukkan salah');
					// print_r($cek_login);
					redirect('auth');
				}	
			}
		}
	}

	public function registerForm()
	{
		$this->load->view('auth/register');
	}

	// public function register()
	// {
	// 	$this->form_validation->set_rules('username', 'Username', 'required|is_unique[users.username]');
	// 	$this->form_validation->set_rules('name', 'Nama', 'required');
    //     $this->form_validation->set_rules('email', 'Email', 'required|is_unique[users.email]|valid_email');
    //     $this->form_validation->set_rules('password', 'Password', 'required|trim');
    //     $this->form_validation->set_rules('confrim_password', 'Konfirmasi Password', 'required|trim|matches[password]');
    //     $this->form_validation->set_rules('role', 'Role', 'required');
 
    //     if ($this->form_validation->run() == FALSE) {
 
    //         $errors = $this->form_validation->error_array();
    //         $this->session->set_flashdata('errors', $errors);
    //         $this->session->set_flashdata('input', $this->input->post());
    //         redirect('auth/register');
 
    //     } else {
 
    //         $name = $this->input->post('name');
    //         $email = $this->input->post('email');
    //         $password = $this->input->post('password');
    //         $pass = password_hash($password, PASSWORD_DEFAULT);
    //         $role = $this->input->post('role');
 
    //         $data = [
    //             'name' => $name,
    //             'email' => $email,
    //             'password' => $pass,
    //             'role' => $role
    //         ];
 
    //         $insert = $this->auth_model->register("users", $data);
 
    //         if($insert){
 
    //             $this->session->set_flashdata('success_login', 'Sukses, Anda berhasil register. Silahkan login sekarang.');
    //             redirect('auth');
 
    //         }
    //     }
	// }

	public function logout()
	{
		$this->session->sess_destroy();
        echo '<script>
            alert("Sukses! Anda berhasil logout."); 
            window.location.href="'.base_url('auth').'";
            </script>';
	}
}
