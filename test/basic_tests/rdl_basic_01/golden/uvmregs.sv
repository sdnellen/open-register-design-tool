//   Ordt 170504.01 autogenerated file 
//   Input: ./rdl_basic_01/test.rdl
//   Parms: ./rdl_basic_01/test.parms
//   Date: Thu May 04 15:51:08 EDT 2017
//

import uvm_pkg::*;
import ordt_uvm_reg_pkg::*;

// Register disable_check
class reg_simple1_stats_disable_check extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl timer_sram;
  rand uvm_reg_field_rdl cbuf_fifo;
  rand uvm_reg_field_rdl lut_st;
  rand uvm_reg_field_rdl_interrupt l0_b0;
  rand uvm_reg_field_rdl_interrupt l0_b1;
  rand uvm_reg_field_rdl_interrupt l0_b2;
  rand uvm_reg_field_rdl l0_b3;
  
  function new(string name = "reg_simple1_stats_disable_check");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.timer_sram = new("timer_sram");
    this.timer_sram.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.timer_sram.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
    this.cbuf_fifo = new("cbuf_fifo");
    this.cbuf_fifo.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.cbuf_fifo.configure(this, 1, 1, "RW", 0, 1'h0, 1, 1, 0);
    this.lut_st = new("lut_st");
    this.lut_st.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.lut_st.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
    this.l0_b0 = new("l0_b0");
    this.l0_b0.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.l0_b0.add_intr(0, 0, "", 0);
    this.l0_b0.configure(this, 1, 3, "RW", 1, 1'h0, 1, 1, 0);
    this.l0_b1 = new("l0_b1");
    this.l0_b1.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.l0_b1.add_intr(0, 0, "", 0);
    this.l0_b1.configure(this, 1, 4, "RW", 1, 1'h0, 1, 1, 0);
    this.l0_b2 = new("l0_b2");
    this.l0_b2.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.l0_b2.add_intr(0, 0, "", 0);
    this.l0_b2.add_halt();
    this.l0_b2.configure(this, 1, 5, "RW", 1, 1'h0, 1, 1, 0);
    this.l0_b3 = new("l0_b3");
    this.l0_b3.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.l0_b3.configure(this, 1, 6, "RW", 0, 1'h0, 1, 1, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "timer_sram"}, 0, 1);
    add_hdl_path_slice({rdl_reg_name, "cbuf_fifo"}, 1, 1);
    add_hdl_path_slice({rdl_reg_name, "lut_st"}, 2, 1);
    add_hdl_path_slice({rdl_reg_name, "l0_b0"}, 3, 1);
    add_hdl_path_slice({rdl_reg_name, "l0_b1"}, 4, 1);
    add_hdl_path_slice({rdl_reg_name, "l0_b2"}, 5, 1);
    add_hdl_path_slice({rdl_reg_name, "l0_b3"}, 6, 1);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
  virtual function void get_intr_fields(ref uvm_reg_field fields[$]); // return all source interrupt fields
    uvm_reg_field f[$];
    uvm_reg_field_rdl rdl_f;
    uvm_reg_field_rdl_interrupt rdl_intr_f;
    get_fields(f);
    foreach(f[i]) begin
      $cast(rdl_f, f[i]);
      if (rdl_f.is_interrupt()) begin
        $cast(rdl_intr_f, rdl_f);
        rdl_intr_f.get_intr_fields(fields);
      end
    end
  endfunction: get_intr_fields
  
  virtual task get_active_intr_fields(ref uvm_reg_field fields[$], input bit is_halt, input uvm_path_e path = UVM_DEFAULT_PATH); // return all active source intr/halt fields
    uvm_reg_field f[$];
    uvm_reg_field_rdl rdl_f;
    uvm_reg_field_rdl_interrupt rdl_intr_f;
    uvm_status_e status;
    uvm_reg_data_t value;
    read(status, value, path);
    get_fields(f);
    foreach(f[i]) begin
      $cast(rdl_f, f[i]);
      if (rdl_f.is_interrupt() && rdl_f.get()) begin
        $cast(rdl_intr_f, rdl_f);
        rdl_intr_f.get_active_intr_fields(fields, is_halt, path);
      end
    end
  endtask: get_active_intr_fields
  
endclass : reg_simple1_stats_disable_check

// Register features
class reg_simple1_stats_features extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl adr_logged;
  rand uvm_reg_field_rdl generator;
  rand uvm_reg_field_rdl correctable;
  rand uvm_reg_field_rdl version;
  rand uvm_reg_field_rdl wdth;
  rand uvm_reg_field_rdl syn_logged;
  rand uvm_reg_field_rdl \checker ;
  
  function new(string name = "reg_simple1_stats_features");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.adr_logged = new("adr_logged");
    this.adr_logged.set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.adr_logged.configure(this, 1, 0, "RO", 0, 1'h1, 1, 0, 0);
    this.generator = new("generator");
    this.generator.set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.generator.configure(this, 1, 3, "RO", 0, 1'h1, 1, 0, 0);
    this.correctable = new("correctable");
    this.correctable.set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.correctable.configure(this, 1, 1, "RO", 0, 1'h0, 1, 0, 0);
    this.version = new("version");
    this.version.set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.version.configure(this, 2, 30, "RO", 0, 2'h2, 1, 0, 0);
    this.wdth = new("wdth");
    this.wdth.set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.wdth.configure(this, 5, 4, "RO", 0, 5'h7, 1, 0, 0);
    this.syn_logged = new("syn_logged");
    this.syn_logged.set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.syn_logged.configure(this, 1, 9, "RO", 0, 1'h0, 1, 0, 0);
    this.\checker  = new("checker");
    this.\checker .set_rdl_access_info(1, 0, 0, 0, 0, 0);
    this.\checker .configure(this, 1, 2, "RO", 0, 1'h1, 1, 0, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "adr_logged"}, 0, 1);
    add_hdl_path_slice({rdl_reg_name, "generator"}, 3, 1);
    add_hdl_path_slice({rdl_reg_name, "correctable"}, 1, 1);
    add_hdl_path_slice({rdl_reg_name, "version"}, 30, 2);
    add_hdl_path_slice({rdl_reg_name, "wdth"}, 4, 5);
    add_hdl_path_slice({rdl_reg_name, "syn_logged"}, 9, 1);
    add_hdl_path_slice({rdl_reg_name, "checker"}, 2, 1);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_stats_features

// Register log_address1
class reg_simple1_stats_log_address1 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl value;
  
  function new(string name = "reg_simple1_stats_log_address1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.value = new("value");
    this.value.set_rdl_access_info(1, 1, 0, 1, 1, 0);
    this.value.configure(this, 10, 0, "RW", 1, 10'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "value"}, 0, 10);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_stats_log_address1

// Register log_address2
class reg_simple1_stats_log_address2 extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl value;
  
  function new(string name = "reg_simple1_stats_log_address2");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.value = new("value");
    this.value.set_rdl_access_info(1, 1, 0, 1, 1, 0);
    this.value.configure(this, 10, 0, "RW", 1, 10'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "value"}, 0, 10);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_stats_log_address2

// Register wide_reg
class reg_simple1_stats_wide_reg extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl value;
  
  function new(string name = "reg_simple1_stats_wide_reg");
    super.new(name, 128, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.value = new("value");
    this.value.set_rdl_access_info(1, 1, 1, 1, 1, 0);
    this.value.configure(this, 96, 0, "RW", 1, 96'ha5a5a5a5a5a5a5a5a5a5a5a5, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "value"}, 0, 96);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_stats_wide_reg

// Block stats
class block_simple1_stats extends uvm_reg_block_rdl;
  rand reg_simple1_stats_disable_check disable_check[2];
  rand reg_simple1_stats_features features;
  rand reg_simple1_stats_log_address1 log_address1;
  rand reg_simple1_stats_log_address2 log_address2;
  rand reg_simple1_stats_wide_reg wide_reg;
  
  function new(string name = "block_simple1_stats");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 16, UVM_LITTLE_ENDIAN, 1);
    foreach (this.disable_check[i]) begin
      this.disable_check[i] = new($psprintf("disable_check [%0d]",i));
      this.disable_check[i].configure(this, null, "");
      this.disable_check[i].set_rdl_tag($psprintf("disable_check_%0d_",i));
      this.disable_check[i].set_reg_test_info(0, 0, 0);
      this.disable_check[i].build();
      this.default_map.add_reg(this.disable_check[i], `UVM_REG_ADDR_WIDTH'h0+i*`UVM_REG_ADDR_WIDTH'h80, "RW", 0);
    end
    this.features = new("features");
    this.features.configure(this, null, "");
    this.features.set_rdl_tag("features_");
    this.features.set_reg_test_info(0, 0, 0);
    this.features.build();
    this.default_map.add_reg(this.features, `UVM_REG_ADDR_WIDTH'h100, "RO", 0);
    this.log_address1 = new("log_address1");
    this.log_address1.configure(this, null, "");
    this.log_address1.set_rdl_tag("log_address1_");
    this.log_address1.set_reg_test_info(0, 0, 32);
    this.log_address1.build();
    this.default_map.add_reg(this.log_address1, `UVM_REG_ADDR_WIDTH'h104, "RW", 0);
    this.log_address2 = new("log_address2");
    this.log_address2.configure(this, null, "");
    this.log_address2.set_rdl_tag("log_address2_");
    this.log_address2.set_reg_test_info(0, 0, 32);
    this.log_address2.build();
    this.default_map.add_reg(this.log_address2, `UVM_REG_ADDR_WIDTH'h110, "RW", 0);
    this.wide_reg = new("wide_reg");
    this.wide_reg.configure(this, null, "");
    this.wide_reg.set_rdl_tag("wide_reg_");
    this.wide_reg.set_reg_test_info(0, 0, 0);
    this.wide_reg.build();
    this.default_map.add_reg(this.wide_reg, `UVM_REG_ADDR_WIDTH'h120, "RW", 0);
  endfunction: build
  
  `uvm_object_utils(block_simple1_stats)
endclass : block_simple1_stats

// Register reorder_window
class reg_simple1_rdr_reorder_window extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl size;
  rand uvm_reg_field_rdl ws_enable;
  rand uvm_reg_field_rdl set_back;
  
  function new(string name = "reg_simple1_rdr_reorder_window");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.size = new("size");
    this.size.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.size.configure(this, 11, 0, "RW", 0, 11'h80, 1, 1, 0);
    this.ws_enable = new("ws_enable");
    this.ws_enable.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.ws_enable.configure(this, 1, 31, "RW", 0, 1'h1, 1, 1, 0);
    this.set_back = new("set_back");
    this.set_back.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.set_back.configure(this, 11, 16, "RW", 0, 11'h10, 1, 1, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "size"}, 0, 11);
    add_hdl_path_slice({rdl_reg_name, "ws_enable"}, 31, 1);
    add_hdl_path_slice({rdl_reg_name, "set_back"}, 16, 11);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_rdr_reorder_window

// Register stream_reconf
class reg_simple1_rdr_stream_reconf extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl stream;
  rand uvm_reg_field_rdl busy;
  
  function new(string name = "reg_simple1_rdr_stream_reconf");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.stream = new("stream");
    this.stream.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.stream.configure(this, 10, 0, "RW", 0, 10'h0, 1, 1, 0);
    this.busy = new("busy");
    this.busy.set_rdl_access_info(1, 0, 0, 1, 0, 0);
    this.busy.configure(this, 1, 16, "RO", 1, 1'h0, 1, 0, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "stream"}, 0, 10);
    add_hdl_path_slice({rdl_reg_name, "busy"}, 16, 1);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_rdr_stream_reconf

// Register buffer
class reg_simple1_rdr_cp_fp_wr_buffer extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl addr1;
  rand uvm_reg_field_rdl addr0;
  
  function new(string name = "reg_simple1_rdr_cp_fp_wr_buffer");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.addr1 = new("addr1");
    this.addr1.set_rdl_access_info(1, 0, 0, 1, 0, 0);
    this.addr1.configure(this, 11, 0, "RO", 1, 0, 0, 0, 0);
    this.addr0 = new("addr0");
    this.addr0.set_rdl_access_info(1, 0, 0, 1, 0, 0);
    this.addr0.configure(this, 11, 16, "RO", 1, 0, 0, 0, 0);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_rdr_cp_fp_wr_buffer

// Block cp_fp_wr
class block_simple1_rdr_cp_fp_wr extends uvm_reg_block_rdl;
  rand reg_simple1_rdr_cp_fp_wr_buffer buffer[4];
  
  function new(string name = "block_simple1_rdr_cp_fp_wr");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 16, UVM_LITTLE_ENDIAN, 1);
    foreach (this.buffer[i]) begin
      this.buffer[i] = new($psprintf("buffer [%0d]",i));
      this.buffer[i].configure(this, null, "");
      this.buffer[i].set_rdl_tag($psprintf("buffer_%0d_",i));
      this.buffer[i].set_external(1);
      this.buffer[i].set_reg_test_info(0, 0, 32);
      this.buffer[i].build();
      this.default_map.add_reg(this.buffer[i], `UVM_REG_ADDR_WIDTH'h0+i*`UVM_REG_ADDR_WIDTH'h4, "RO", 0);
    end
  endfunction: build
  
  `uvm_object_utils(block_simple1_rdr_cp_fp_wr)
endclass : block_simple1_rdr_cp_fp_wr

// Register roll32_counter_reg
class reg_simple1_rdr_roll32_counter_reg extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl_counter count;
  
  function new(string name = "reg_simple1_rdr_roll32_counter_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.count = new("count");
    this.count.set_rdl_access_info(1, 1, 1, 1, 1, 0);
    this.count.add_incr(1, "", "", 0);
    this.count.configure(this, 4, 0, "RW", 1, 4'h0, 1, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "count"}, 0, 4);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_rdr_roll32_counter_reg

// Register sat32_counter_reg
class reg_simple1_rdr_sat32_counter_reg extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl_counter count;
  
  function new(string name = "reg_simple1_rdr_sat32_counter_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.count = new("count");
    this.count.set_rdl_access_info(1, 1, 1, 1, 1, 0);
    this.count.add_incr(1, "", "", 0);
    this.count.add_incr_sat(4'd15, "");
    this.count.add_incr_thold(4'd8, "");
    this.count.configure(this, 4, 0, "WRC", 1, 4'h0, 1, 1, 1);
    this.count.set_dontcompare();
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "count"}, 0, 4);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_rdr_sat32_counter_reg

// Register rcnt_sat_log
class reg_simple1_rdr_rcnt_sat_log extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl_counter count;
  rand uvm_reg_field_rdl str;
  rand uvm_reg_field_rdl subch;
  rand uvm_reg_field_rdl en;
  
  function new(string name = "reg_simple1_rdr_rcnt_sat_log");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.count = new("count");
    this.count.set_rdl_access_info(1, 1, 1, 1, 1, 0);
    this.count.add_incr(1, "roll32_counter_reg_count_overflow_o", "", 0);
    this.count.add_incr_sat(16'd65535, "");
    this.count.configure(this, 16, 0, "WRC", 1, 16'h0, 1, 1, 0);
    this.str = new("str");
    this.str.set_rdl_access_info(1, 1, 0, 1, 1, 0);
    this.str.configure(this, 10, 16, "WRC", 1, 10'h0, 1, 1, 0);
    this.str.set_js_subcategory(1);
    this.subch = new("subch");
    this.subch.set_rdl_access_info(1, 1, 0, 1, 1, 0);
    this.subch.configure(this, 5, 26, "WRC", 1, 5'h0, 1, 1, 0);
    this.en = new("en");
    this.en.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.en.configure(this, 1, 31, "RW", 0, 1'h1, 1, 1, 0);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "count"}, 0, 16);
    add_hdl_path_slice({rdl_reg_name, "str"}, 16, 10);
    add_hdl_path_slice({rdl_reg_name, "subch"}, 26, 5);
    add_hdl_path_slice({rdl_reg_name, "en"}, 31, 1);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_rdr_rcnt_sat_log

// Block rdr
class block_simple1_rdr extends uvm_reg_block_rdl;
  rand reg_simple1_rdr_reorder_window reorder_window;
  rand reg_simple1_rdr_stream_reconf stream_reconf;
  rand block_simple1_rdr_cp_fp_wr cp_fp_wr;
  rand reg_simple1_rdr_roll32_counter_reg roll32_counter_reg;
  rand reg_simple1_rdr_sat32_counter_reg sat32_counter_reg;
  rand reg_simple1_rdr_rcnt_sat_log rcnt_sat_log;
  
  function new(string name = "block_simple1_rdr");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", 0, 16, UVM_LITTLE_ENDIAN, 1);
    this.reorder_window = new("reorder_window");
    this.reorder_window.configure(this, null, "");
    this.reorder_window.set_rdl_tag("reorder_window_");
    this.reorder_window.set_reg_test_info(0, 0, 32);
    this.reorder_window.build();
    this.default_map.add_reg(this.reorder_window, `UVM_REG_ADDR_WIDTH'h0, "RW", 0);
    this.stream_reconf = new("stream_reconf");
    this.stream_reconf.configure(this, null, "");
    this.stream_reconf.set_rdl_tag("stream_reconf_");
    this.stream_reconf.set_reg_test_info(0, 0, 0);
    this.stream_reconf.build();
    this.default_map.add_reg(this.stream_reconf, `UVM_REG_ADDR_WIDTH'h4, "RW", 0);
    this.cp_fp_wr = block_simple1_rdr_cp_fp_wr::type_id::create("cp_fp_wr",, get_full_name());
    this.cp_fp_wr.configure(this, "");
    this.cp_fp_wr.set_rdl_tag("cp_fp_wr_");
    this.cp_fp_wr.build();
    this.default_map.add_submap(this.cp_fp_wr.default_map, `UVM_REG_ADDR_WIDTH'h21c0);
    this.roll32_counter_reg = new("roll32_counter_reg");
    this.roll32_counter_reg.configure(this, null, "");
    this.roll32_counter_reg.set_rdl_tag("roll32_counter_reg_");
    this.roll32_counter_reg.set_reg_test_info(0, 0, 0);
    this.roll32_counter_reg.build();
    this.default_map.add_reg(this.roll32_counter_reg, `UVM_REG_ADDR_WIDTH'h21d0, "RW", 0);
    this.sat32_counter_reg = new("sat32_counter_reg");
    this.sat32_counter_reg.configure(this, null, "");
    this.sat32_counter_reg.set_rdl_tag("sat32_counter_reg_");
    this.sat32_counter_reg.set_reg_test_info(0, 1, 0);
    this.sat32_counter_reg.build();
    this.default_map.add_reg(this.sat32_counter_reg, `UVM_REG_ADDR_WIDTH'h21d4, "RW", 0);
    this.rcnt_sat_log = new("rcnt_sat_log");
    this.rcnt_sat_log.configure(this, null, "");
    this.rcnt_sat_log.set_rdl_tag("rcnt_sat_log_");
    this.rcnt_sat_log.set_reg_test_info(0, 0, 0);
    this.rcnt_sat_log.build();
    this.default_map.add_reg(this.rcnt_sat_log, `UVM_REG_ADDR_WIDTH'h21d8, "RW", 0);
  endfunction: build
  
  `uvm_object_utils(block_simple1_rdr)
endclass : block_simple1_rdr

// extra_reg name
class reg_simple1_extra_reg extends uvm_reg_rdl;
  string m_rdl_tag;
  rand uvm_reg_field_rdl value;
  
  function new(string name = "reg_simple1_extra_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction: new
  
  virtual function void build();
    string rdl_reg_name;
    this.value = new("value");
    this.value.set_rdl_access_info(1, 1, 1, 0, 0, 0);
    this.value.configure(this, 32, 0, "RW", 0, 0, 0, 1, 1);
    
    rdl_reg_name = get_rdl_name("rg_");
    add_hdl_path_slice({rdl_reg_name, "value"}, 0, 32);
  endfunction: build
  
  virtual function void add_callbacks();
  endfunction: add_callbacks
  
endclass : reg_simple1_extra_reg

// Base block
class block_simple1 extends uvm_reg_block_rdl;
  rand block_simple1_stats stats;
  rand block_simple1_rdr rdr;
  rand reg_simple1_extra_reg extra_reg;
  
  function new(string name = "block_simple1");
    super.new(name);
  endfunction: new
  
  virtual function void build();
    this.default_map = create_map("", `UVM_REG_ADDR_WIDTH'h0, 16, UVM_LITTLE_ENDIAN, 1);
    this.set_rdl_address_map(1);
    this.set_rdl_address_map_hdl_path({`SIMPLE1_PIO_INSTANCE_PATH, ".pio_logic"});
    this.stats = block_simple1_stats::type_id::create("stats",, get_full_name());
    this.stats.configure(this, "");
    this.stats.set_rdl_tag("stats_");
    this.stats.build();
    this.default_map.add_submap(this.stats.default_map, `UVM_REG_ADDR_WIDTH'h1000);
    this.rdr = block_simple1_rdr::type_id::create("rdr",, get_full_name());
    this.rdr.configure(this, "");
    this.rdr.set_rdl_tag("rdr_");
    this.rdr.build();
    this.default_map.add_submap(this.rdr.default_map, `UVM_REG_ADDR_WIDTH'h4000);
    this.extra_reg = new("extra_reg");
    this.extra_reg.configure(this, null, "");
    this.extra_reg.set_rdl_tag("extra_reg_");
    this.extra_reg.set_reg_test_info(0, 0, 2);
    this.extra_reg.build();
    this.default_map.add_reg(this.extra_reg, `UVM_REG_ADDR_WIDTH'h61dc, "RW", 0);
    set_hdl_path_root({`SIMPLE1_PIO_INSTANCE_PATH, ".pio_logic"});
    this.add_callbacks();
  endfunction: build
  
  `uvm_object_utils(block_simple1)
endclass : block_simple1
