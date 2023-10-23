require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3876.0.0-darwin-x64.tar.gz"
    sha256 "40c823122371368f11e90564923efee881aee1966ddd7e0011906413ae38ff93"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3876.0.0-darwin-arm64.tar.gz"
      sha256 "f8c6f83a951d23bb3eeb3e84d133387afcf49c150e586df079da2abb480a6bb3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3876.0.0-linux-x64.tar.gz"
    sha256 "5a79919479e379504b9624a5fd26da5b6274845f0e7d183f1452dd62334d6300"
  end
  version "3876.0.0"
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
