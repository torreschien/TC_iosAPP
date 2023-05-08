import AVFAudio

let utterance = AVSpeechUtterance(string: "오늘이 한 칸이 채 안 남은 그런 시간 우리 소원을 빌며 웃던 그 시간 별 게 다 널 떠오르게 하지")

utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
utterance.rate = 0.5

let synthesizer = AVSpeechSynthesizer()
synthesizer.speak(utterance)
