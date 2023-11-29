|newRepository|
Smalltalk vm maxExternalSemaphoresSilently: 1000.
newRepository := IceRepositoryCreator new
				repository: nil;
				location: '.' asFileReference ;
				createRepository .
newRepository register.

CSCreateWebApp appFolder: './build/post' asFileLocatorOrReference  ensureCreateDirectory.
CSCreateWebApp ressourcePrefix: '..'.
CSCreateWebApp makeIndex.
CSCreateWebApp exportApp.
