require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.1-darwin-x64.tar.gz"
    sha256 "79d22ac5da2070bef744ef4c70fdbef7cffb3ee09dead01da7fc4d184befec2e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.1-darwin-arm64.tar.gz"
      sha256 "6508eeab7d53a3bbeff75b40a920865fad2be8c40e6388c18d22e2003adda7c0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.1-linux-x64.tar.gz"
    sha256 "97c95bb25dbdc53509cd662573e350b50003e6954dfab0e9a2a1b345099c084e"
  end
  version "2023.11.1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
