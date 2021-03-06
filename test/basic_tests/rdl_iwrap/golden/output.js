/*   Ordt 190725.01 autogenerated file 
 *   Input: ./rdl_iwrap/test.rdl
 *   Parms: ./rdl_iwrap/test.parms
 *   Date: Sun Nov 17 17:01:02 EST 2019
 */

register_set top "Registers for top" {

  address = 0x0;
  register_width = 32;
  register_set regs_none "regs_none register_set" {
    address = 0x0;
    
    register reg_none "reg_none register" {
      address = 0x0;
      nop[28];
      integer fld_int[1] "fld_int field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_ext[1] "fld_ext field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_gen[1] "fld_gen field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_none[1] "fld_none field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
    };
    
    register reg_int "reg_int register" {
      address = 0x4;
      nop[28];
      integer fld_int[1] "fld_int field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_ext[1] "fld_ext field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_gen[1] "fld_gen field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_none[1] "fld_none field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
    };
    
    register_set_size = 0x8;
  };
  
  register_set regs_ext "regs_ext register_set" {
    address = 0x8;
    
    register reg_none "reg_none register" {
      address = 0x0;
      nop[28];
      integer fld_int[1] "fld_int field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_ext[1] "fld_ext field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_gen[1] "fld_gen field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_none[1] "fld_none field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
    };
    
    register reg_int "reg_int register" {
      address = 0x4;
      nop[28];
      integer fld_int[1] "fld_int field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_ext[1] "fld_ext field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_gen[1] "fld_gen field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
      integer fld_none[1] "fld_none field" param {
        access_mode = READ_WRITE;
        reset = 0x0;
      };
    };
    
    register_set_size = 0x8;
  };
  
  register wrap_info_reg "wrap_info_reg register" {
    address = 0x200;
    nop[29];
    integer bar3[1] "bar3 field" param {
      access_mode = READ_WRITE;
      reset = 0x0;
    };
    integer bar2[1] "bar2 field" param {
      access_mode = READ_WRITE;
      reset = 0x0;
    };
    integer bar1[1] "bar1 field" param {
      access_mode = READ_WRITE;
      reset = 0x0;
    };
  };
  
  register_set_size = 0x204;
};

