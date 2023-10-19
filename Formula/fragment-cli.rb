require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.19-darwin-x64.tar.gz"
    sha256 "5db3ce306928a12f088f092176ebff00753f7cb4fc4f07f5b69e1152147153ac"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.19-darwin-arm64.tar.gz"
      sha256 "1e94e757b362fba3047f97a7599a456451ff22a52af9c223d2932d67674c0889"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.19-linux-x64.tar.gz"
    sha256 "000f8a6d37afa4592982f50942082bb663ea27e1228e4f3c6ba236dddfe34886"
  end
  version "2023.10.19"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
