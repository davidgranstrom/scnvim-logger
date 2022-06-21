// Just an example class here to showcase that you can bundle SC classes with your scnvim extension!
// A suggestion is to prefix your class with `SCNvimExt`, but any other unique name should be fine.

SCNvimExtLogger {
	*new {
		^super.new;
	}

	printOn {arg stream;
		stream << "Hello from SCNvimExtLogger" << Char.nl;
	}
}
