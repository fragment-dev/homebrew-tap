require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3767.0.0-darwin-x64.tar.gz"
    sha256 "d5c44683ff03f9e06f06bc04ffe536e60261763b985a098d5826fae97a331f1d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3767.0.0-darwin-arm64.tar.gz"
      sha256 "28c233caa34bfe11f682f6c152245ae41c558582f9a5015e8037b48f25587b7c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3767.0.0-linux-x64.tar.gz"
    sha256 "dad2272677b8e6c5354b74c854d5b6807c910f8652a988c2008219e001aede1d"
  end
  version "3767.0.0"
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
