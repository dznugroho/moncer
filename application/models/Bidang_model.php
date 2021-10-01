<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bidang_model extends CI_Model
{
	public function getBidang()
	{
		return $this->db->get('bidangs')->result();
	}

	public function getSubbidang()
	{
		return $this->db->get('subbidangs')->result();
	}

	public function getSubbidangID($id)
	{
		return $this->db->get_where('subbidangs', array('bidang_id' => $id));
	}
	
	public function getPendidikan()
	{
		return $this->db->select('subbidangs.*')
						->from('subbidangs')
						->join('bidangs', 'subbidangs.bidang_id = bidangs.id','left')
						->where('subbidangs.bidang_id', 1)
						->get()->result();
	}
	public function getKesehatan()
	{
		return $this->db->select('subbidangs.*')
						->from('subbidangs')
						->join('bidangs', 'subbidangs.bidang_id = bidangs.id','left')
						->where('subbidangs.bidang_id', 2)
						->get()->result();
	}
	public function getLingkungan()
	{
		return $this->db->select('subbidangs.*')
						->from('subbidangs')
						->join('bidangs', 'subbidangs.bidang_id = bidangs.id','left')
						->where('subbidangs.bidang_id', 3)
						->get()->result();
	}
	public function getPek()
	{
		return $this->db->select('subbidangs.*')
						->from('subbidangs')
						->join('bidangs', 'subbidangs.bidang_id = bidangs.id','left')
						->where('subbidangs.bidang_id', 4)
						->get()->result();
	}
	public function getInfrastruktur()
	{
		return $this->db->select('subbidangs.*')
						->from('subbidangs')
						->join('bidangs', 'subbidangs.bidang_id = bidangs.id','left')
						->where('subbidangs.bidang_id', 5)
						->get()->result();
	}

	public function getPendidikanById($id)
	{
		return $this->db->get_where('subbidangs', ['id' => $id])->result();
	}
	public function getKesehatanById($id)
	{
		return $this->db->get_where('subbidangs', ['id' => $id])->result();
	}
	public function getLingkunganById($id)
	{
		return $this->db->get_where('subbidangs', ['id' => $id])->result();
	}
	public function getPekById($id)
	{
		return $this->db->get_where('subbidangs', ['id' => $id])->result();
	}
	public function getInfrastrukturById($id)
	{
		return $this->db->get_where('subbidangs', ['id' => $id])->result();
	}
}
