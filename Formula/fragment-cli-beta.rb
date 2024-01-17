require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4353.0.0-darwin-x64.tar.gz"
    sha256 "fc75af305fa2772892a66ffeba245ca3e3bd42511df79ca30dfd6fa4fc9be9b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4353.0.0-darwin-arm64.tar.gz"
      sha256 "5b7900f6efb46eefec415fae1fed1e4c309434321793a645922069a417b08d93"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4353.0.0-linux-x64.tar.gz"
    sha256 "ea9b860756f239bb17019770a7e01a0ba921bf0bdfb190a1ebd25566054098b9"
  end
  version "4353.0.0"
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
