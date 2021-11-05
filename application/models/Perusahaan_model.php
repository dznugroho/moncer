<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
class Perusahaan_model extends CI_Model 
{
	private $table = "users";

	public $id;
	public $username;
	public $name;
	public $password;
	public $email;
	public $kecamatan;
	public $desa;
	public $alamat;
	public $no_telp;
	public $role;

	public function rules()
	{
		return [
			['field'	=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'required|is_unique[users.username]|min_length[8]',
			'errors' 	=> array(
				'required'	=> 'Kamu belum memasukkan %s.',
				'is_unique'	=> 'Username telah digunakan')],
			
			['field'	=> 'name',
			'label'		=> 'Nama',
			'rules'		=> 'required'],

			['field'	=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|is_unique[users.email]',
			'errors' 	=> array(
				'required'	=> 'Kamu belum memasukkan %s.',
				'is_unique'	=> 'Email telah digunakan')],

			['field'	=> 'alamat',
			'label'		=> 'Alamat',
			'rules'		=> 'required'],
			
			['field'	=> 'no_telp',
			'label'		=> 'No_Telp',
			'rules'		=> 'required']
		];
	}

	public function getAll()
	{
		return $this->db->select('users.*,kecamatans.nama_kecamatan,desas.nama_desa')
			->from('users')
			->join('kecamatans','users.kecamatan	= kecamatans.id',	'left')
			->join('desas',		'users.desa 		= desas.id',		'left')
			->where('users.role', 3)
			->get()
			->result();
	}
	
	public function getByUser()
	{	
		$id = $this->session->userdata('id');
		return $this->db->select('users.*,kecamatans.nama_kecamatan,desas.nama_desa')
			->from('users')
			->join('kecamatans','users.kecamatan 	= kecamatans.id',	'left')
			->join('desas',		'users.desa 		= desas.id',		'left')
			->where('users.role', 3)
			->where('users.id', $id)
			->get()
			->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->table, ['id' => $id])->row();
	}

	public function getPerusahaan()
	{
		$id = $this->session->userdata('id');
		return $this->db->get_where($this->table, ['id' => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->username = trim($post["username"]);
		$this->name		= strtoupper($post["name"]);
		$pass			= $post["password"];
		$this->password	= password_hash($pass, PASSWORD_DEFAULT);
		$this->email	= $post["email"];
		$this->kecamatan= $post["kecamatan"];
		$this->desa		= $post["desa"];
		$this->alamat	= $post["alamat"];
		$this->no_telp	= $post["no_telp"];
		$this->role		= 3;

		return $this->db->insert($this->table, $this);
	}
		
	public function update($id,$username,$name,$email,$kecamatan,
						$desa,$alamat,$no_telp)
	{
			$this->db->set('username',	$username )
					->set('name', 		$name)
					->set('email',		$email)
					->set('kecamatan',	$kecamatan)
					->set('desa', 		$desa)
					->set('alamat', 	$alamat)
					->set('no_telp', 	$no_telp)
					->where('id',		$id)
					->update('users');
	}

	public function updateWithPass($id,$username,$name,$password,$email,
						$kecamatan,$desa,$alamat,$no_telp)
	{
			$this->db->set('username',	$username )
					->set('name', 		$name)
					->set('password', 	$password)
					->set('email',		$email)
					->set('kecamatan',	$kecamatan)
					->set('desa', 		$desa)
					->set('alamat', 	$alamat)
					->set('no_telp', 	$no_telp)
					->where('id',		$id)
					->update('users');
	}

	public function delete($id)
	{
		return $this->db->delete($this->table, array("id" => $id));
	}

	
}
