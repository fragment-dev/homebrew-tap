require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6096.0.0-darwin-x64.tar.gz"
    sha256 "e6150e98f09af286b0c2671f21cc33931eb532a4442a58b10a5949f581bbe581"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6096.0.0-darwin-arm64.tar.gz"
      sha256 "cfdb37430232ae8a4a3322938a60067f29a4c3dade5510c69bcdb11530ef4e72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6096.0.0-linux-x64.tar.gz"
    sha256 "83a67a2d073fadb7d6984370983d85c43e2aa349c2994cfdb80d88058ac6fbdd"
  end
  version "6096.0.0"
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
