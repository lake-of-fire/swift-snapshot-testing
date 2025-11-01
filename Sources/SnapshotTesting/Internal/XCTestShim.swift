#if os(WASI)
import Foundation

public struct XCTAttachment {
  public var name: String?
  public init(data: Data) {}
  public init(data: Data, uniformTypeIdentifier: String) {}
  public init(uniformTypeIdentifier: String?, name: String?, payload: Data) {
    self.name = name
  }
  public init(contentsOfFile url: URL) {}
#if canImport(UIKit)
  public init(image: UIImage) {}
#endif
#if canImport(AppKit)
  public init(image: NSImage) {}
#endif
}

public final class XCTestExpectation {
  public init(description: String = "") {}
  public func fulfill() {}
}

public enum XCTWaiter {
  public enum Result {
    case completed
    case timedOut
    case incorrectOrder
    case invertedFulfillment
    case interrupted
  }

  @discardableResult
  public static func wait(
    for expectations: [XCTestExpectation],
    timeout: TimeInterval
  ) -> Result {
    return .completed
  }
}

public func XCTFail(
  _ message: String = "",
  file: StaticString = #file,
  line: UInt = #line
) {}

public protocol XCTestObservation {}

public final class XCTestObservationCenter {
  public static let shared = XCTestObservationCenter()
  public func addTestObserver(_ observer: XCTestObservation) {}
}

public class XCTestCase {}

public enum XCTContext {
  public struct Activity {
    public func add(_ attachment: XCTAttachment) {}
  }

  @discardableResult
  public static func runActivity<Result>(
    named name: String,
    block: (Activity) -> Result
  ) -> Result {
    return block(Activity())
  }
}

public func uniformTypeIdentifier(fromExtension pathExtension: String) -> String? {
  nil
}
#endif
