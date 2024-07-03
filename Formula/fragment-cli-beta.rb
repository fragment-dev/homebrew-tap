require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5349.0.0-darwin-x64.tar.gz"
    sha256 "4db5478f923185f0977ec1a0e5ddd7a4645e81c5f93d54b8acb8033723f43848"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5349.0.0-darwin-arm64.tar.gz"
      sha256 "5313f6a9ac451be789cf1b8149ddd6bd04fc95d14132ea0273363f21fdbccab6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5349.0.0-linux-x64.tar.gz"
    sha256 "c8c29cdb6ca22c75f445926f74793d48468ccaaedf01b78d76ec2840f8a00887"
  end
  version "5349.0.0"
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
