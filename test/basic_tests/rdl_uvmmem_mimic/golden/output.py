#   Ordt 190725.01 autogenerated file 
#   Input: ./rdl_uvmmem_mimic/test.rdl
#   Parms: ./rdl_uvmmem_mimic/test.parms
#   Date: Sun Nov 17 17:09:43 EST 2019
#


from enum import Enum, auto

class ordt_drv_error(Enum):
    BAD_TAG = auto()
    BAD_PATH = auto()
    BAD_ADDRESS = auto()

class ordt_drv_return_type(Enum):
    REG = auto()
    REGSET = auto()
    FIELD = auto()

class ordt_drv_path_element:
    
    def __init__(self, name_str):
            sub_lst = name_str.split('[')
            if len(sub_lst)==2:
                self.name = sub_lst[0]
                self.idx = sub_lst[1].rstrip(']')
            else:
                self.name = name_str
                self.idx = 1
    

class ordt_drv_field:
    
    def __init__(self, name, loidx, width, readable, writeable, reset):
        self.name = name
        self.loidx = loidx
        self.width = width
        self.readable = readable
        self.writeable = writeable
        self.reset = reset
    

class ordt_drv_element:
    ORDT_PIO_DRV_VERBOSE = True
    
    def __init__(self, name):
        self.name = name
    
    def get_address_using_version(self, version, pathstr, address_in):
        path = self.get_pathlist(pathstr)
        if path:
            return self.get_address_using_list(version, path, False, address_in)
        if __class__.ORDT_PIO_DRV_VERBOSE:
            print('--> invalid path: ' + pathstr)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_path_instance_list_using_version(self, version, pathstr, path_instance_list_in):
        path = self.get_pathlist(pathstr)
        if path:
            return self.get_path_instance_list_using_list(version, path, False, path_instance_list_in)
        if __class__.ORDT_PIO_DRV_VERBOSE:
            print('--> invalid path: ' + pathstr)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_version(self, tag):
        if tag == 'top':
            return 0
        else:
            return -1
    
    def get_tags(self):
        tags = []
        tags.append('top')
        return tags
    
    def get_address_using_tag(self, tag, pathstr, address_in):
        version = self.get_version(tag)
        if version<0:
            if __class__.ORDT_PIO_DRV_VERBOSE:
                print('--> invalid tag: ' + tag)
            return {'error':ordt_drv_error.BAD_TAG}
        return self.get_address_using_version(version, pathstr, address_in)
    
    def get_path_instance_list_using_tag(self, tag, pathstr, path_instance_list_in):
        version = self.get_version(tag)
        if version<0:
            if __class__.ORDT_PIO_DRV_VERBOSE:
                print('--> invalid tag: ' + tag)
            return {'error':ordt_drv_error.BAD_TAG}
        return self.get_path_instance_list_using_version(version, pathstr, path_instance_list_in)
    
    def get_pathlist(self, pathstr):
        pathlist = []
        lst = pathstr.split('.')
        for str_elem in lst:
            path_elem = ordt_drv_path_element(str_elem)
            pathlist.append(path_elem)
        return pathlist
    
    def get_path_using_tag(self, tag, address, path_in):
        version = self.get_version(tag)
        if version<0:
            if __class__.ORDT_PIO_DRV_VERBOSE:
                print('--> invalid tag: ' + tag)
            return {'error':ordt_drv_error.BAD_TAG}
        return self.get_path_using_version(version, address, path_in)
    

class ordt_drv_regset_child:
    
    def __init__(self, version_map, child, reps, offset, stride):
        self.version_map = version_map
        self.child = child
        self.reps = reps
        self.offset = offset
        self.stride = stride
    
    def find_offset(self, address_in):
        if not self.stride:
            return (0, self.child.name)
        if (address_in < self.offset) or (address_in >= self.offset + self.reps*self.stride):
            return (0, None)
        if self.reps < 2:
            return (self.offset, '.' + self.child.name)
        index = (address_in - self.offset) // self.stride
        return (self.offset + index*self.stride, '.' + self.child.name + '[' + str(index) + ']')
    

class ordt_drv_regset(ordt_drv_element):
    
    def __init__(self, name):
        super().__init__(name)
        self.children = []
    
    def get_address_using_list(self, version, path, bypass_names, address_in):
        if not path:
            return {'error':ordt_drv_error.BAD_PATH}
        pelem = path[0]
        if not bypass_names:
            path.pop(0)
            if not path:
                return {'type':ordt_drv_return_type.REGSET, 'address':address_in, 'children':self.get_child_names(version)}
            pelem = path[0]
        for child in self.children:
            if ((1<<version) & child.version_map) and (bypass_names or (pelem.name == child.child.name)):
                address = address_in + child.offset
                if child.reps > 1:
                    address += child.stride*int(pelem.idx)
                return child.child.get_address_using_list(version, path, False, address)
        if __class__.ORDT_PIO_DRV_VERBOSE:
            print('--> unable to find child ' + pelem.name + ' in regset ' + self.name)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_path_instance_list_using_list(self, version, path, bypass_names, path_instance_list_in):
        if not path:
            return {'error':ordt_drv_error.BAD_PATH}
        pelem = path[0]
        if not bypass_names:
            path.pop(0)
            if not path:
                return {'type':ordt_drv_return_type.REGSET, 'instances':path_instance_list_in}
            pelem = path[0]
        for child in self.children:
            if ((1<<version) & child.version_map) and (bypass_names or (pelem.name == child.child.name)):
                path_instance_list = path_instance_list_in.copy()
                path_instance_list.append(child)
                return child.child.get_path_instance_list_using_list(version, path, False, path_instance_list)
        if __class__.ORDT_PIO_DRV_VERBOSE:
            print('--> unable to find child ' + pelem.name + ' in regset ' + self.name)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def add_child(self, version_map, child, reps, offset, stride):
        new_child = ordt_drv_regset_child(version_map, child, reps, offset, stride)
        self.children.append(new_child)
    
    def get_child_names(self, version):
        childnames = []
        for child in self.children:
            if (1<<version) & child.version_map:
                childnames.append(child.child.name)
        return childnames
    
    def get_path_using_version(self, version, address_in, path_in):
        for child in self.children:
            if (1<<version) & child.version_map:
                (match_addr, match_path) = child.find_offset(address_in)
                if match_path:
                    return child.child.get_path_using_version(version, address_in - match_addr, path_in + match_path)
        return {'error':ordt_drv_error.BAD_ADDRESS}
    

class ordt_drv_reg(ordt_drv_element):
    
    def __init__(self, name, width):
        super().__init__(name)
        self.fields = []
        self.width = width
    
    def get_address_using_list(self, version, path, bypass_names, address_in):
        if not path:
            return {'error':ordt_drv_error.BAD_PATH}
        path.pop(0)
        if not path:
            return {'type':ordt_drv_return_type.REG, 'address':address_in, 'width':self.width, 'fields':self.fields}
        if __class__.ORDT_PIO_DRV_VERBOSE:
            pelem = path[0]
            print('--> invalid child ' + pelem.name + ' specified in reg ' + self.name)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_path_instance_list_using_list(self, version, path, bypass_names, path_instance_list_in):
        if not path:
            return {'error':ordt_drv_error.BAD_PATH}
        path.pop(0)
        if not path:
            return {'type':ordt_drv_return_type.REG, 'instances':path_instance_list_in}
        if len(path) == 1:
            fname = path[0].name
            fld = self.get_field_by_name(fname)
            if fld:
                path_instance_list = path_instance_list_in.copy()
                path_instance_list.append(fld)
                return {'type':ordt_drv_return_type.FIELD, 'instances':path_instance_list}
        if __class__.ORDT_PIO_DRV_VERBOSE:
            pelem = path[0]
            print('--> invalid child ' + pelem.name + ' specified in reg ' + self.name)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_field_by_name(self, name):
        for fld in self.fields:
            if fld.name == name:
                return fld
    
    def add_field(self, name, loidx, width, readable, writeable, reset):
        new_field = ordt_drv_field(name, loidx, width, readable, writeable, reset)
        self.fields.append(new_field)
    
    def get_path_using_version(self, version, address_in, path_in):
        return {'type':ordt_drv_return_type.REG, 'path':path_in}
    

class ordt_drv_root(ordt_drv_regset):
    base_address = 0
    
    def __init__(self):
        super().__init__('root')
        self.build()
    
    def build(self):
        sr_repeat1_11 = ordt_drv_reg('sr_repeat1', 32)
        sr_repeat1_11.add_field('fld1', 0, 32, True, True, 0)
        srmem1_14 = ordt_drv_reg('srmem1', 32)
        srmem1_14.add_field('fld1', 0, 32, True, True, 0)
        wrmem1_15 = ordt_drv_reg('wrmem1', 128)
        wrmem1_15.add_field('fld1', 0, 16, True, True, 0)
        wrmem1_15.add_field('fld2', 16, 16, True, True, 0)
        wrmem1_15.add_field('fld3', 32, 16, True, True, 0)
        wrmem1_15.add_field('fld4', 48, 16, True, True, 0)
        wrmem1_15.add_field('fld5', 64, 16, True, True, 0)
        wrmem1_15.add_field('fld6', 80, 16, True, True, 0)
        wrmem1_15.add_field('fld7', 96, 16, True, True, 0)
        wrmem1_15.add_field('fld8', 112, 16, True, True, 0)
        sr_repeat3_13 = ordt_drv_reg('sr_repeat3', 32)
        sr_repeat3_13.add_field('fld1', 0, 32, True, True, 0)
        sr_repeat2_12 = ordt_drv_reg('sr_repeat2', 32)
        sr_repeat2_12.add_field('fld1', 0, 32, True, True, 0)
        wr1_10 = ordt_drv_reg('wr1', 128)
        wr1_10.add_field('fld1', 0, 16, True, True, 0)
        wr1_10.add_field('fld2', 16, 16, True, True, 0)
        wr1_10.add_field('fld3', 32, 16, True, True, 0)
        wr1_10.add_field('fld4', 48, 16, True, True, 0)
        wr1_10.add_field('fld5', 64, 16, True, True, 0)
        wr1_10.add_field('fld6', 80, 16, True, True, 0)
        wr1_10.add_field('fld7', 96, 16, True, True, 0)
        wr1_10.add_field('fld8', 112, 16, True, True, 0)
        sr1_9 = ordt_drv_reg('sr1', 32)
        sr1_9.add_field('fld1', 0, 32, True, True, 0)
        top_8 = ordt_drv_regset('top')
        top_8.add_child(1, sr_repeat1_11, 1, 512, 4)
        top_8.add_child(1, srmem1_14, 100, 8192, 4)
        top_8.add_child(1, wrmem1_15, 300, 131072, 16)
        top_8.add_child(1, sr_repeat3_13, 1, 520, 4)
        top_8.add_child(1, sr_repeat2_12, 1, 516, 4)
        top_8.add_child(1, wr1_10, 1, 256, 16)
        top_8.add_child(1, sr1_9, 1, 0, 4)
        self.add_child(1, top_8, 1, 0, 0)
    
    def get_address_using_version(self, version, pathstr, address_in):
        path = self.get_pathlist(pathstr)
        if path:
            return self.get_address_using_list(version, path, True, address_in)
        if __class__.ORDT_PIO_DRV_VERBOSE:
            print('--> invalid path: ' + pathstr)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_path_instance_list_using_version(self, version, pathstr, path_instance_list_in):
        path = self.get_pathlist(pathstr)
        if path:
            return self.get_path_instance_list_using_list(version, path, True, path_instance_list_in)
        if __class__.ORDT_PIO_DRV_VERBOSE:
            print('--> invalid path: ' + pathstr)
        return {'error':ordt_drv_error.BAD_PATH}
    
    def get_address(self, tag, pathstr):
        '''return address given a path string and tag'''
        return self.get_address_using_tag(tag, pathstr, __class__.base_address)
    
    def get_path_instance_list(self, tag, pathstr):
        '''return list of model elements given a path string and tag'''
        return self.get_path_instance_list_using_tag(tag, pathstr, [])
    
    def get_path(self, tag, address):
        '''return path string given an address and tag'''
        return self.get_path_using_tag(tag, address, '')
    

