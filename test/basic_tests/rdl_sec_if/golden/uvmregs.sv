//   Ordt 170504.01 autogenerated file 
//   Input: ./rdl_sec_if/test.rdl
//   Parms: ./rdl_sec_if/test.parms
//   Date: Thu May 04 15:51:12 EDT 2017
//

import uvm_pkg::*;
import ordt_uvm_reg_pkg::*;

// Config reg set  config_regs
class reg_base_map_base_regs_config_regs extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl lsb_field;
  rand uvm_reg_field_rdl msb_field;
  
  function new(string name = "reg_base_map_base_regs_config_regs");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.lsb_field = new("lsb_field");
    this.lsb_field.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.lsb_field.configure(this, 16, 0, "RW", 0, 16'hffff, 1, 1, 0);
    this.msb_field = new("msb_field");
    this.msb_field.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.msb_field.configure(this, 16, 16, "RW", 0, 16'h0, 1, 1, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "lsb_field"}, 0, 16);
    add_hdl_path_slice({rdl_reg_name, "msb_field"}, 16, 16);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_base_map_base_regs_config_regs

// Block base_regs
class block_base_map_base_regs extends uvm_reg_block_rdl;
  rand reg_base_map_base_regs_config_regs config_regs[8];
  
  function new(string name = "block_base_map_base_regs");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 1);
    foreach (this.config_regs[i]) begin
      this.config_regs[i] = new($psprintf("config_regs [%0d]",i));
      this.config_regs[i].configure(this, null, "");
      this.config_regs[i].set_rdl_tag($psprintf("config_regs_%0d_",i));
      this.config_regs[i].set_reg_test_info(0, 0, 2);
      this.config_regs[i].build();
      this.default_map.add_reg(this.config_regs[i], `UVM_REG_ADDR_WIDTH'h0+i*`UVM_REG_ADDR_WIDTH'h4, "RW", 0);
    end
  endfunction: build
  
  `uvm_object_utils(block_base_map_base_regs)
endclass : block_base_map_base_regs

// Config reg set  config_regs
class reg_base_map_primary_base_regs_config_regs extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl lsb_field;
  rand uvm_reg_field_rdl msb_field;
  
  function new(string name = "reg_base_map_primary_base_regs_config_regs");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.lsb_field = new("lsb_field");
    this.lsb_field.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.lsb_field.configure(this, 16, 0, "RW", 0, 16'hffff, 1, 1, 0);
    this.msb_field = new("msb_field");
    this.msb_field.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.msb_field.configure(this, 16, 16, "RW", 0, 16'h0, 1, 1, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "lsb_field"}, 0, 16);
    add_hdl_path_slice({rdl_reg_name, "msb_field"}, 16, 16);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_base_map_primary_base_regs_config_regs

// Block base_regs
class block_base_map_primary_base_regs extends uvm_reg_block_rdl;
  rand reg_base_map_primary_base_regs_config_regs config_regs[8];
  
  function new(string name = "block_base_map_primary_base_regs");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 1);
    foreach (this.config_regs[i]) begin
      this.config_regs[i] = new($psprintf("config_regs [%0d]",i));
      this.config_regs[i].configure(this, null, "");
      this.config_regs[i].set_rdl_tag($psprintf("config_regs_%0d_",i));
      this.config_regs[i].set_reg_test_info(0, 0, 2);
      this.config_regs[i].build();
      this.default_map.add_reg(this.config_regs[i], `UVM_REG_ADDR_WIDTH'h0+i*`UVM_REG_ADDR_WIDTH'h4, "RW", 0);
    end
  endfunction: build
  
  `uvm_object_utils(block_base_map_primary_base_regs)
endclass : block_base_map_primary_base_regs

// L2 regs
class block_base_map_primary extends uvm_reg_block_rdl;
  rand block_base_map_primary_base_regs base_regs;
  
  function new(string name = "block_base_map_primary");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 1);
    this.base_regs = block_base_map_primary_base_regs::type_id::create("base_regs",, get_full_name());
    this.base_regs.configure(this, "");
    this.base_regs.set_rdl_tag("base_regs_");
    this.base_regs.build();
    this.default_map.add_submap(this.base_regs.default_map, `UVM_REG_ADDR_WIDTH'h0);
    set_hdl_path_root({`BASE_MAP_PRIMARY_PIO_INSTANCE_PATH, ".pio_logic"});
  endfunction: build
  
  `uvm_object_utils(block_base_map_primary)
endclass : block_base_map_primary

// Base block
class block_base_map extends uvm_reg_block_rdl;
  rand block_base_map_base_regs base_regs;
  rand block_base_map_primary primary;
  
  function new(string name = "block_base_map");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", `UVM_REG_ADDR_WIDTH'h0, 4, UVM_LITTLE_ENDIAN, 1);
    this.set_rdl_address_map(1);
    this.set_rdl_address_map_hdl_path({`BASE_MAP_PIO_INSTANCE_PATH, ".pio_logic"});
    this.base_regs = block_base_map_base_regs::type_id::create("base_regs",, get_full_name());
    this.base_regs.configure(this, "");
    this.base_regs.set_rdl_tag("base_regs_");
    this.base_regs.build();
    this.default_map.add_submap(this.base_regs.default_map, `UVM_REG_ADDR_WIDTH'h0);
    this.primary = block_base_map_primary::type_id::create("primary",, get_full_name());
    this.primary.configure(this, "");
    this.primary.set_rdl_address_map(1);
    this.primary.set_rdl_address_map_hdl_path({`BASE_MAP_PRIMARY_PIO_INSTANCE_PATH, ".pio_logic"});
    this.primary.build();
    this.default_map.add_submap(this.primary.default_map, `UVM_REG_ADDR_WIDTH'h20);
    set_hdl_path_root({`BASE_MAP_PIO_INSTANCE_PATH, ".pio_logic"});
    this.add_callbacks();
  endfunction: build
  
  `uvm_object_utils(block_base_map)
endclass : block_base_map
