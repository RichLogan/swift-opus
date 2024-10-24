import AVFoundation

extension Opus {
	class Packet {
		public static func getNumberChannels(_ input: Data) throws -> AVAudioChannelCount {
			try input.withUnsafeBytes {
				let input = $0.bindMemory(to: UInt8.self)
				let channelCount = opus_packet_get_nb_channels(input.baseAddress!)
				if channelCount < 0 {
					throw Opus.Error(channelCount)
				}
				return AVAudioChannelCount(channelCount)
			}
		}
	}
}
