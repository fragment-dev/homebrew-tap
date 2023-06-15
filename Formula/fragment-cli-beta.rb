require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2861.0.0-darwin-x64.tar.gz"
    sha256 "8c5f2e9d79df1a2cdd0c2e866cbd33149868c4d4d4714ea205c69ab64de5d0af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2861.0.0-darwin-arm64.tar.gz"
      sha256 "e0dae96f6e399b341df26b3bf39398194848f1d6d9a1ddfbe0d35ed327051a02"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2861.0.0-linux-x64.tar.gz"
    sha256 "03cd83b1f051752b1ce2fe5f17db80bd112e404c7c16febc61823cae8820ad77"
  end
  version "2861.0.0"
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
