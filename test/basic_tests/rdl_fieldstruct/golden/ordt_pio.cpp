//   Ordt 190725.01 autogenerated file 
//   Input: ./rdl_fieldstruct/test.rdl
//   Parms: ./rdl_fieldstruct/test.parms
//   Date: Sun Nov 17 17:09:24 EST 2019
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

// ------------------ ordt_rg_areg methods ------------------

ordt_rg_areg::ordt_rg_areg(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    hier_fs_fs1_fld1(0, 4, 0x0, r_std, w_std),
    hier_fs_fs1_fld2(4, 1, 0, r_std, w_std),
    hier_fs_fld1(5, 1, 0, r_std, w_std),
    hier_fs_fs2_fld1(6, 4, 0x0, r_std, w_std),
    hier_fs_fs2_fld2(14, 1, 0, r_std, w_std),
    fs3_fld1(24, 4, 0x0, r_std, w_std),
    fs3_fld2(28, 1, 0, r_std, w_std) {
}

int  ordt_rg_areg::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_areg at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_areg\n";
  #endif
     return 8;
}

void  ordt_rg_areg::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  hier_fs_fs1_fld1.write(wdata);
  hier_fs_fs1_fld2.write(wdata);
  hier_fs_fld1.write(wdata);
  hier_fs_fs2_fld1.write(wdata);
  hier_fs_fs2_fld2.write(wdata);
  fs3_fld1.write(wdata);
  fs3_fld2.write(wdata);
}

int  ordt_rg_areg::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_areg at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_areg\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_areg::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  hier_fs_fs1_fld1.read(rdata);
  hier_fs_fs1_fld2.read(rdata);
  hier_fs_fld1.read(rdata);
  hier_fs_fs2_fld1.read(rdata);
  hier_fs_fs2_fld2.read(rdata);
  fs3_fld1.read(rdata);
  fs3_fld2.read(rdata);
}

// ------------------ ordt_rg_blabla methods ------------------

ordt_rg_blabla::ordt_rg_blabla(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_reg(_m_startaddress, _m_endaddress),
    fs1_0_fld1(0, 4, 0x0, r_std, w_std),
    fs1_0_fld2(4, 1, 0, r_std, w_std),
    fs1_1_fld1(5, 4, 0x0, r_std, w_std),
    fs1_1_fld2(9, 1, 0, r_std, w_std),
    fs1_2_fld1(10, 4, 0x0, r_std, w_std),
    fs1_2_fld2(14, 1, 0, r_std, w_std),
    fs3_0_fld1(15, 4, 0x0, r_std, w_std),
    fs3_0_fld2(19, 1, 0, r_std, w_std),
    fs3_1_fld1(23, 4, 0x0, r_std, w_std),
    fs3_1_fld2(27, 1, 0, r_std, w_std) {
}

int  ordt_rg_blabla::write(const uint64_t &addr, const ordt_data &wdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write of reg ordt_rg_blabla at addr="<< addr << ", data=" << wdata.to_string() << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->write(wdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> write to invalid address " << addr << " in reg ordt_rg_blabla\n";
  #endif
     return 8;
}

void  ordt_rg_blabla::write(const ordt_data &wdata) {
  std::lock_guard<std::mutex> m_guard(m_mutex);
  fs1_0_fld1.write(wdata);
  fs1_0_fld2.write(wdata);
  fs1_1_fld1.write(wdata);
  fs1_1_fld2.write(wdata);
  fs1_2_fld1.write(wdata);
  fs1_2_fld2.write(wdata);
  fs3_0_fld1.write(wdata);
  fs3_0_fld2.write(wdata);
  fs3_1_fld1.write(wdata);
  fs3_1_fld2.write(wdata);
}

int  ordt_rg_blabla::read(const uint64_t &addr, ordt_data &rdata) {
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read of reg ordt_rg_blabla at addr="<< addr << "\n";
  #endif
     if (this->hasStartAddress(addr)) {
        this->read(rdata);
        return 0;
     }
  #ifdef ORDT_PIO_VERBOSE
     std::cout << "--> read to invalid address " << addr << " in reg ordt_rg_blabla\n";
  #endif
     rdata.clear();
     return 8;
}

void  ordt_rg_blabla::read(ordt_data &rdata) {
  rdata.clear();
  for (uint64_t widx=0; widx<((m_endaddress - m_startaddress + 1)/4); widx++) rdata.push_back(0);
  fs1_0_fld1.read(rdata);
  fs1_0_fld2.read(rdata);
  fs1_1_fld1.read(rdata);
  fs1_1_fld2.read(rdata);
  fs1_2_fld1.read(rdata);
  fs1_2_fld2.read(rdata);
  fs3_0_fld1.read(rdata);
  fs3_0_fld2.read(rdata);
  fs3_1_fld1.read(rdata);
  fs3_1_fld2.read(rdata);
}

// ------------------ ordt_root methods ------------------

ordt_root::ordt_root()
  : ordt_root(0x0, 0xb) {
}

ordt_root::ordt_root(uint64_t _m_startaddress, uint64_t _m_endaddress)
  : ordt_regset(_m_startaddress, _m_endaddress),
    areg(_m_startaddress + 0x0, _m_startaddress + 0x3, 2, 0x4),
    blabla(_m_startaddress + 0x8, _m_startaddress + 0xb) {
  m_children.push_back(&areg);
  m_children.push_back(&blabla);
}

void  ordt_root::update_child_ptrs() {
  m_children.clear();
  m_children.push_back(&areg);
  m_children.push_back(&blabla);
}

