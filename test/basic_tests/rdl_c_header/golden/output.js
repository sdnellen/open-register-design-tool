/*   Ordt 230719.01 autogenerated file 
 *   Input: ./rdl_c_header/test.rdl
 *   Parms: ./rdl_c_header/test.parms
 *   Date: Thu Jul 20 12:53:13 EDT 2023
 */

register_set example_addr_map "Registers for example_addr_map" {

  address = 0x0;
  register_width = 32;
  register r0 "DEVICE_ID" {
    address = 0x0;
    category = { DYNAMIC_CONFIG };
    description = "{
      Register with Device identifier.
    }";
    integer f2[16] "FLD_C" param {
      description = "{
        Description of example field
      }";
      access_mode = READ_WRITE;
      reset = 0xa0b;
    };
    integer f1[8] "FLD_B" param {
      description = "{
        Description of FLD_B
      }";
      access_mode = READ_WRITE;
      reset = 0x4;
    };
    integer f0[8] "FLD_A" param {
      description = "{
        Description of FLD_A
      }";
      access_mode = READ_WRITE;
      reset = 0x2;
    };
  };
  
  register r1 "SPI_CONFIG" {
    address = 0x4;
    category = { DYNAMIC_CONFIG };
    description = "{
      Register with revision number
    }";
    nop[24];
    integer f1[4] "REV_MAJOR" param {
      description = "{
        Major revision number
      }";
      access_mode = READ_WRITE;
      reset = 0x0;
    };
    integer f0[4] "REV_MINOR" param {
      description = "{
        Minor revision number
      }";
      access_mode = READ_WRITE;
      reset = 0x1;
    };
  };
  
  register r2 "SPI_STATUS" {
    address = 0x8;
    category = { DYNAMIC_CONFIG };
    description = "{
      Register with revision number
    }";
    nop[24];
    integer f3[4] "TRANSFER" param {
      description = "{
        transferring
      }";
      access_mode = READ_WRITE;
      reset = 0x0;
    };
    integer f0[2] "MASTER" param {
      description = "{
        master enable
      }";
      access_mode = READ_WRITE;
      reset = 0x1;
    };
    integer f2[2] "MASTER1" param {
      description = "{
        master enable
      }";
      access_mode = READ_WRITE;
      reset = 0x1;
    };
  };
  
  register_set_size = 0xc;
};

