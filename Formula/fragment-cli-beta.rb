require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2343.0.0-darwin-x64.tar.gz"
    sha256 "e99cfb10747fc41e096acfeb1cd313aad1284712ca13e4a992ae1e64eb39d450"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2343.0.0-darwin-arm64.tar.gz"
      sha256 "dea062a2665ab18a9a7a22f00073bc22ba507dc2437e6936d8d3b4d1acaedc11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2343.0.0-linux-x64.tar.gz"
    sha256 "752b9e9d5c6214ff3f0c2734dccba1b779bba9a1a7136f8eeef749c5a4c27167"
  end
  version "2343.0.0"
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
