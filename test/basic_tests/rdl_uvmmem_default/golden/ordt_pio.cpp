//   Ordt 190725.01 autogenerated file 
//   Input: ./rdl_uvmmem_default/test.rdl
//   Parms: ./rdl_uvmmem_default/test.parms
//   Date: Sun Nov 17 17:09:34 EST 2019
//

#include "ordt_pio_common.hpp"
#include "ordt_pio.hpp"

// ------------------ ordt_addr_elem methods ------------------

ordt_addr_elem::ordt_addr_elem(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : m_startaddress(_m_startaddress),
    m_endaddress(_m_endaddress) {
}

bool  ordt_addr_elem::containsAddress(const uint64_t &addr) {
  return ((addr >= m_startaddress) && (addr <= m_endaddress));
}

bool  ordt_addr_elem::isBelowAddress(const uint64_t &addr) {
  return (addr > m_endaddress);
}

bool  ordt_addr_elem::isAboveAddress(const uint64_t &addr) {
  return (addr < m_startaddress);
}

bool  ordt_addr_elem::hasStartAddress(const uint64_t &addr) {
  return (addr == m_startaddress);
}

void  ordt_addr_elem::update_child_ptrs() {
}

// ------------------ ordt_regset methods ------------------

ordt_addr_elem*  ordt_regset::findAddrElem(const uint64_t &addr) {
  int lo = 0;
  int hi = m_children.size()-1;
  int mid = 0;
  while (lo <= hi) {
     mid = (lo + hi) / 2;
     if (m_children[mid]->containsAddress(addr)) {
        //outElem = m_children[mid];
        return m_children[mid];
     }
     else if (m_children[mid]->isAboveAddress(addr))
        hi = mid - 1;
     else
        lo = mid + 1;
  }
  return nullptr;
}

ordt_regset::ordt_regset(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_addr_elem(_m_startaddress, _m_endaddress) {
}

int  ordt_regset::write(const uint64_t &addr, const ordt_data &wdata) {
     if (this->containsAddress(addr)) {
        childElem = this->findAddrElem(addr);
        if (childElem != nullptr) { return childElem->write(addr, wdata); }
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in regset\n";
  #endif
     return 8;
}

int  ordt_regset::read(const uint64_t &addr, ordt_data &rdata) {
     if (this->containsAddress(addr)) {
        childElem = this->findAddrElem(addr);
        if (childElem != nullptr) { return childElem->read(addr, rdata); }
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in regset\n";
  #endif
     rdata.clear();
     return 8;
}

// ------------------ ordt_reg methods ------------------

ordt_reg::ordt_reg(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_addr_elem(_m_startaddress, _m_endaddress) {
}

ordt_reg::ordt_reg(const ordt_reg &_old)
  : ordt_addr_elem(_old),
    m_mutex() {
}

void  ordt_reg::write(const ordt_data &wdata) {
}

int  ordt_reg::write(const uint64_t &addr, const ordt_data &wdata) {
     return 0;
}

void  ordt_reg::read(ordt_data &rdata) {
}

int  ordt_reg::read(const uint64_t &addr, ordt_data &rdata) {
     return 0;
}

// ------------------ ordt_rg_sr1 methods ------------------

ordt_rg_sr1::ordt_rg_sr1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 32, 0x0, r_std, w_std) {
}

int  ordt_rg_sr1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_sr1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_sr1\n";
  #endif
     return 8;
}

void  ordt_rg_sr1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
}

int  ordt_rg_sr1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_sr1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_sr1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_sr1::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
}

// ------------------ ordt_rg_wr1 methods ------------------

ordt_rg_wr1::ordt_rg_wr1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 16, 0x0, r_std, w_std),
    fld2(16, 16, 0x0, r_std, w_std),
    fld3(32, 16, 0x0, r_std, w_std),
    fld4(48, 16, 0x0, r_std, w_std),
    fld5(64, 16, 0x0, r_std, w_std),
    fld6(80, 16, 0x0, r_std, w_std),
    fld7(96, 16, 0x0, r_std, w_std),
    fld8(112, 16, 0x0, r_std, w_std) {
}

int  ordt_rg_wr1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_wr1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_wr1\n";
  #endif
     return 8;
}

void  ordt_rg_wr1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
  fld2.write(wdata);
  fld3.write(wdata);
  fld4.write(wdata);
  fld5.write(wdata);
  fld6.write(wdata);
  fld7.write(wdata);
  fld8.write(wdata);
}

int  ordt_rg_wr1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_wr1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_wr1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_wr1::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
  fld2.read(rdata);
  fld3.read(rdata);
  fld4.read(rdata);
  fld5.read(rdata);
  fld6.read(rdata);
  fld7.read(rdata);
  fld8.read(rdata);
}

// ------------------ ordt_rg_sr_repeat1 methods ------------------

ordt_rg_sr_repeat1::ordt_rg_sr_repeat1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 32, 0x0, r_std, w_std) {
}

int  ordt_rg_sr_repeat1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_sr_repeat1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_sr_repeat1\n";
  #endif
     return 8;
}

void  ordt_rg_sr_repeat1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
}

int  ordt_rg_sr_repeat1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_sr_repeat1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_sr_repeat1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_sr_repeat1::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
}

// ------------------ ordt_rg_sr_repeat2 methods ------------------

ordt_rg_sr_repeat2::ordt_rg_sr_repeat2(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 32, 0x0, r_std, w_std) {
}

int  ordt_rg_sr_repeat2::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_sr_repeat2 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_sr_repeat2\n";
  #endif
     return 8;
}

void  ordt_rg_sr_repeat2::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
}

int  ordt_rg_sr_repeat2::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_sr_repeat2 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_sr_repeat2\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_sr_repeat2::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
}

// ------------------ ordt_rg_sr_repeat3 methods ------------------

ordt_rg_sr_repeat3::ordt_rg_sr_repeat3(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 32, 0x0, r_std, w_std) {
}

int  ordt_rg_sr_repeat3::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_sr_repeat3 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_sr_repeat3\n";
  #endif
     return 8;
}

void  ordt_rg_sr_repeat3::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
}

int  ordt_rg_sr_repeat3::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_sr_repeat3 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_sr_repeat3\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_sr_repeat3::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
}

// ------------------ ordt_rg_srmem1 methods ------------------

ordt_rg_srmem1::ordt_rg_srmem1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 32, 0x0, r_std, w_std) {
}

int  ordt_rg_srmem1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_srmem1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_srmem1\n";
  #endif
     return 8;
}

void  ordt_rg_srmem1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
}

int  ordt_rg_srmem1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_srmem1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_srmem1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_srmem1::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
}

// ------------------ ordt_rg_wrmem1 methods ------------------

ordt_rg_wrmem1::ordt_rg_wrmem1(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fld1(0, 16, 0x0, r_std, w_std),
    fld2(16, 16, 0x0, r_std, w_std),
    fld3(32, 16, 0x0, r_std, w_std),
    fld4(48, 16, 0x0, r_std, w_std),
    fld5(64, 16, 0x0, r_std, w_std),
    fld6(80, 16, 0x0, r_std, w_std),
    fld7(96, 16, 0x0, r_std, w_std),
    fld8(112, 16, 0x0, r_std, w_std) {
}

int  ordt_rg_wrmem1::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_wrmem1 at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_wrmem1\n";
  #endif
     return 8;
}

void  ordt_rg_wrmem1::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fld1.write(wdata);
  fld2.write(wdata);
  fld3.write(wdata);
  fld4.write(wdata);
  fld5.write(wdata);
  fld6.write(wdata);
  fld7.write(wdata);
  fld8.write(wdata);
}

int  ordt_rg_wrmem1::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_wrmem1 at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_wrmem1\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_wrmem1::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fld1.read(rdata);
  fld2.read(rdata);
  fld3.read(rdata);
  fld4.read(rdata);
  fld5.read(rdata);
  fld6.read(rdata);
  fld7.read(rdata);
  fld8.read(rdata);
}

// ------------------ ordt_root methods ------------------

ordt_root::ordt_root()
  : ordt_root(0x0, 0x212bf) {
}

ordt_root::ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    sr1(_m_startaddress + 0x0, _m_startaddress + 0x3),
    wr1(_m_startaddress + 0x100, _m_startaddress + 0x10f),
    sr_repeat1(_m_startaddress + 0x200, _m_startaddress + 0x203),
    sr_repeat2(_m_startaddress + 0x204, _m_startaddress + 0x207),
    sr_repeat3(_m_startaddress + 0x208, _m_startaddress + 0x20b),
    srmem1(_m_startaddress + 0x2000, _m_startaddress + 0x2003, 100, 0x4),
    wrmem1(_m_startaddress + 0x20000, _m_startaddress + 0x2000f, 300, 0x10) {
  m_children.push_back(&sr1);
  m_children.push_back(&wr1);
  m_children.push_back(&sr_repeat1);
  m_children.push_back(&sr_repeat2);
  m_children.push_back(&sr_repeat3);
  m_children.push_back(&srmem1);
  m_children.push_back(&wrmem1);
}

void  ordt_root::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&sr1);
  m_children.push_back(&wr1);
  m_children.push_back(&sr_repeat1);
  m_children.push_back(&sr_repeat2);
  m_children.push_back(&sr_repeat3);
  m_children.push_back(&srmem1);
  m_children.push_back(&wrmem1);
}

