//   Ordt 230719.01 autogenerated file 
//   Input: ./rdl_hwload/test.rdl
//   Parms: ./rdl_hwload/test.parms
//   Date: Thu Jul 20 13:46:47 EDT 2023
//

#ifndef __BASEMAP_REGISTER_MAP__
#define __BASEMAP_REGISTER_MAP__

#include <bits.h>

/* BASEMAP_REGISTERS memory map */
enum BASEMAP_REGS {
  RF1_REG1 = 0x0,
  RF1_REG2 = 0x10,
  RF1_REG3 = 0x20,
  RF2_REG1 = 0x100,
  RF2_REG2 = 0x110,
  RF2_REG3 = 0x120
};

/* RF1_REG1 register fields */
#define RF1_REG1_FLD1 GENMASK(7, 0)
#define RF1_REG1_FLD2 GENMASK(15, 8)
#define RF1_REG1_FLD3 GENMASK(23, 16)
#define RF1_REG1_FLD4 GENMASK(31, 24)

/* RF1_REG2 register fields */
#define RF1_REG2_FLD1 GENMASK(7, 0)
#define RF1_REG2_FLD2 GENMASK(15, 8)
#define RF1_REG2_FLD3 GENMASK(23, 16)
#define RF1_REG2_FLD4 GENMASK(31, 24)

/* RF1_REG3 register fields */
#define RF1_REG3_FLD1 GENMASK(7, 0)
#define RF1_REG3_FLD2 GENMASK(15, 8)
#define RF1_REG3_FLD3 GENMASK(23, 16)
#define RF1_REG3_FLD4 GENMASK(31, 24)

/* RF2_REG1 register fields */
#define RF2_REG1_FLD1 GENMASK(7, 0)
#define RF2_REG1_FLD2 GENMASK(15, 8)
#define RF2_REG1_FLD3 GENMASK(23, 16)
#define RF2_REG1_FLD4 GENMASK(31, 24)

/* RF2_REG2 register fields */
#define RF2_REG2_FLD1 GENMASK(7, 0)
#define RF2_REG2_FLD2 GENMASK(15, 8)
#define RF2_REG2_FLD3 GENMASK(23, 16)
#define RF2_REG2_FLD4 GENMASK(31, 24)

/* RF2_REG3 register fields */
#define RF2_REG3_FLD1 GENMASK(7, 0)
#define RF2_REG3_FLD2 GENMASK(15, 8)
#define RF2_REG3_FLD3 GENMASK(23, 16)
#define RF2_REG3_FLD4 GENMASK(31, 24)

#endif