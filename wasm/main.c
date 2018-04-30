#include "picornt.c"

int find_faces(
	float rcsq[],
	int maxndetections,
	unsigned char pixels[],
	int nrows,
	int ncols,
	int ldim,
	float scalefactor,
	float shiftfactor,
	float minfacesize,
	float maxfacesize
)
{
	static char facefinder[] = {
		#include "facefinder.hex"
	};

	return find_objects(
			rcsq, maxndetections,
			facefinder,
			0.0f,
			pixels, nrows, ncols, ldim,
			scalefactor, shiftfactor,
			minfacesize, maxfacesize
	);
}
