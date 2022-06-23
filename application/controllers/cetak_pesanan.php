<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cetak_pesanan extends CI_Controller
{

    public function index()
    {
        $data['tittle'] = "cetak laporan berdasarkan pesanan data di PHP Codeigniter";
        $data['pesanan'] = $this->db->get('pesanan')->result();
        $this->load->view('laporan/cetak', $data);
    }
}
