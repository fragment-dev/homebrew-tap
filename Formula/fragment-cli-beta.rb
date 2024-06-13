require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5266.0.0-darwin-x64.tar.gz"
    sha256 "fd37b56f91b9eb67994e342abbbbbafd2e5f876b1f80809a82393a20038c2feb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5266.0.0-darwin-arm64.tar.gz"
      sha256 "df25323f534dedcabd715bcc7284a8d5d002ce580a48699809d85aad442ce5a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5266.0.0-linux-x64.tar.gz"
    sha256 "efc396511c1940a326767d677d2d066e9fc68d11dca3815fd7174b56af35e283"
  end
  version "5266.0.0"
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
