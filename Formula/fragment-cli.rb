require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.20-darwin-x64.tar.gz"
    sha256 "d720e6e25732c2ebe950c45411c74eaaeffbf10fcbbde4142018cfab4574c2f1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.20-darwin-arm64.tar.gz"
      sha256 "4d5409a1e8203cee265201bd4bc9360df0203dd995eac29becda27b1ef2de391"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.20-linux-x64.tar.gz"
    sha256 "21efff7c1831db073aaad9efb6272b8bfd11e395a1ce5d55d8175f746d494c36"
  end
  version "2023.6.20"
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
