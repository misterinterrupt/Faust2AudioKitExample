// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation
import AudioKit
import CAudioKit

/// Clips a signal to a predefined limit, in a "soft" manner, using one of three
/// methods.
///
public class MyOsc: Node, AudioUnitContainer, Toggleable {

    /// Unique four-letter identifier "dclp"
    public static let ComponentDescription = AudioComponentDescription(instrument: "fosc")

    /// Internal type of audio unit for this node
    public typealias AudioUnitType = InternalAU

    /// Internal audio unit
    public private(set) var internalAU: AudioUnitType?

    // MARK: - Parameters

    /// Specification for the cutoff frequency
    public static let freqDef = NodeParameterDef(
        identifier: "freq",
        name: "Frequency (Hz)",
        address: akGetParameterAddress("FaustMyOscParameterFreq"),
        range: 12.0 ... 20_000.0,
        unit: .hertz,
        flags: .default)

    /// Filter cutoff frequency.
    @Parameter public var freq: AUValue

    /// Specification for the gain
    public static let gainDef = NodeParameterDef(
        identifier: "gain",
        name: "Gain",
        address: akGetParameterAddress("FaustMyOscParameterGaindB"),
        range: 0.0 ... 40.0,
        unit: .decibels,
        flags: .default)

    /// Determines the amount of gain applied to the signal before waveshaping. A value of 1 gives slight distortion.
    @Parameter public var gain: AUValue

    // MARK: - Audio Unit

    /// Internal audio unit for diode clipper
    public class InternalAU: AudioUnitBase {
        /// Get an array of the parameter definitions
        /// - Returns: Array of parameter definitions
        public override func getParameterDefs() -> [NodeParameterDef] {
            [MyOsc.freqDef,
             MyOsc.gainDef]
        }

        /// Create diode clipper DSP
        /// - Returns: DSP Reference
        public override func createDSP() -> DSPRef {
            akCreateDSP("FaustMyOscDSP")
        }
    }

    // MARK: - Initialization

    /// Initialize this node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - freq: Pitch frequency
    ///   - gain: Gain in dB
    ///
    public init(freq: AUValue = 330.0,
                gain: AUValue = 0.5
    ) {
        super.init(avAudioNode: AVAudioNode())

        instantiateAudioUnit { avAudioUnit in
            self.avAudioUnit = avAudioUnit
            self.avAudioNode = avAudioUnit

            self.internalAU = avAudioUnit.auAudioUnit as? AudioUnitType

            self.stop()
            self.freq = freq
            self.gain = gain
        }
    }
}
