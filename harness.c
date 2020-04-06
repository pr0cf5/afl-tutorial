#include "Python.h"
#include "longintrepr.h"
#include "code.h"
#include "marshal.h"

char *read_file(const char *filename, size_t *filesize) {
	FILE *fp = fopen(filename, "rb");
	fseek(fp, 0, SEEK_END);
	*filesize = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	if ((ssize_t)*filesize == -1) {
		return NULL;
	}
	char *buf = (char *)calloc(1, *filesize);
	if (!buf) {
		return NULL;
	}
	fread(buf, 1, *filesize, fp);
	return buf;
}

int main(int argc, char **argv) {

	if (argc != 2) {
		return -1;
	}
	if (!Py_IsInitialized()) {
		Py_Initialize();
	}
	char *data;
	size_t dataSize;
	data = read_file(argv[1], &dataSize);
	if (!data) {
		return -1;
	}
	PyObject *p = PyMarshal_ReadObjectFromString(data, dataSize);
	return 0;
}
