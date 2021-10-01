<?php
defined('BASEPATH') OR exit('No direct script access allowed');
	
class Wilayah_model extends CI_Model 
{
	public function getAll()
	{
		return $this->db->select('desas.*,kecamatans.nama_kecamatan')
				->from('desas')
				->join('kecamatans','desas.kecamatan_id = kecamatans.id')
				->get()
				->result();
	}

	public function getKecamatan()
	{
		return $this->db->get('kecamatans')->result();
	}

	public function getDesa()
	{
		return $this->db->get('desas')->result();
	}

	public function getDesaID($id)
	{
		return $this->db->get_where('desas', array('kecamatan_id' => $id));
	}
	
}
