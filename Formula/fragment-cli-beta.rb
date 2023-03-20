require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2242.0.0-darwin-x64.tar.gz"
    sha256 "d6df25e15861aa12186d551e17df9abb8ade237be3ff698a8d8510e42e606140"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2242.0.0-darwin-arm64.tar.gz"
      sha256 "ac4531e281ea1b2e18c2b98adc536e7f5d79086bf6784753f916bb2e821b7b83"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2242.0.0-linux-x64.tar.gz"
    sha256 "b08018408537fb559a8971cfb2a8e1f06ee50744550eaedb95266f99e2f2cdcb"
  end
  version "2242.0.0"
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
