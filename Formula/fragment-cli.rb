require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.1-1-darwin-x64.tar.gz"
    sha256 "a1185a8db043ebeed2a00ef4d9250bb616965813d32a45c828279b75bf097383"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.1-1-darwin-arm64.tar.gz"
      sha256 "470a8bfaed0ffa99e7e6f58127430bb2b7621ff090faa0b78732c5065b1c2c0c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.1-1-linux-x64.tar.gz"
    sha256 "47beb6190c343c24f8720e57505512cfef1b25068ef346947852c4973c3109fe"
  end
  version "2024.5.1-1"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
