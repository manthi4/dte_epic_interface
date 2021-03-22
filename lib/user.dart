

/// Everything in this class should be static. There is only one user, so instead of instantiating a new user
/// object whenever we use itm it is much cleaner to use one static class.
/// This class is essentially the "buisness logic" part of the app. So whenever you need to access Firebase or get
/// data from anywhere, place those methods in here.
///TODO: lol, actually put stuff in here