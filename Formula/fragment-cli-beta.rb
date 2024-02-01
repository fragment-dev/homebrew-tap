require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4480.0.0-darwin-x64.tar.gz"
    sha256 "8772c71ae580ab9c091a3ff43a85781806bc1066782984d9dc659e60845b8b88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4480.0.0-darwin-arm64.tar.gz"
      sha256 "cc5585403b528de91332720179fea2c6ee420b325b8785f1f908df9e73682bc1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4480.0.0-linux-x64.tar.gz"
    sha256 "6f0b2c75f2913342d09062ebe5fcc8cca9d62a7fff313f8d5ff2c231c96dd3b1"
  end
  version "4480.0.0"
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
