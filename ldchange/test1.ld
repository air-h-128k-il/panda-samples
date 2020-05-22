name    test1;

bind    ""         "OpenCOBOL"  "TEST1";
bind    "test1"    "OpenCOBOL"  "TEST1";
bind    "test2"    "OpenCOBOL"  "TEST2";

data {
    spa spa;
    window {
        test1;
        test2;
    };
};

db {
  dummy;
};
