name    test1;

bindapi "test1"      "OpenCOBOL"  "TEST1";

data {
    spa spa;
    window {
        test1;
    };
};

db {
	tbl_fetch_test;
};

db "blob" {
	blob;
};

db "msgarray" {
	ma;
};
