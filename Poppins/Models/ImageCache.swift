class Cache<T> {
    var cache: [String: T] = [:]

    init() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("didRecieveMemoryWarning"), name: UIApplicationDidReceiveMemoryWarningNotification, object: .None)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func didRecieveMemoryWarning() {
        cache.removeAll(keepCapacity: false)
    }

    func itemForKey(key: String) -> T? {
        return cache[key]
    }

    func setItem(item: T, forKey key: String) {
        cache[key] = item
    }
}