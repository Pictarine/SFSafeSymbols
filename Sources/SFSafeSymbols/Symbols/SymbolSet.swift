/// A collection encompassing all SFSymbols.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SymbolSet {
    internal var elements: [SFSymbol]
}

// MARK: Sequence
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SymbolSet: Sequence {
    public typealias Iterator = AnyIterator<SFSymbol>

    public func makeIterator() -> Iterator {
        var iterator = elements.makeIterator()
        return AnyIterator { iterator.next() }
    }
}

// MARK: Collection
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SymbolSet: Collection {
    public typealias Index = Array<SFSymbol>.Index

    public var startIndex: Index { elements.startIndex }
    public var endIndex: Index { elements.endIndex }

    public subscript (position: Index) -> Iterator.Element {
        precondition((startIndex ..< endIndex).contains(position), "Out of bounds")
        return elements[position]
    }

    public func index(after index: Index) -> Index {
        return elements.index(after: index)
    }
}
