require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5735.0.0-darwin-x64.tar.gz"
    sha256 "c9985ca01c491c5cf01179569e8294ba873fcd3f46a4540531e2c8b7eab8efa5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5735.0.0-darwin-arm64.tar.gz"
      sha256 "e7b949b1988146b12d2400d64588af0b130df1db5a285553bdd3178825639cac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5735.0.0-linux-x64.tar.gz"
    sha256 "366ec0470aef9c7b8e93ee62f76bf98cb243117393eec21652559ca26d5e5d16"
  end
  version "5735.0.0"
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
