name    test1;

bindapi "test1"      "OpenCOBOL"  "TEST1";

data {
    spa spa;
    window {
        test1;
    };
};

db {
	dummy;
};

db "blob" {
	blob;
};

db "xml2" {
	xml2;
};
