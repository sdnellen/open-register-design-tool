//   Ordt 180623.01 autogenerated file 
//   Input: ./rdl_uvmmem_default/test.rdl
//   Parms: ./rdl_uvmmem_default/test.parms
//   Date: Sat Jun 23 14:56:38 EDT 2018
//

import uvm_pkg::*;
import ordt_uvm_reg_pkg::*;

// Register sr1
class reg_top_sr1 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl fld1;
  
  function new(string name = "reg_top_sr1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.fld1 = new("fld1");
    this.fld1.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld1.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "fld1"}, 0, 32);
  endfunction: build
  
endclass : reg_top_sr1

// Register wr1
class reg_top_wr1 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl fld1;
  rand uvm_reg_field_rdl fld2;
  rand uvm_reg_field_rdl fld3;
  rand uvm_reg_field_rdl fld4;
  rand uvm_reg_field_rdl fld5;
  rand uvm_reg_field_rdl fld6;
  rand uvm_reg_field_rdl fld7;
  rand uvm_reg_field_rdl fld8;
  
  function new(string name = "reg_top_wr1");
    super.new(name, 128, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.fld1 = new("fld1");
    this.fld1.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld1.configure(this, 16, 0, "RW", 0, 16'h0, 1, 1, 0);
    this.fld2 = new("fld2");
    this.fld2.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld2.configure(this, 16, 16, "RW", 0, 16'h0, 1, 1, 0);
    this.fld3 = new("fld3");
    this.fld3.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld3.configure(this, 16, 32, "RW", 0, 16'h0, 1, 1, 0);
    this.fld4 = new("fld4");
    this.fld4.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld4.configure(this, 16, 48, "RW", 0, 16'h0, 1, 1, 0);
    this.fld5 = new("fld5");
    this.fld5.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld5.configure(this, 16, 64, "RW", 0, 16'h0, 1, 1, 0);
    this.fld6 = new("fld6");
    this.fld6.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld6.configure(this, 16, 80, "RW", 0, 16'h0, 1, 1, 0);
    this.fld7 = new("fld7");
    this.fld7.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld7.configure(this, 16, 96, "RW", 0, 16'h0, 1, 1, 0);
    this.fld8 = new("fld8");
    this.fld8.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld8.configure(this, 16, 112, "RW", 0, 16'h0, 1, 1, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "fld1"}, 0, 16);
    add_hdl_path_slice({rdl_reg_name, "fld2"}, 16, 16);
    add_hdl_path_slice({rdl_reg_name, "fld3"}, 32, 16);
    add_hdl_path_slice({rdl_reg_name, "fld4"}, 48, 16);
    add_hdl_path_slice({rdl_reg_name, "fld5"}, 64, 16);
    add_hdl_path_slice({rdl_reg_name, "fld6"}, 80, 16);
    add_hdl_path_slice({rdl_reg_name, "fld7"}, 96, 16);
    add_hdl_path_slice({rdl_reg_name, "fld8"}, 112, 16);
  endfunction: build
  
endclass : reg_top_wr1

// Register sr_repeat1
class reg_top_sr_repeat1 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl fld1;
  
  function new(string name = "reg_top_sr_repeat1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.fld1 = new("fld1");
    this.fld1.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld1.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "fld1"}, 0, 32);
  endfunction: build
  
endclass : reg_top_sr_repeat1

// Register sr_repeat2
class reg_top_sr_repeat2 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl fld1;
  
  function new(string name = "reg_top_sr_repeat2");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.fld1 = new("fld1");
    this.fld1.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld1.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "fld1"}, 0, 32);
  endfunction: build
  
endclass : reg_top_sr_repeat2

// Register sr_repeat3
class reg_top_sr_repeat3 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl fld1;
  
  function new(string name = "reg_top_sr_repeat3");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.fld1 = new("fld1");
    this.fld1.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.fld1.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "fld1"}, 0, 32);
  endfunction: build
  
endclass : reg_top_sr_repeat3

// Virtual Register srmem1
class vreg_top_srmem1 extends uvm_vreg_rdl;
  rand uvm_vreg_field fld1;
  
  function new(string name = "vreg_top_srmem1");
    super.new(name, 32);
  endfunction: new
  
  virtual function void build();
    this.fld1 = new("fld1");
    this.fld1.configure(this, 32, 0);
  endfunction: build
  
endclass : vreg_top_srmem1

// Uvm_mem wrapper block srmem1
class block_mem_wrap_top_srmem1 extends uvm_reg_block_rdl;
  rand uvm_mem mem;
  rand vreg_top_srmem1 vregs;
  
  function new(string name = "block_mem_wrap_top_srmem1");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 1);
    this.mem = new("mem", 100, 32);
    this.mem.configure(this);
    this.vregs = new;
    this.vregs.configure(this, mem, 100);
    this.vregs.set_reset_value(32'h0);
    this.vregs.set_reg_test_info(0, 0, 0);
    this.vregs.build();
    this.default_map.add_mem(this.mem, `UVM_REG_ADDR_WIDTH'h0);
  endfunction: build
  
  `uvm_object_utils(block_mem_wrap_top_srmem1)
endclass : block_mem_wrap_top_srmem1

// Virtual Register wrmem1
class vreg_top_wrmem1 extends uvm_vreg_rdl;
  rand uvm_vreg_field fld1;
  rand uvm_vreg_field fld2;
  rand uvm_vreg_field fld3;
  rand uvm_vreg_field fld4;
  rand uvm_vreg_field fld5;
  rand uvm_vreg_field fld6;
  rand uvm_vreg_field fld7;
  rand uvm_vreg_field fld8;
  
  function new(string name = "vreg_top_wrmem1");
    super.new(name, 128);
  endfunction: new
  
  virtual function void build();
    this.fld1 = new("fld1");
    this.fld1.configure(this, 16, 0);
    this.fld2 = new("fld2");
    this.fld2.configure(this, 16, 16);
    this.fld3 = new("fld3");
    this.fld3.configure(this, 16, 32);
    this.fld4 = new("fld4");
    this.fld4.configure(this, 16, 48);
    this.fld5 = new("fld5");
    this.fld5.configure(this, 16, 64);
    this.fld6 = new("fld6");
    this.fld6.configure(this, 16, 80);
    this.fld7 = new("fld7");
    this.fld7.configure(this, 16, 96);
    this.fld8 = new("fld8");
    this.fld8.configure(this, 16, 112);
  endfunction: build
  
endclass : vreg_top_wrmem1

// Uvm_mem wrapper block wrmem1
class block_mem_wrap_top_wrmem1 extends uvm_reg_block_rdl;
  rand uvm_mem mem;
  rand vreg_top_wrmem1 vregs;
  
  function new(string name = "block_mem_wrap_top_wrmem1");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 16, UVM_LITTLE_ENDIAN, 1);
    this.mem = new("mem", 300, 128);
    this.mem.configure(this);
    this.vregs = new;
    this.vregs.configure(this, mem, 300);
    this.vregs.set_reset_value(128'h0);
    this.vregs.set_reg_test_info(0, 0, 0);
    this.vregs.build();
    this.default_map.add_mem(this.mem, `UVM_REG_ADDR_WIDTH'h0);
  endfunction: build
  
  `uvm_object_utils(block_mem_wrap_top_wrmem1)
endclass : block_mem_wrap_top_wrmem1

// Base block
class block_top extends uvm_reg_block_rdl;
  rand reg_top_sr1 sr1;
  rand reg_top_wr1 wr1;
  rand reg_top_sr_repeat1 sr_repeat1;
  rand reg_top_sr_repeat2 sr_repeat2;
  rand reg_top_sr_repeat3 sr_repeat3;
  rand block_mem_wrap_top_srmem1 srmem1;
  rand block_mem_wrap_top_wrmem1 wrmem1;
  
  function new(string name = "block_top");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", `UVM_REG_ADDR_WIDTH'h0, 16, UVM_LITTLE_ENDIAN, 1);
    this.set_rdl_address_map(1);
    this.set_rdl_address_map_hdl_path({`TOP_PIO_INSTANCE_PATH, ".pio_logic"});
    this.sr1 = new("sr1");
    this.sr1.configure(this, null, "");
    this.sr1.set_rdl_tag("sr1_");
    this.sr1.set_reg_test_info(0, 0, 0);
    this.sr1.build();
    this.default_map.add_reg(this.sr1, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
    this.wr1 = new("wr1");
    this.wr1.configure(this, null, "");
    this.wr1.set_rdl_tag("wr1_");
    this.wr1.set_reg_test_info(0, 0, 0);
    this.wr1.build();
    this.default_map.add_reg(this.wr1, `UVM_REG_ADDR_WIDTH'h100, "RW", 0);
    this.sr_repeat1 = new("sr_repeat1");
    this.sr_repeat1.configure(this, null, "");
    this.sr_repeat1.set_rdl_tag("sr_repeat1_");
    this.sr_repeat1.set_reg_test_info(0, 0, 0);
    this.sr_repeat1.build();
    this.default_map.add_reg(this.sr_repeat1, `UVM_REG_ADDR_WIDTH'h200, "RW", 0);
    this.sr_repeat2 = new("sr_repeat2");
    this.sr_repeat2.configure(this, null, "");
    this.sr_repeat2.set_rdl_tag("sr_repeat2_");
    this.sr_repeat2.set_reg_test_info(0, 0, 0);
    this.sr_repeat2.build();
    this.default_map.add_reg(this.sr_repeat2, `UVM_REG_ADDR_WIDTH'h204, "RW", 0);
    this.sr_repeat3 = new("sr_repeat3");
    this.sr_repeat3.configure(this, null, "");
    this.sr_repeat3.set_rdl_tag("sr_repeat3_");
    this.sr_repeat3.set_reg_test_info(0, 0, 0);
    this.sr_repeat3.build();
    this.default_map.add_reg(this.sr_repeat3, `UVM_REG_ADDR_WIDTH'h208, "RW", 0);
    this.srmem1 = block_mem_wrap_top_srmem1::type_id::create("srmem1",, get_full_name());
    this.srmem1.configure(this, "");
    this.srmem1.set_rdl_tag("srmem1_");
    this.srmem1.build();
    this.default_map.add_submap(this.srmem1.default_map, `UVM_REG_ADDR_WIDTH'h2000);
    this.wrmem1 = block_mem_wrap_top_wrmem1::type_id::create("wrmem1",, get_full_name());
    this.wrmem1.configure(this, "");
    this.wrmem1.set_rdl_tag("wrmem1_");
    this.wrmem1.build();
    this.default_map.add_submap(this.wrmem1.default_map, `UVM_REG_ADDR_WIDTH'h20000);
    this.add_callbacks();
  endfunction: build
  
  `uvm_object_utils(block_top)
endclass : block_top