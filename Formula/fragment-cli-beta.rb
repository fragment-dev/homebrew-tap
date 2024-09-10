require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5580.0.0-darwin-x64.tar.gz"
    sha256 "3410679986a9705162b451ce9f2f30d40521a246db81b73582a7709f8d8a4e7a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5580.0.0-darwin-arm64.tar.gz"
      sha256 "89bc6ed82613a5c63216a5745a10dcee9ce95db666c9a1d6e764f1417da40456"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5580.0.0-linux-x64.tar.gz"
    sha256 "2c06c10112aecc4d38157add85b6fd010ae0ccf78b4b226146b962d0d60597da"
  end
  version "5580.0.0"
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
